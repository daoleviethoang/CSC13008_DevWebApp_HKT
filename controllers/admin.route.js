// TODO: check invalid username
const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const teacherModel = require('../models/teacher.model');
const adminModel = require('../models/admin.model');
const auth = require('../middlewares/auth.mdw');
const { getLogger } = require('nodemailer/lib/shared');
const router = express.Router();
const nodemailer = require("nodemailer"); //gửi mail

router.get('/register/', async function(req, res) {
    res.render('vwAdmin/ProvideAccount', {
        layout: false
    });
})

const transporter = nodemailer.createTransport({ //cấu hình mail server
    host: "smtp.gmail.com",
    port: 465,
    secure: true,
    service: "Gmail",
    auth: {
        user: "kiethoang611@gmail.com",
        pass: "Kiet6112000",
    },
});

const emailAndOtp = {}; // Temporary save email and their otp here      //save dictionary với key là email, value là otp


router.post('/otp', async function(req, res) { //nhận data từ file register.hbs
    let username = req.body.username;
    let email = req.body.email;
    const check_username = await userModel.getUserByUserName(username); //trả về null nếu ko có
    const check_email = await userModel.getUserByEmail(email)
    if (check_username !== null) { //nếu có r thì dk lại
        res.render('vwAdmin/ProvideAccount', {
            layout: false,
            msg: "Username existed"
        });
    } else if (check_email !== null) {
        res.render('vwAdmin/ProvideAccount', {
            layout: false,
            msg: "Email existed"
        });
    } else {
        let otp = parseInt((Math.random() * 1000000).toString()); //tạo otp random
        let email = req.body.email;

        // send mail with defined transport object
        var mailOptions = {
            to: req.body.email,
            subject: "Otp for registration is: ",
            html: "<h3>OTP for account verification is </h3>" +
                "<h1 style='font-weight:bold;'>" +
                otp +
                "</h1>", // html body
        };

        transporter.sendMail(mailOptions, (error, info) => { //gửi mail
            if (error) {
                return console.log(error);
            }
            console.log("Message sent: %s", info.messageId);
            console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));

            // OTP page will take email as a query statement for it POST methods
            emailAndOtp[email] = otp;
            res.render("vwAdmin/verify", { //xác minh
                msg: "An OTP has been sent to your email",
                Data: {
                    fullname: req.body.fullname,
                    username: req.body.username,
                    password: req.body.password,
                    confirm: req.body.confirm,
                    email: email,
                    dob: req.body.dob,
                    gender: req.body.gender,
                    userType: req.body.userType
                },
                layout: false
            });
        });
    }

})

router.post("/resend", function(req, res) { //giống send

    let email = req.body.email;
    let otp = emailAndOtp[email];

    var mailOptions = {
        to: email,
        subject: "Otp for registration is: ",
        html: "<h3>OTP for account verification is </h3>" +
            "<h1 style='font-weight:bold;'>" +
            otp +
            "</h1>", // html body
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            return console.log(error);
        }
        console.log("Message sent: %s", info.messageId);
        console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
        res.render("vwAdmin/verify", {
            msg: "OTP has been resent",
            Data: {
                fullname: req.body.fullname,
                username: req.body.username,
                password: req.body.password,
                confirm: req.body.confirm,
                email: email,
                dob: req.body.dob,
                gender: req.body.gender,
                userType: req.body.userType
            },
            layout: false
        });
    });
});

router.post("/verify", async function(req, res) { //xác minh OTP
    let email = req.body.email; //lấy email để so sánh trong emailAndOtp
    let otp = emailAndOtp[email];
    // delete emailAndOtp[email]; 
    if (req.body.otp == otp) { //OTP đúng
        const hashedPass = bcryptjs.hashSync(req.body.password, 12);
        // const dob = await moment(req.body.dob, 'MM/DD/YYYY').format('YYYY-MM-DD');
        const dob = req.body.dob;
        let gender;
        let permission;
        let user_Detail;
        let UID = "";
        let check = 0;
        let block = 0;

        if (req.body.gender === "Male") gender = 1;
        else if (req.body.gender === "Female") gender = 2;
        else gender = 3;
        if (req.body.userType === 'STUDENT') {
            permission = studentModel.STUDENT_PROPERTIES.permission;
            UID = `St${await studentModel.largest_ID() + 1}`;
            user_Detail = {
                name: req.body.fullname,
                email: req.body.email,
                dob: dob,
                gender: gender,
                UID: UID,
            }
            check = 1;
        } else if (req.body.userType === 'TEACHER') {
            permission = teacherModel.TEACHER_PROPERTIES.permission;
            UID = `Tea${await teacherModel.largest_ID() + 1}`;
            //console.log(UID);
            user_Detail = {
                name: req.body.fullname,
                email: req.body.email,
                dob: dob,
                gender: gender,
                UID: UID
            }
            check = 2;
        }
        const user = {
            username: req.body.username,
            password: hashedPass,
            permission: permission,
            UID: UID,
            block: block
        }
        await userModel.add(user);
        if (check == 1) {
            await studentModel.add(user_Detail, studentModel.STUDENT_PROPERTIES.table_name)
        } else if (check == 2) {
            await teacherModel.add(user_Detail, teacherModel.TEACHER_PROPERTIES.table_name);
        }
        res.redirect('/admin/teacher');

    } else { //OTP sai
        res.render("vwAdmin/verify", {
            msg: "Your OTP is incorrect, please try again",
            Data: {
                fullname: req.body.fullname,
                username: req.body.username,
                password: req.body.password,
                confirm: req.body.confirm,
                email: email,
                dob: req.body.dob,
                gender: req.body.gender,
                userType: req.body.userType
            },
            layout: false
        });
    }
});

router.get('/', async function(req, res) {
    res.render('vwAdmin/index', {
        layout: false,
    });
})
router.get('/category', async function(req, res) {
    var dataCategory = await adminModel.getCategory();
    console.log(dataCategory[0].CountCourse);
    res.render('vwAdmin/category', {
        dataCategory: dataCategory,
        layout: false
    });

})
router.get('/chart', async function(req, res) {
    res.render('vwAdmin/charts', {
        layout: false,
    });
})
router.get('/course', async function(req, res) {
    var dataCourse = await adminModel.getCourse();
    var matrixData = [];
    for (var i = 0; i < dataCourse.length; i++) {
        var dataSectionCourse = await adminModel.getSectionCourse(dataCourse[i].CoursesID);
        matrixData[i] = new Array(dataCourse[i]);
        matrixData[i].push(dataSectionCourse);
    }
    for (var i = 0 in matrixData) {
        matrixData[i][0].LastUpdate = formatDate(matrixData[i][0].LastUpdate);
        matrixData[i][0].DateCreated = formatDate(matrixData[i][0].DateCreated);
    }
    // res.send(matrixData[0][0]);
    res.render('vwAdmin/course', {
        matrixData: matrixData,
        layout: false
    });
})

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}
router.get('/student', async function(req, res) {
    var dataStudent = await adminModel.getStudent();
    for (var i = 0 in dataStudent) {
        dataStudent[i].dob = formatDate(dataStudent[i].dob);
    }
    console.log(dataStudent);
    res.render('vwAdmin/student', {
        dataStudent: dataStudent,
        layout: false
    });
})
router.get('/teacher', async function(req, res) {
    var dataTeacher = await adminModel.getTeacher();
    for (var i = 0 in dataTeacher) {
        dataTeacher[i].dob = formatDate(dataTeacher[i].dob);
    }
    console.log(dataTeacher);
    res.render('vwAdmin/teacher', {
        dataTeacher: dataTeacher,
        layout: false
    });
})
router.get('/student/delete/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    await adminModel.delStudentInStudent(UID);
    await adminModel.delStudentInUsers(UID);
    var dataStudent = await adminModel.getStudent();
    for (var i = 0 in dataStudent) {
        dataStudent[i].dob = formatDate(dataStudent[i].dob);
    }
    res.render('vwAdmin/student', {
        dataStudent: dataStudent,
        layout: false
    });
})
router.post('/student/edit/:id', async function(req, res) {
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    const name = req.body.sname;
    const dob = req.body.sDOB;
    const gender = req.body.sGender;
    let gt = 0;
    if (gender == "Male") {
        gt = 1;
    } else if (gender == "Female") {
        gt = 0;
    }
    await adminModel.editStudent(UID, name, dob, gt);
    res.redirect('/admin/student');
})
router.get('/student/block/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    let check = 0;
    var dataStudent = await adminModel.getStudent();
    for (var i = 0 in dataStudent) {
        if (dataStudent[i].UID == UID) {
            if (dataStudent[i].block == 1) {
                await adminModel.blockStudent(UID, 0);
                dataStudent[i].block = 0;
                check = 1;
                break;
            }
        }
    }
    if (check == 0) {
        await adminModel.blockStudent(UID, 1);
    }
    var dataStudent = await adminModel.getStudent();
    for (var i = 0 in dataStudent) {
        dataStudent[i].dob = formatDate(dataStudent[i].dob);
    }
    res.redirect('/admin/student');
    // res.render('vwAdmin/student', {
    //     dataStudent: dataStudent,
    //     layout: false
    // });
})
router.get('/teacher/delete/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    await adminModel.delTeacherInTeacher(UID);
    await adminModel.delTeacherInUsers(UID);
    var dataTeacher = await adminModel.getTeacher();
    for (var i = 0 in dataTeacher) {
        dataTeacher[i].dob = formatDate(dataTeacher[i].dob);
    }
    res.render('vwAdmin/teacher', {
        dataTeacher: dataTeacher,
        layout: false
    });
})
router.post('/teacher/edit/:id', async function(req, res) {
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    const name = req.body.sname;
    const dob = req.body.sDOB;
    const gender = req.body.sGender;
    let gt = 0;
    if (gender == "Male") {
        gt = 1;
    } else if (gender == "Female") {
        gt = 0;
    }
    await adminModel.editTeacher(UID, name, dob, gt);
    res.redirect('/admin/teacher');
})
router.get('/teacher/block/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const UID = url[url.length - 1];
    let check = 0;
    var dataTeacher = await adminModel.getTeacher();
    for (var i = 0 in dataTeacher) {
        if (dataTeacher[i].UID == UID) {
            if (dataTeacher[i].block == 1) {
                await adminModel.blockTeacher(UID, 0);
                dataTeacher[i].block = 0;
                check = 1;
                break;
            }
        }
    }
    if (check == 0) {
        await adminModel.blockTeacher(UID, 1);
    }
    var dataTeacher = await adminModel.getTeacher();
    for (var i = 0 in dataTeacher) {
        dataTeacher[i].dob = formatDate(dataTeacher[i].dob);
    }
    res.redirect('/admin/teacher');
    // res.render('vwAdmin/student', {
    //     dataStudent: dataStudent,
    //     layout: false
    // });
})
router.get('/course/delete/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const CoursesID = url[url.length - 1];
    await adminModel.delCourseInSection(CoursesID);
    await adminModel.delCourseInCourse(CoursesID);
    var dataCourse = await adminModel.getCourse();
    var matrixData = [];
    for (var i = 0; i < dataCourse.length; i++) {
        var dataSectionCourse = await adminModel.getSectionCourse(dataCourse[i].CoursesID);
        matrixData[i] = new Array(dataCourse[i]);
        matrixData[i].push(dataSectionCourse);
    }
    for (var i = 0 in matrixData) {
        matrixData[i][0].LastUpdate = formatDate(matrixData[i][0].LastUpdate);
        matrixData[i][0].DateCreated = formatDate(matrixData[i][0].DateCreated);
    }
    res.render('vwAdmin/course', {
        matrixData: matrixData,
        layout: false
    });
})
router.get('/course/block/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const CoursesID = url[url.length - 1];
    let check = 0;
    var dataCourse = await adminModel.getCourse();
    for (var i = 0 in dataCourse) {
        if (dataCourse[i].CoursesID == CoursesID) {
            if (dataCourse[i].block == 1) {
                await adminModel.blockCourse(CoursesID, 0);
                dataCourse[i].block = 0;
                check = 1;
                break;
            }
        }
    }
    if (check == 0) {
        await adminModel.blockCourse(CoursesID, 1);
    }

    var dataCourse = await adminModel.getCourse();
    var matrixData = [];
    for (var i = 0; i < dataCourse.length; i++) {
        var dataSectionCourse = await adminModel.getSectionCourse(dataCourse[i].CoursesID);
        matrixData[i] = new Array(dataCourse[i]);
        matrixData[i].push(dataSectionCourse);
    }
    for (var i = 0 in matrixData) {
        matrixData[i][0].LastUpdate = formatDate(matrixData[i][0].LastUpdate);
        matrixData[i][0].DateCreated = formatDate(matrixData[i][0].DateCreated);
    }
    // res.render('vwAdmin/course', {
    //     matrixData: matrixData,
    //     layout: false
    // });
    res.redirect('/admin/course');
})
router.post('/category/edit/:id', async function(req, res) {
    var url = req.url.split("/");
    const SubCategoryID = url[url.length - 1];
    const namecate = req.body.namecate;
    const namescate = req.body.namescate;
    await adminModel.editSubCategory(SubCategoryID, namescate);
    await adminModel.editCategory(1, namecate);
    res.redirect('/admin/category');
})

module.exports = router;
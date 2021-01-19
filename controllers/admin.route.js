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


router.get('/', async function(req, res) {
    res.render('vwAdmin/index', {
        layout: false,
    });
})
router.get('/category', async function(req, res) {
    res.render('vwAdmin/category', {
        layout: false,
    });
    // const db = await userModel.getInforCate();
    // console.log(db);
    // res.render('vwAdmin/admin-category', {
    //     layout: false,
    //     db: db
    // });
})
router.get('/chart', async function(req, res) {
    res.render('vwAdmin/charts', {
        layout: false,
    });
    // const db = await userModel.getInforCate();
    // console.log(db);
    // res.render('vwAdmin/admin-category', {
    //     layout: false,
    //     db: db
    // });
})
router.get('/course', async function(req, res) {
    res.render('vwAdmin/course', {
        layout: false,
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
module.exports = router;
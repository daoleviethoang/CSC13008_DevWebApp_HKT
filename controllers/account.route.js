// TODO: check invalid username
const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const teacherModel = require('../models/teacher.model');
const auth = require('../middlewares/auth.mdw');
const router = express.Router();




router.get('/register', async function(req, res, next) {
    res.render('vwAccounts/register', {
        layout: false
    });
})

router.post('/register', async function(req, res, next) {
    const hashedPass = bcryptjs.hashSync(req.body.password, 12);
    const dob = await moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

    let gender;
    let permission;
    let user_Detail;
    let UID = "";

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
            UID: UID
        }
        await studentModel.add(user_Detail, studentModel.STUDENT_PROPERTIES.table_name)
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
        await teacherModel.add(user_Detail, teacherModel.TEACHER_PROPERTIES.table_name);
    }
    const user = {
        username: req.body.username,
        password: hashedPass,
        permission: permission,
        UID: UID
    }

    await userModel.add(user);
    res.redirect('/account/login');
})



//not use yet
router.get('/is-available', async function(req, res) {
    const username = req.query.user;
    const user = await userModel.singleByUserName(username);
    if (user === null) {
        return res.json(true);
    }

    res.json(false);
})


router.get('/login', async function(req, res) {
    res.render('vwAccounts/login', {
        layout: false
    })
})

router.post('/login', async function(req, res, next) {
    const user = await userModel.singleByUserName(req.body.username);

    if (user === null) {
        return res.render('vwAccounts/login', {
            layout: false,
            err_message: 'Invalid username'
        });
    }
    const ret = bcryptjs.compareSync(req.body.password, user.password);
    if (ret === false) {
        return res.render('vwAccounts/login', {
            layout: false,
            err_message: 'Invalid password'
        });
    }
    let userDetail;
    if (user.permission === teacherModel.TEACHER_PROPERTIES.permission) {
        const teacher = await teacherModel.singleFromUID(user.UID);
        userDetail = {
            username: user.username,
            Name: teacher.Name,
            ID: teacher.UID,
            TeaID: teacher.TeaID,
            permission: teacherModel.TEACHER_PROPERTIES.permission
        }
    }
    if (user.permission === studentModel.STUDENT_PROPERTIES.permission) {
        const student = await studentModel.singleFromUID(user.UID);
        //console.log(student)
        userDetail = {
            username: user.username,
            Name: student.Name,
            ID: student.UID,
            StuID: student.StuID,
            permission: studentModel.STUDENT_PROPERTIES.permission
        }
    }
    //console.log(userDetail)
    req.session.auth = true;
    req.session.authUser = userDetail;
    const url = '/';
    res.redirect(url)
})
router.post('/logout', async function(req, res) {
    //console.log("logout")
    req.session.auth = false;
    req.session.authUser = null;
    req.session.retUrl = null;
    req.session.cart = [];

    const url = req.headers.referer || '/';
    res.redirect(url);
})


module.exports = router;
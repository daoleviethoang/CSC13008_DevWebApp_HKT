// TODO: check invalid username
const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const teacherModel = require('../models/teacher.model');
const adminModel = require('../models/admin.model');
const auth = require('../middlewares/auth.mdw');
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
    res.render('vwAdmin/teacher', {
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
router.get('/student/edit/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    res.send(url[url.length - 1]);
})
router.get('/student/block/:id', async function(req, res) {
    // var newStudentData = await adminModel.deleteStudent(UID);
    var url = req.url.split("/");
    const UID = url[url.length - 1];

})

module.exports = router;
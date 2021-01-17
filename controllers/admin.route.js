// TODO: check invalid username
const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const teacherModel = require('../models/teacher.model');
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
router.get('/student', async function(req, res) {
    res.render('vwAdmin/student', {
        layout: false
    });
})
router.get('/teacher', async function(req, res) {
    res.render('vwAdmin/teacher', {
        layout: false
    });
})

module.exports = router;
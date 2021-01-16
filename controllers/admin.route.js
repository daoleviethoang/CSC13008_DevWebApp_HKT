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

    res.render('vwAdmin/admin-dashboard', {
        layout: false,

    });
})
router.get('/courses', async function(req, res) {
    res.render('vwAdmin/admin-course', {
        layout: false
    });
})
router.get('/categories', async function(req, res) {
    const db = await userModel.getInforCate();
    console.log(db);
    res.render('vwAdmin/admin-category', {
        layout: false,
        db: db
    });
})
router.get('/teachers', async function(req, res) {
    res.render('vwAdmin/admin-leturer', {
        layout: false
    });
})
router.get('/students', async function(req, res) {
    res.render('vwAdmin/admin-student', {
        layout: false
    });
})
module.exports = router;
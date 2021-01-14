// TODO: check invalid username
const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const teacherModel = require('../models/teacher.model');
const auth = require('../middlewares/auth.mdw');
const { get } = require('./account.route');
const router = express.Router();
const courseModel = require('../models/course.model');
var controller = require("../models/IndexController");




router.get('/profile/:username', async function(req, res) {
    console.log(req.params.username);
    const user = await userModel.getUserByUserName(req.params.username);
    console.log(user);
    console.log(user.username)
    var permiss = false;
    if (user.permission == 1) {
        permiss = true;
    }
    res.render('vwAccounts/profile', {
        user: user,
        permiss: permiss
    });
})
router.post('user/profile/dlvh/save', async function(req, res) {

})


module.exports = router;
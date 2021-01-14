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


router.post('/profile/save/:username', async function(req, res) {
    const name = req.body.name;
    const email = req.body.email;
    const cpassword = req.body.cpassword;
    const npassword = req.body.npassword;
    const cfpassword = req.body.cfpassword;
    const Uname = req.params.username;
    const user = await userModel.getUserByUserName(Uname);
    const userPass = await userModel.singleByUserName(Uname);

    if (cpassword != '') {
        const ret = bcryptjs.compareSync(cpassword, userPass.password);
        if (ret === false) {
            return res.render('vwAccounts/profile', {
                err_message: 'Invalid password'
            });
        }
        const hashedPass = bcryptjs.hashSync(npassword, 12);
        await userModel.updatePassWord(Uname, hashedPass);
        res.redirect('/profile/:username');
    }
    if (user.permission == 1) {
        if (name != '') {
            await userModel.updateNameStudent(Uname, name);
        }
        if (email != '') {
            await userModel.updateEmailStudent(Uname, email);
        }
        res.redirect('/profile/:username');
    }
    if (user.permission == 2) {
        if (name != '') {
            await userModel.updateNameTeacher(Uname, name);
        }
        if (email != '') {
            await userModel.updateEmailTeacher(Uname, email);
        }
        res.redirect('/profile/:username');
    }
})

router.get('/profile/:username', async function(req, res) {
    const user = await userModel.getUserByUserName(req.params.username);
    var permiss = false;
    if (user.permission == 1) {
        permiss = true;
    }
    if (user.permission == 2) {
        permiss = false;
    }
    res.render('vwAccounts/profile', {
        user: user,
        permiss: permiss
    });
})



module.exports = router;
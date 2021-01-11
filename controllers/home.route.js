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

router.get('/', async function(req, res) {
    res.render('layouts/bs4')
})

// router.post('/about', async function(req, res) {
//     res.redirect('/about')
// })

module.exports = router;
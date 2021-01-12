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

router.get('/', async(req, res) => {

    let topProducts = await controller.getTopProduct();
    let bestViewCourse = await controller.getBestViewCourse();
    let highlightCourse = await controller.getHighlightCourse();
    let highlightCategories = await controller.getHighlightCategories();
    console.log(highlightCategories)
    res.render("index", {
        topProducts: topProducts,
        bestViewCourse: bestViewCourse,
        highlightCourse: highlightCourse,
        highlightCategories: highlightCategories
    })
})

// router.post('/', async function(req, res) {
//     console.log("asdasdas")
//     res.redirect("/")
//         // res.render('/')
// })

// router.post('/', async function(req, res) {
//     res.render('index')
// })
// router.post('/about', async function(req, res) {
//     res.redirect('/about')
// })

module.exports = router;
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
    // Nên làm kiều này nè 

    let topProducts = await controller.getTopProduct();
    //console.log(`topProducts: ${JSON.stringify(topProducts, null, 4)}`)
    console.log(topProducts)
    res.render("index", { //doi xiu tui cahy thu
            //sao no ko loat data ta hic tu nha tui chay cai nua
            topProducts: topProducts
        }) //ong xem duoc luon ak, ong zo link thu duoc k
        // const result = await courseModel.getNewCourses();
        // console.log(result);
        // res.render('index', {
        //     courses: result
        //duoc rui ha DUong tui chay thu
        // Điền tên layout vô nữa là dc
        // Khoan, chưa xong đâu. Ông điền đủ view và layout vô trước đi đã

})

router.post('/', async function(req, res) {
    console.log("asdasdas")
    res.redirect("/")
        // res.render('/')
})

// router.post('/', async function(req, res) {
//     res.render('index')
// })
// router.post('/about', async function(req, res) {
//     res.redirect('/about')
// })

module.exports = router;
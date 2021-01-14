// TODO: check invalid username
const express = require('express');
const router = express.Router();
var controller = require("../models/IndexController");

router.get('/', async(req, res) => {

    let topProducts = await controller.getTopProduct();
    let bestViewCourse = await controller.getBestViewCourse();
    let highlightCourse = await controller.getHighlightCourse();
    let highlightCategories = await controller.getHighlightCategories();
    //console.log(highlightCategories);
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
const express = require('express');
const courseModel = require('../models/course.model');


const router = express.Router();

router.get('/bySubCat/:id', async function (req, res, next) {                   //dành cho khách
  const subCatId = req.params.id;

  const list = await courseModel.allByCat(subCatId);                         //lấy course theo subCatID
  console.log(list);
  res.render('vwCourse-fe/byCat', {
    course: list,
    empty: list.length === 0
  });
})

router.get('/detail/:id', async function (req, res, next) {                     //trang chứa detail của từng course
  const couId = +req.params.id;
  const course = await courseModel.single(couId);
  if (course === null) {
    return res.redirect('/');
  }

  res.render('vwCourse-fe/detail', {
    course
  });
})

module.exports = router;
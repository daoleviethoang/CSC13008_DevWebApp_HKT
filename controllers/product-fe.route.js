const express = require('express');
const courseModel = require('../models/course.model');


const router = express.Router();

router.get('/byCat/:id', async function (req, res, next) {                   //dành cho khách
  const subCatId = req.params.id;

  const list = await courseModel.allByCat(subCatId);                         //lấy course theo subCatID
  console.log(list);
  res.render('vwProducts/byCat', {
    products: list,
    empty: list.length === 0
  });
})

module.exports = router;
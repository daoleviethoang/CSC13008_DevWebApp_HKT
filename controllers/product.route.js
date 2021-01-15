const express = require('express');
const productModel = require('../models/product.model');

const router = express.Router();

router.get('/', async function (req, res) {
  const list = await productModel.all();
  res.render('vwCourses/index', {                             //trang dành cho admin sửa đổi course
    products: list,
    empty: list.length === 0
  });
})

module.exports = router;
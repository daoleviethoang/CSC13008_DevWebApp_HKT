const express = require('express');
const productModel = require('../models/product.model');

const router = express.Router();

router.get('/register', async function (req, res, next) {
  res.render('../views/vwAccounts/colorlib-regform-1/index.hbs', {
    layout: false
  });
})

router.post('/register', async function (req, res, next) {
  
})

router.get('/login', async function (req, res, next) {
  res.render('../views/vwAccounts/Login_v4/login', {
    layout: false
  });
});

router.post('/login', async function (req, res, next) {
  
})

module.exports = router;
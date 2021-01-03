const express = require('express');
const productModel = require('../models/product.model');

const router = express.Router();

router.get('/register', async function (req, res, next) {
  res.render('vwAccounts/register.hbs', {
    layout: false
  });
})

router.post('/register', async function (req, res, next) {
  
})

router.get('/login', async function (req, res, next) {
  res.render('vwAccounts/login', {
    layout: false
  });
});

router.post('/login', async function (req, res, next) {
  
})

module.exports = router;
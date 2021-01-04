const express = require('express');
const bcryptjs = require('bcryptjs');
const moment = require('moment');
const userModel = require('../models/user.model');
const studentModel = require('../models/student.model');
const router = express.Router();

router.get('/register', async function (req, res, next) {
  res.render('vwAccounts/register', {
    layout: false
  });
})

router.post('/register', async function (req, res, next) {
  const hash = bcryptjs.hashSync(req.body.password, 10);
  const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');

  if(req.body.gender === 'Male')
  {
    gen = 1;
  }
  if(req.body.type === 'Student')
  {
    per = 1;
  }

  

  if(per === 1)
  {
    var num = await studentModel.countNumber('Students');
    var id = 'St' + (num + 1);
    const student = {

      name: req.body.name,
      dob: dob,
      email: req.body.email,
      gender: gen,
      uid: id
    }

    await studentModel.add(student);
    // console.log(student);
  }
  const user = {
    username: req.body.username,
    password: hash,
    permission: per,
    uid: id
  }
  // console.log(user);
  await userModel.add(user);
  res.render('vwAccounts/register');
})

router.get('/login', async function (req, res, next) {
  res.render('vwAccounts/login', {
    layout: false
  });
});

router.post('/login', async function (req, res, next) {
  
})

module.exports = router;
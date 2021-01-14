const express = require('express');
const moment = require('moment');
const cartModel = require('../models/cart.model');
const courseModel = require('../models/course.model');
const orderModel = require('../models/order.model');
const detailModel = require('../models/detail.model');

const router = express.Router();

router.get('/', async function(req, res) { //trang thanh toán
    const items = [];
    for (const ci of req.session.cart) {
        const course = await courseModel.single(ci.id);
        items.push({
            course
        })
    }
    //sua cai nay lai index
    res.render('vwCart/index1', {
        items,
        empty: items.length === 0
    });
})

router.post('/add', async function(req, res) { //khi bấm nút + add trong courses/detail
    const item = {
        id: +req.body.id,
    }

    cartModel.add(req.session.cart, item);
    await req.session.save(err => {
        res.redirect(`/courses/detail/${req.body.id}`); //giữ nguyên trang hiện tại
    })
})

router.post('/remove', async function(req, res) {
    cartModel.remove(req.session.cart, +req.body.id);
    res.redirect(req.headers.referer);
})

router.post('/checkout', async function(req, res) {
    let total = 0;

    const details = [];
    for (const ci of req.session.cart) {
        const course = await courseModel.single(ci.id);
        const amount = course.Price;
        total += amount;

        details.push({ //detail từng course đã mua
            CoursesID: course.CoursesID,
            Price: course.Price,
            OrderID: -1
        });
    }
    console.log(req.session.authUser);
    const order = {
        OrderDate: moment().format('YYYY-MM-DD HH:mm:ss'),
        UID: req.session.authUser.ID,
        Total: total
    }
    const rs = await orderModel.add(order);
    for (const detail of details) {
        detail.OrderID = rs.insertId;
        await detailModel.add(detail);
    }

    req.session.cart = [];
    res.redirect(req.headers.referer);



})

module.exports = router;
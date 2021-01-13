const express = require('express');
const categoryModel = require('../models/category.model');
const courseModel = require('../models/course.model');
const { paginate } = require('./../config/default.json');

const router = express.Router();

router.get('/bySubCat/:id', async function(req, res, next) { //dành cho khách
    const subCatId = +req.params.id;

    //pagination
    const page = req.query.page || 1; //lấy giá trị page require
    if (page < 1) page = 1;

    const total = await courseModel.countBySubCat(subCatId); //lấy số lg course
    let nPages = Math.floor(total / paginate.limit);
    if (total % paginate.limit > 0) nPages++;

    const page_numbers = []; //chứa những page có thể có
    for (i = 1; i <= nPages; i++) {
        page_numbers.push({ //mỗi tp trong bảng có giá trị từng trang: value, isCurrentPage
            value: i,
            isCurrentPage: i === +page
        });
    }
    console.log(page_numbers);
    const offset = (page - 1) * paginate.limit;
    const list = await courseModel.pageByCat(subCatId, offset); //lấy course theo subCatID, offset

    subCatName = await categoryModel.singleSubCatName(subCatId);
    console.log(subCatName);
    res.render('vwCourse-fe/byCat', {
        course: list,
        page_numbers,
        empty: list.length === 0,
        subCatName
    });
})

router.get('/detail/:id', async function(req, res, next) { //trang chứa detail của từng course
    const couId = +req.params.id;
    const course = await courseModel.single(couId);
    let value = course.AccessNumber + 1;
    await courseModel.increAccessNumber(value, couId);
    if (course === null) {
        return res.redirect('/');
    }

    res.render('vwCourse-fe/detail', {
        course

    });
})

module.exports = router;
const express = require('express');
const categoryModel = require('../models/category.model');
const courseModel = require('../models/course.model');
const subcategoryModel = require('../models/subcategory.model');
const { paginate } = require('./../config/default.json');

const router = express.Router();


router.get('/list', async function(req, res) { //handle pagination 
    const search_text = req.query.searchText;

    //pagination
    const page = Number(req.query.page) || 1; //lấy giá trị page require
    if (page < 1) page = 1;

    // await courseModel.createFullText();                                     //tạo full text search
    // await subcategoryModel.createFullText();                            

    const search_part = search_text.split(" "); //tách từng từ

    const search_sql = search_part.join(', '); //gộp lại cách nhau bởi dấu phẩy

    const course_total = await courseModel.searchFullText(search_sql); //chứa list các course hợp lệ
    const subCat_total = await subcategoryModel.searchFullText(search_sql); //chứa list các course hợp lệ
    const c_total = course_total.concat(subCat_total);
    console.log(c_total);

    // console.log(course_total);

    // res.redirect(req.headers.referer);

    const total = courseModel.getNumberOfList(c_total); //lấy số lg course trong c_total
    let nPages = Math.floor(total / paginate.limit); //số lg page
    if (total % paginate.limit > 0) nPages++;

    //console.log(page_numbers);

    const offset = (page - 1) * paginate.limit;
    const page_numbers = [];
    for (i = 1; i <= nPages; i++) {
        page_numbers.push({
            value: i,
            isCurrentPage: i === +page
        });
    }

    let listCourse = [];
    // let subCatName = await categoryModel.singleSubCatName(subCatId);
    //nameTeacher = await courseModel.getTeacherOfCourse()
    //console.log(subCatName);
    // for (var i = 0 in list) {
    //     if (list[i].T != null) {
    //         var rating = ((Math.round(list[i].T * 2) / 2).toFixed(1)) * 10;
    //         Object.assign(list[i], { rat: "" + rating });
    //     }
    //     console.log(list[i]);
    // }
    for (var i = 0; i < total - (page - 1) * offset; i++) {
        if ((page - 1) * offset < total) {

            listCourse.push(c_total[(page - 1) * offset + i]);
        }
    }
    //console.log(course);
    res.render('vwSearch/byList', {
        course: listCourse,
        page_numbers,
        empty: listCourse.length === 0,
        // subCatName: subCatName
        search_text,
        total
    });
})


router.post('/list', async function(req, res) { //handle search form gửi từ bs4
    const search_text = req.body.searchText.toString();

    const keysearch = search_text;

    //pagination
    const page = req.query.page || 1; //lấy giá trị page require
    if (page < 1) page = 1;

    // await courseModel.createFullText();                                     //tạo full text search
    // await subcategoryModel.createFullText();                            

    const search_part = search_text.split(" "); //tách từng từ
    const search_sql = search_part.join(', '); //gộp lại cách nhau bởi dấu phẩy

    const course_total = await courseModel.searchFullText(search_sql); //chứa list các course hợp lệ
    const subCat_total = await subcategoryModel.searchFullText(search_sql); //chứa list các course hợp lệ
    const filterRatting = await subcategoryModel.filterByRatting();
    const filterPrice = await subcategoryModel.filterByPrice();
    const c_total = course_total.concat(subCat_total);

    const page1 = req.query.page1 || 1; //lấy giá trị page require
    if (page1 < 1) page1 = 1;
    const total1 = await courseModel.count1(); //lấy số lg course
    let nPages1 = Math.floor(total1 / paginate.limit);
    if (total1 % paginate.limit > 0) nPages1++;
    const page_numbers1 = []; //chứa những page có thể có
    for (i = 1; i <= nPages1; i++) {
        page_numbers1.push({ //mỗi tp trong bảng có giá trị từng trang: value, isCurrentPage
            value1: i,
            isCurrentPage1: i === +page1
        });
    }
    // res.redirect(req.headers.referer);

    const total = courseModel.getNumberOfList(c_total); //lấy số lg course trong c_total
    let nPages = Math.floor(total / paginate.limit); //số lg page
    if (total % paginate.limit > 0) nPages++;

    //console.log(page_numbers);

    const offset = (page - 1) * paginate.limit;
    const page_numbers = [];
    for (i = 1; i <= nPages; i++) {
        page_numbers.push({
            value: i,
            isCurrentPage: i === +page
        });
    }

    let listCourse = [];
    // let subCatName = await categoryModel.singleSubCatName(subCatId);
    //nameTeacher = await courseModel.getTeacherOfCourse()
    //console.log(subCatName);
    // for (var i = 0 in list) {
    //     if (list[i].T != null) {
    //         var rating = ((Math.round(list[i].T * 2) / 2).toFixed(1)) * 10;
    //         Object.assign(list[i], { rat: "" + rating });
    //     }
    //     console.log(list[i]);
    // }
    for (var i = 0; i < total - (page - 1) * offset; i++) {
        if ((page - 1) * offset < total) {
            listCourse.push(c_total[(page - 1) * offset + i]);
        }
    }
    for (var i = 0 in listCourse) {
        if (listCourse[i].T != null) {
            var rating = ((Math.round(listCourse[i].T * 2) / 2).toFixed(1)) * 10;
            Object.assign(listCourse[i], { rat: "" + rating });
        }
        if (listCourse[i].nRegister != 0) {
            if (listCourse[i].nRegister >= 3) {
                Object.assign(listCourse[i], { Bestseller: true });
            }
        }
        console.log(listCourse[i]);
    }
    for (var i = 0 in filterRatting) {
        if (filterRatting[i].T != null) {
            var rating = ((Math.round(filterRatting[i].T * 2) / 2).toFixed(1)) * 10;
            Object.assign(filterRatting[i], { rat: "" + rating });
        }
        if (filterRatting[i].nRegister != 0) {
            if (filterRatting[i].nRegister >= 3) {
                Object.assign(filterRatting[i], { Bestseller: true });
            }
        }
        console.log(filterRatting[i]);
    }
    for (var i = 0 in filterPrice) {
        if (filterPrice[i].T != null) {
            var rating = ((Math.round(filterPrice[i].T * 2) / 2).toFixed(1)) * 10;
            Object.assign(filterPrice[i], { rat: "" + rating });
        }
        if (filterPrice[i].nRegister != 0) {
            if (filterPrice[i].nRegister >= 3) {
                Object.assign(filterPrice[i], { Bestseller: true });
            }
        }
        console.log(filterPrice[i]);
    }
    //console.log(listCourse);
    res.render('vwSearch/byList', {
        course: listCourse,
        page_numbers,
        empty: listCourse.length === 0,

        // subCatName: subCatName
        search_text,
        total,
        keysearch: keysearch,
        course1: filterRatting,
        course2: filterPrice,
        page_numbers1,
        empty1: filterRatting.length === 0

    });
})


module.exports = router;
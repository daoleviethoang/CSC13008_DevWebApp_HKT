const express = require('express');
const categoryModel = require('../models/category.model');
const courseModel = require('../models/course.model');
const subcategoryModel = require('../models/subcategory.model');
const { paginate } = require('./../config/default.json');

const router = express.Router();


router.get('/list', async function(req, res) {                                      //handle pagination 
    const search_text = req.query.searchText;

    //pagination
    const page = Number(req.query.page) || 1;                                       //lấy giá trị page require
    if (page < 1) page = 1;

    // await courseModel.createFullText();                                     //tạo full text search
    // await subcategoryModel.createFullText();                            

    const search_part = search_text.split(" ");                             //tách từng từ

    const search_sql = search_part.join(', ');                              //gộp lại cách nhau bởi dấu phẩy

    const course_total = await courseModel.searchFullText(search_sql);          //chứa list các course hợp lệ
    const subCat_total = await subcategoryModel.searchFullText(search_sql);      //chứa list các course hợp lệ
    const c_total = course_total.concat(subCat_total);
    // console.log(course_total);

    // res.redirect(req.headers.referer);

    const total = courseModel.getNumberOfList(c_total);                //lấy số lg course trong c_total
    let nPages = Math.floor(total / paginate.limit);                        //số lg page
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
    for(var i = 0;i < total - (page-1)*offset; i++){
        if ((page - 1) * offset < total) {

            listCourse.push(c_total[(page-1) * offset + i ]);
        }
    }
    res.render('vwSearch/byList', {
        course: listCourse,
        page_numbers,                           
        empty: listCourse.length === 0,
        // subCatName: subCatName
        search_text,
        total
    });
})


router.post('/list', async function(req, res) {                             //handle search form gửi từ bs4
    const search_text = req.body.searchText.toString();


    //pagination
    const page = req.query.page || 1;                                       //lấy giá trị page require
    if (page < 1) page = 1;

    // await courseModel.createFullText();                                     //tạo full text search
    // await subcategoryModel.createFullText();                            

    const search_part = search_text.split(" ");                             //tách từng từ

    const search_sql = search_part.join(', ');                              //gộp lại cách nhau bởi dấu phẩy

    const course_total = await courseModel.searchFullText(search_sql);      //chứa list các course hợp lệ
    const subCat_total = await subcategoryModel.searchFullText(search_sql);      //chứa list các course hợp lệ
    const c_total = course_total.concat(subCat_total);
    // console.log(course_total);

    // res.redirect(req.headers.referer);

    const total = courseModel.getNumberOfList(c_total);                //lấy số lg course trong c_total
    let nPages = Math.floor(total / paginate.limit);                        //số lg page
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
    for(var i = 0;i < total - (page-1)*offset; i++){
        if ((page - 1) * offset < total) {
            listCourse.push(c_total[(page-1) * offset + i ]);
        }
    }
    res.render('vwSearch/byList', {
        course: listCourse,
        page_numbers,                           
        empty: listCourse.length === 0,
        // subCatName: subCatName
        search_text, 
        total
    });
})


module.exports = router;
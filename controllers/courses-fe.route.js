const express = require('express');
const cartModel = require('../models/cart.model');
const categoryModel = require('../models/category.model');
const courseModel = require('../models/course.model');
const studentModel = require('../models/student.model');
const subcategoryModel = require('../models/subcategory.model');
const db = require('../utils/db');
const { paginate } = require('./../config/default.json');

const router = express.Router();


router.get('/bySubCat/:id', async function (req, res, next) { //dành cho khách
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
    //console.log(page_numbers);
    const offset = (page - 1) * paginate.limit;
    var list = await courseModel.pageByCat(subCatId, offset); //lấy course theo subCatID, offset
    let subCatName = await categoryModel.singleSubCatName(subCatId);
    //nameTeacher = await courseModel.getTeacherOfCourse()
    //console.log(subCatName);
    for (var i = 0 in list) {
        if (list[i].T != null) {
            var rating = ((Math.round(list[i].T * 2) / 2).toFixed(1)) * 10;
            Object.assign(list[i], { rat: "" + rating });
        }
        console.log(list[i]);
    }
    res.render('vwCourse-fe/byCat', {
        course: list,
        page_numbers,
        empty: list.length === 0,
        subCatName: subCatName
    });
})

router.get('/detail/:CourseID', async function (req, res) { //trang chứa detail của từng course
    const courseID = req.params.CourseID;
    const detailcourse = await courseModel.single(courseID);
    const cateandsub = await courseModel.getCategoryAndSub(detailcourse.CoursesID);
    const allSection = await courseModel.getAllSection(courseID);
    const rating = await courseModel.getCourseRating(courseID) || 2;
    const teacherName = (await courseModel.getTeacherOfCourse(courseID)).name;
    const wishlisted = await courseModel.checkWishList(courseID, req.session.authUser.ID);
    const teaUID = (await courseModel.getTeacher(courseID)).UID;
    const instructionInfo = (await courseModel.getInstructionInfro(teaUID)).Info;
    const feedbacks = await courseModel.getAllFeedback(courseID);
    const isPaid = await courseModel.checkPaid(courseID,req.session.authUser.ID);
    for(var i = 0 ;i< feedbacks.length;i++){
        feedbacks[i].student = await studentModel.single(req.session.authUser.StuID);
    }
    const course = {
        CategoryID: cateandsub.CategoryID,
        SubCategoriesID: cateandsub.SubCategoryID,
        courseName: detailcourse.Name,
        courseID: detailcourse.CoursesID,
        teacherName: teacherName,
        tinyDes: detailcourse.TinyDes,
        fullDes: detailcourse.FullDes,
        Price: detailcourse.Price,
        IsFinished: detailcourse.IsFinished === 1,
        LastUpdate: detailcourse.LastUpdate.toString(),
        Rating: rating,
        wishlisted: wishlisted,
        instructionInfo:instructionInfo,
        feedbacks:feedbacks,
        allSection: []
    }
    for (var i = 0; i < allSection.length; i++) {
        let section = {
            CourseSectionID: allSection[i].CourseSectionID,
            courseID: detailcourse.CoursesID,
            Name: allSection[i].Name,
            allVideo: []
        };
        let allVideo = await courseModel.getAllVideofSection(allSection[i].CourseSectionID);
        for (var j = 0; j < allVideo.length; j++) {
            let video = {
                link: await courseModel.getLinkVideo(courseID, allSection[i].CourseSectionID, allVideo[j].VideoId),
                videoname: allVideo[j].Name,
                videoid: allVideo[j].VideoId,
                courseID: detailcourse.CoursesID,
                CourseSectionID: allSection[i].CourseSectionID,
            }

            section.allVideo.push(video);
        }
        course.allSection.push(section);
    }


    const categories = await categoryModel.all();
    for (var i = 0; i < categories.length; i++) {
        categories[i].subcategories = [];
        categories[i].iscurrentCategory = (categories.CategoryID === course.CategoryID);
        const subcategories = await subcategoryModel.all(categories[i].CategoryID);
        for (var subcategory of subcategories) {
            categories[i].subcategories.push({
                subcategory: subcategory,
                isCurrentSubcategory: subcategory.SubCategoryID === course.SubCategoriesID
            });
        }
    }
    console.log(course)
    return res.render('vwCourse-fe/detail', {
        Course: course,
        Categories: categories
    });
})

router.post("/detail/:CourseID/addwishlist", async function (req, res) {
    const CourseID = req.params.CourseID;
    const UserID = req.session.authUser.ID;
    courseModel.addWishList(CourseID, UserID);
    res.redirect(`/courses/detail/${CourseID}`);

})
router.post("/detail/:CourseID/unwishlist", async function (req, res) {
    const CourseID = req.params.CourseID;
    const UserID = req.session.authUser.ID;
    courseModel.removeWishList(CourseID, UserID);
    res.redirect(`/courses/detail/${CourseID}`);

})

router.post("/detail/:CourseID/addfeedback", async function (req, res) {
    const CourseID = req.params.CourseID;
    const content  = req.body.feedback;
    const rating  = +req.body.rate;
    const StuID = req.session.authUser.StuID;
    courseModel.addFeedback(StuID,content,CourseID,rating)

    res.redirect(`/courses/detail/${CourseID}`);

})

module.exports = router;
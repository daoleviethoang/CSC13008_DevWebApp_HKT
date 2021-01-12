const db = require('../utils/db');
const fs = require('fs');
const { single } = require('./category.model');
const { patch } = require('../utils/db');
const { paginate } = require('./../config/default.json');

module.exports = {
    async all() {
        const sql = 'select * from courses';
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async countBySubCat(subCatId) {
        const sql = `select count(*) as total from courses where SubCategoryID=${subCatId}`;
        const [rows, fields] = await db.load(sql);
        return rows[0].total;
    },

    async pageByCat(subCatId, offset) {
        const sql = `select * from courses where SubCategoryID=${subCatId} limit ${paginate.limit} offset ${offset}`;
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async single(courseID) {
        const sql = `select * from courses where CoursesID = ${courseID}`;
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    },

    async getCategoryAndSub(CourseID) {
        const sql = `select subcategories.SubCategoryID,categories.CategoryID from courses join subcategories on courses.SubCategoryID =  subcategories.SubCategoryID 
      join categories on subcategories.CategoryID =  categories.CategoryID where courses.CoursesID = ${CourseID}`;
        const [row, field] = await db.load(sql);
        if (row.length === 0) return null;
        return row[0];
    },

    async getAllSection(courseID) {
        const sql = `select * from coursesection where CourseID = ${courseID}`
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async getAllVideofSection(CourseSectionID) {
        const sql = `select * from video where CourseSectionID = ${CourseSectionID}`
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async getLinkVideo(courseID, CourseSectionID, VideoID) {
        const link = fs.readFileSync(`video/${courseID}/${CourseSectionID}/${VideoID}.txt`);
        return link;
    },

    async addCourse(courseEntity) {
        const [result, field] = await db.add(courseEntity, 'courses');
        const dir = `video/${result.insertId}`;
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
        }
        return result;
    },

    async addVideo(courseID, videoEntity) {
        const [result, field] = await db.add(videoEntity, 'video');
        fs.writeFile(`video/${courseID}/${videoEntity.CourseSectionID}/${result.insertId}.txt`, '', function(err) {
            if (err) throw err;
        });
        return result;
    },

    async addSection(sectionEntity) {
        const [result, field] = await db.add(sectionEntity, 'coursesection');
        const dir = `video/${sectionEntity.CourseID}/${result.insertId}`;
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir);
        }
        return result;
    },

    async setLinkVideo(courseID, CourseSectionID, VideoID, link) {
        const path = `video/${courseID}/${CourseSectionID}/${VideoID}.txt`;
        fs.writeFile(path, link, function(err) {
            if (err) throw err;
        });
    },

    async updateVideo(videoEntity, VideoID) {
        const condition = {
            VideoID: VideoID
        };
        const [result, field] = await db.patch(videoEntity, condition, 'video');

        return result;
    },

    async updateCourse(Course, CourseID) {
        const condition = {
            CoursesID: CourseID
        }
        await db.patch(Course, condition, 'courses');
    },
    async updateSection(CourseSection, CourseSectionID) {
        const condition = {
            CourseSectionID: CourseSectionID
        }
        await db.patch(CourseSection, condition, 'coursesection');
    },
    async getNewCourses() {
        const sql = 'SELECT * FROM `courses` ORDER BY DateCreated DESC LIMIT 12';
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getBestView() {
        const sql = 'SELECT * FROM `courses` ORDER BY AccessNumber DESC LIMIT 12';
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getHighlightCourse() {
        const sql = 'SELECT * FROM (SELECT * FROM courses WHERE WEEK(courses.DateCreated) = WEEK(CURDATE())) AS A ORDER BY nRegister DESC LIMIT 4';
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getBestRegisterWeek() {
        //const sql = 'SELECT * FROM (SELECT * FROM courses WHERE WEEK(courses.DateCreated) = WEEK(CURDATE())) AS A ORDER BY nRegister DESC LIMIT 4';
        const sql = 'SELECT SubCategoryID, Name, sum FROM (SELECT * FROM subcategories) AS TBA INNER JOIN (SELECT * FROM (SELECT SubCategoryID as sID, Sum(nRegister) as sum FROM (	SELECT * FROM (SELECT * FROM courses WHERE WEEK(courses.DateCreated) = WEEK(CURDATE())) AS A) AS D GROUP BY SubCategoryID) AS TB1 ORDER BY sum DESC) AS TBB ON TBA.SubCategoryID = TBB.sID ORDER BY sum DESC';
        const [rows, fields] = await db.load(sql);
        return rows;
    }
}
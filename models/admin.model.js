const { del } = require('../utils/db');
const db = require('../utils/db');
const ADMIN_PROPERTIES = {
    table_name: "admin",
    permission: 3,
    pk: "AdminID"
};
module.exports = {
    ADMIN_PROPERTIES,
    async all() {
        const sql = 'select * from admin';
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getStudent() {
        const sql = `SELECT count(OrderID) as CountOID, A.UID,SUM(total) as SumTotal, StuID, name, dob, email, gender, username, block
        FROM (				SELECT * 
				FROM (SELECT * FROM students) as A
				INNER JOIN
				(SELECT username, UID as UIDD, block FROM users) as B
				ON A.UID = B.UIDD) as A
        LEFT JOIN 
        (SELECT * FROM orders) as B
        ON A.UID = B.UID
        GROUP BY A.UID`
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getTeacher() {
        const sql = `SELECT * 
        FROM (SELECT C.TID, C.nameTeacher, C.dob, C.gender, C.UID,C.email, SUM(IsFinished) as S_IsFinished, ROUND(SUM(TheMin),2) as SumPrice, COUNT(coursesID) as CID
        FROM (SELECT *
        FROM (SELECT TeaID as TID, name as nameTeacher, dob, email,gender, UID FROM teachers) AS A
        LEFT JOIN
        (Select *,
               Case When Price < Sale then Price
                                When Sale < Price then Sale
                                ELSE Price
                    End As TheMin
        From courses) AS B
        ON A.TID = B.TeaID) as C
        GROUP BY TeaID
        ) as D
        INNER JOIN
        (SELECT username, UID
             as UIDD, block FROM users) as E
        ON D.UID = E.UIDD
        `
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async getCourse() {
        const sql = `SELECT *
        FROM (SELECT * 
        FROM (SELECT * FROM courses) as A
        INNER JOIN
        (SELECT SubCategoryID as SubID, Name as NameCategory FROM subcategories) as B
        ON A.SubCategoryID = B.SubID
        ) as C
        INNER JOIN
        (SELECT TeaID as TID, name as namegv FROM teachers) as D
        ON C.TeaID = D.TID`;
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getSectionCourse(CourseID) {
        const sql = `SELECT * FROM coursesection WHERE CourseID = '${CourseID}'`;
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async delStudentInStudent(UID) {
        const sql = `DELETE FROM students WHERE UID = '${UID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async delStudentInUsers(UID) {
        const sql = `DELETE FROM users WHERE UID = '${UID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async blockStudent(UID, block) {
        const sql = `UPDATE users
        SET block = ${block}
        WHERE UID = '${UID}'`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async editStudent(UID, name, DOB, Gender) {
        const sql = `UPDATE students
        SET name = '${name}', dob = '${DOB}', gender = '${Gender}'
        WHERE UID = '${UID}'`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async delTeacherInTeacher(UID) {
        const sql = `DELETE FROM teachers WHERE UID = '${UID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async delTeacherInUsers(UID) {
        const sql = `DELETE FROM users WHERE UID = '${UID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async editTeacher(UID, name, DOB, Gender) {
        const sql = `UPDATE teachers
        SET name = '${name}', dob = '${DOB}', gender = '${Gender}'
        WHERE UID = '${UID}'`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async blockTeacher(UID, block) {
        const sql = `UPDATE users
        SET block = ${block}
        WHERE UID = '${UID}'`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async delCourseInSection(CoursesID) {
        const sql = `DELETE FROM coursesection WHERE CourseID = '${CoursesID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async delCourseInCourse(CoursesID) {
        const sql = `DELETE FROM courses WHERE CoursesID = '${CoursesID}'`
        const [result, fields] = await db.load(sql);
        return result;
    },
    async blockCourse(CoursesID, block) {
        const sql = `UPDATE courses
        SET block = ${block}
        WHERE CoursesID = '${CoursesID}'`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async getCategory() {
        const sql = `SELECT * 
        FROM (SELECT SubCategoryID, Name, CategoryID, COUNT(CoursesID) as CountCourse, ROUND(SUM(Price), 2) as Price, COUNT(IsFinished) as finish, SUM(AccessNumber) as Access, SUM(nRegister) as register
        FROM (SELECT *
        FROM (SELECT * FROM subcategories) as A
        INNER JOIN
        (SELECT CoursesID, Price, IsFinished, SubCategoryID as SID, AccessNumber, nRegister FROM courses) as B
        ON A.SubCategoryID = B.SID) as D
        GROUP BY SubCategoryID) as E
        INNER JOIN
        (SELECT CategoryID as CataID, Name as Namecate FROM categories) as F
        ON E.CategoryID = F.CataID`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async editCategory(CategoryID, namecate) {
        const sql = `UPDATE categories
        SET Name = '${namecate}'
        WHERE CategoryID = ${CategoryID}`;
        const [result, fields] = await db.load(sql);
        return result;
    },
    async editSubCategory(SubCategoryID, namescate) {
        const sql = `UPDATE subcategories
        SET Name = '${namescate}'
        WHERE SubCategoryID = ${SubCategoryID}`;
        const [result, fields] = await db.load(sql);
        return result;
    }
}
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
        const sql = `SELECT count(OrderID) as CountOID, A.UID,SUM(total) as SumTotal, StuID, name, dob, email, gender, username
        FROM (				SELECT * 
				FROM (SELECT * FROM students) as A
				INNER JOIN
				(SELECT username, UID as UIDD FROM users) as B
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
        FROM (SELECT C.TeaID, C.nameTeacher, C.dob, C.gender, C.UID, SUM(IsFinished) as S_IsFinished, ROUND(SUM(TheMin),2) as SumPrice, COUNT(coursesID) as CID
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
             as UIDD FROM users) as E
        ON D.UID = E.UIDD
        `
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getCourse() {
        const sql = `SELECT * FROM courses`;
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async getSectionCourse() {
        const sql = `SELECT *
        FROM coursesection`;
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
    }
}
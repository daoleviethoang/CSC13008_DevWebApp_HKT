const db = require('../utils/db');
const userModel = require('../models/user.model');

const USER_PROPERTIES = {
    table_name: "users",
    pk: "ID"
};
module.exports = {
    async all() {
        const sql = `select * from ${USER_PROPERTIES.table_name}`;
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async single(id) {
        const sql = `select * from ${USER_PROPERTIES.table_name} where id = ${id}`;
        const [rows, fields] = await db.load(sql);
        if (rows.length === 0)
            return null;

        return rows[0];
    },

    async add(user) {
        const [result, fields] = await db.add(user, 'users');
        // console.log(result);
        return result;
    },

    async countNumber() {
        const [result, fields] = await db.count('users');

        return result[0].total;
    },
    async singleByUserName(username) {
        const sql = `select * from users where username = '${username}'`;
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    },
    async getUserByUserName(username) {
        const sql = `SELECT *
        FROM (SELECT * FROM students) as A 
        INNER JOIN 
                    (SELECT ID, UID as UID1, username, password, permission FROM users WHERE username = '${username}') as B
        ON A.UID = B.UID1`;
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    },

    async getUserByEmail(email) {
        const sql = `select *
        from users u join students s on u.UID = s.UID
        where s.email = '${email}'`;
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    },

    async updateNameStudent(username, name) {
        const sql = `UPDATE students
        SET name = '${name}'
        WHERE UID = (SELECT UID FROM users WHERE username = '${username}')`
        await db.load(sql);
    },
    async updateNameTeacher(username, name) {
        const sql = `UPDATE teachers
        SET name = '${name}'
        WHERE UID = (SELECT UID FROM users WHERE username = '${username}')`
        await db.load(sql);
    },
    async updateEmailStudent(username, email) {
        const sql = `UPDATE students
        SET email = '${email}'
        WHERE UID = (SELECT UID FROM users WHERE username = '${username}')`
        await db.load(sql);
    },
    async updateEmailTeacher(username, email) {
        const sql = `UPDATE teachers
        SET email = '${email}'
        WHERE UID = (SELECT UID FROM users WHERE username = '${username}')`
        await db.load(sql);
    },
    async updatePassWord(username, pass) {
        const sql = `UPDATE users
        SET password = '${pass}'
        WHERE username = '${username}'`
        await db.load(sql);
    },
    async getInforCate() {
        const sql = `SELECT COUNT(*) as SLKH, SUM(AccessNumber) AS SLTC, subName, SID 
        FROM (SELECT * FROM (SELECT SubCategoryID as SID, subcategories.Name as subName FROM subcategories) as B INNER JOIN courses ON B.SID = courses.SubCategoryID) as A
        GROUP BY SID`
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    }
};
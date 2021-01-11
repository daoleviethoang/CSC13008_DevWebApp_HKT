const db = require('../utils/db');

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
        const sql = `select * from ${USER_PROPERTIES.table_name} where username = '${username}'`;
        const [row, fields] = await db.load(sql);
        if (row.length === 0) {
            return null;
        }
        return row[0];
    }
};
const db = require('../utils/db');

const TEACHER_PROPERTIES = {
    table_name: "teachers",
    permission: 2,
    pk: "TeaID"
};

module.exports = {
    TEACHER_PROPERTIES,
    async all() {
        const sql = 'select * from teachers';
        const [rows, fields] = await db.load(sql);
        return rows;
    },

    async single(id) {
        const sql = `select * from users where id = ${id}`;
        const [rows, fields] = await db.load(sql);
        if (rows.length === 0)
            return null;

        return rows[0];
    },

    async singleFromUID(UID) {
        const sql = `select * from ${TEACHER_PROPERTIES.table_name} where UID = '${UID}'`;
        const [rows, fields] = await db.load(sql);
        if (rows.length === 0)
            return null;

        return rows[0];
    },

    async add(student) {
        const [result, fields] = await db.add(student, 'teachers');
        // console.log(result);
        return result;
    },

    async countNumber() {
        const sql = `select count(*) as total from teachers`;
        const [rows, fields] = await db.load(sql);

        return rows[0].total;

    },
    async largest_ID() {
        const [result, fields] = await db.largest_ID(TEACHER_PROPERTIES.pk, TEACHER_PROPERTIES.table_name);

        return result[0].largestID;
    }

};
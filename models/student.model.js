const db = require('../utils/db');

const STUDENT_PROPERTIES = {
  table_name:"students",
  permission:1,
  pk: "StuID"
};

module.exports = {
  STUDENT_PROPERTIES,
  async all() {
    const sql = 'select * from students';
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

  async add(student) {
    const [result, fields] = await db.add(student, 'students');
    return result;
  },

  async countNumber() {
    const sql = `select count(*) as total from Students`;
    const [rows, fields] = await db.load(sql);
    return rows[0].total;
  },
  async largest_ID(){
    const [result, fields] = await db.largest_ID(STUDENT_PROPERTIES.pk,STUDENT_PROPERTIES.table_name);

    return result[0].largestID;

  }

};

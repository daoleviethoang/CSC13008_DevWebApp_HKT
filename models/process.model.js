const db = require('../utils/db');

module.exports = {
  async all() {
    const sql = 'select * from categories';
    const [rows, fields] = await db.load(sql);
    return rows;
  },
  async addProcess(process) {
    const [result, fields] = await db.add(process, "process");
    return result;
  },
  async getProcess(courseID, userID) {
    const sql = `Select * from process where CourseID = ${courseID} and UserID = '${userID}'`;
    const [row, fields] = await db.load(sql);
    return row[0];
  },
  async saveProcess(process,CurVideoId) {
    const condition = {
      ProcessID: process.ProcessID,
    }
    const newprocess = {
      VideoID: CurVideoId
    }
    console.log(condition);
    const [result,fields] = await db.patch(newprocess,condition,'process');
    console.log(result);
  }


};

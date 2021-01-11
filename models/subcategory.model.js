const db = require('../utils/db');



module.exports = {
  async all(categoryID) {

    const sql = `select * from subcategories where categoryID = ${categoryID}`;
    const [rows, fields] = await db.load(sql);
    return rows;
  },
  
}
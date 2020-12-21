const db = require('../utils/db');

module.exports = {
  async all() {
    const sql = 'select * from products';
    const [rows, fields] = await db.load(sql);
    return rows;
  }
};


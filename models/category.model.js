const db = require('../utils/db');



module.exports = {
  async all() {
    const sql = 'select * from categories';
    const [rows, fields] = await db.load(sql);
    console.log(rows);
    return rows;
  },

  async single(id) {
    const sql = `select * from categories where CatID = ${id}`;
    const [rows, fields] = await db.load(sql);
    if (rows.length === 0)
      return null;

    return rows[0];
  },

  async add(category) {
    const [result, fields] = await db.add(category, 'categories');
    // console.log(result);
    return result;
  },

  async del(id) {
    const condition = {
      CatID: id
    };
    const [result, fields] = await db.del(condition, 'categories');
    return result;
  },

  async patch(entity) {
    const condition = {
      CatID: entity.CatID
    };
    delete (entity.CatID);

    const [result, fields] = await db.patch(entity, condition, 'categories');
    return result;
  }
};

const db = require('../utils/db');

// const list = [
//   { CatID: 1, CatName: 'Laptop' },
//   { CatID: 2, CatName: 'Phone' },
//   { CatID: 3, CatName: 'Quần áo' },
//   { CatID: 4, CatName: 'Giày dép' },
//   { CatID: 5, CatName: 'Trang sức' },
//   { CatID: 6, CatName: 'Khác' },
// ];

module.exports = {
  async all() {
    const sql = 'select * from users';
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

  async add(user) {
    const [result, fields] = await db.add(user, 'users');
    // console.log(result);
    return result;
  },

  async countNumber() {
    const [result, fields] = await db.count('users');
    // console.log(result);
    return result[0];
  },
};

const db = require('../utils/db');



module.exports = {
  async all(categoryID) {

    const sql = `select * from subcategories where categoryID = ${categoryID}`;
    const [rows, fields] = await db.load(sql);
    return rows;
  },
  async createFullText() {
    const sql = 'ALTER TABLE subcategories ADD FULLTEXT(Name);'
    const [rows, fields] = await db.load(sql);
    return;
  },
  async searchFullText(search_sql) {              
      const sql = `select courses.* 
      FROM courses left join subcategories ON courses.SubCategoryID = subcategories.SubCategoryID
      where
          MATCH (subcategories.Name) 
          AGAINST ('${search_sql}');`
      const [rows, fields] = await db.load(sql);
      return rows;
  },
}
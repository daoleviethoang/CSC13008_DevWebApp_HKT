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
        const sql = `select H.* 
        FROM (SELECT * FROM (SELECT *
        FROM (SELECT *
            FROM (				SELECT * 	
				FROM (SELECT * FROM courses) as CC 	  
				INNER JOIN
				(SELECT TeaID as tID, name as namegv FROM teachers) as DD
				ON CC.TeaID = DD.tID) as F
            LEFT JOIN
            (SELECT D.CourseID, ROUND(D.sum/D.count,1) as T, D.count
            FROM (SELECT *
            FROM (SELECT CourseID,Sum(Rating) as sum FROM feedback GROUP BY CourseID) AS A
            INNER JOIN
            (SELECT CourseID as cID,COUNT(Rating) as count FROM feedback GROUP BY CourseID) AS B
            ON A.CourseID = B.cID) as D
            GROUP BY D.CourseID) as E
            ON E.courseID = F.CoursesID) as K) AS I INNER JOIN (SELECT SubCategoryID as caID, subcategories.Name as NameSubcategories FROM subcategories) as J ON I.SubCategoryID = J.caID) AS H
        where
            MATCH (H.Name) 
            AGAINST ('${search_sql}');`
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async filterByRatting() {
        const sql = `select H.* 
      FROM (SELECT * FROM (SELECT *
      FROM (SELECT *
          FROM (				SELECT * 	
      FROM (SELECT * FROM courses) as CC 	  
      INNER JOIN
      (SELECT TeaID as tID, name as namegv FROM teachers) as DD
      ON CC.TeaID = DD.tID) as F
          LEFT JOIN
          (SELECT D.CourseID, ROUND(D.sum/D.count,1) as T, D.count
          FROM (SELECT *
          FROM (SELECT CourseID,Sum(Rating) as sum FROM feedback GROUP BY CourseID) AS A
          INNER JOIN
          (SELECT CourseID as cID,COUNT(Rating) as count FROM feedback GROUP BY CourseID) AS B
          ON A.CourseID = B.cID) as D
          GROUP BY D.CourseID) as E
          ON E.courseID = F.CoursesID) as K) AS I INNER JOIN (SELECT SubCategoryID as caID, subcategories.Name as NameSubcategories FROM subcategories) as J ON I.SubCategoryID = J.caID) AS H
          ORDER BY T DESC`
        const [rows, fields] = await db.load(sql);
        return rows;
    },
    async filterByPrice() {
        const sql = `select H.* 
        FROM (SELECT * FROM (SELECT *
        FROM (SELECT *
            FROM (				SELECT * 	
				FROM (SELECT * FROM courses) as CC 	  
				INNER JOIN
				(SELECT TeaID as tID, name as namegv FROM teachers) as DD
				ON CC.TeaID = DD.tID) as F
            LEFT JOIN
            (SELECT D.CourseID, ROUND(D.sum/D.count,1) as T, D.count
            FROM (SELECT *
            FROM (SELECT CourseID,Sum(Rating) as sum FROM feedback GROUP BY CourseID) AS A
            INNER JOIN
            (SELECT CourseID as cID,COUNT(Rating) as count FROM feedback GROUP BY CourseID) AS B
            ON A.CourseID = B.cID) as D
            GROUP BY D.CourseID) as E
            ON E.courseID = F.CoursesID) as K) AS I INNER JOIN (SELECT SubCategoryID as caID, subcategories.Name as NameSubcategories FROM subcategories) as J ON I.SubCategoryID = J.caID) AS H
						ORDER BY Sale ASC, Price DESC`
        const [rows, fields] = await db.load(sql);
        return rows;
    }
}
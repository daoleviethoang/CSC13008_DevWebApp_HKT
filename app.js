const express = require('express');
const morgan = require('morgan');
const hbs_sections = require('express-handlebars-sections');
const app = express();

app.use(morgan('dev'));
app.use(express.urlencoded({
  extended: true
}));
app.use('/design', express.static('design'));

require('./middlewares/session.mdw')(app);
require('./middlewares/locals.mdw')(app);
require('./middlewares/view.mdw')(app);
require('./middlewares/routes.mdw')(app);


const PORT = 3000;
app.listen(PORT, function () {
  console.log(`E-Commerce app is listening at http://localhost:${PORT}`)
})
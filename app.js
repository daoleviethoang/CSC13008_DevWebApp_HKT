const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const hbs_sections = require('express-handlebars-sections');

const app = express();

app.use(morgan('dev'));
app.engine('hbs', exphbs({
  // defaultLayout: 'main.hbs',
  defaultLayout: 'bs4.hbs',
  helpers:{
    section:hbs_sections(),
  }
}));
app.set('view engine', 'hbs');
app.use(express.urlencoded({
  extended: true
}));

require('./middlewares/session.mdw')(app);
require('./middlewares/locals.mdw')(app);

app.use('/design', express.static('design'));

app.get('/', function (req, res) {
  res.render('index');
});

app.get('/courses', function (req, res) {
  res.render('courses');
})

app.get('/about', function (req, res) {
  res.render('about');
})

app.get('/teacher', function(req, res){
  res.render('teacher');
})

app.get('/pricing', function(req, res){
  res.render('pricing');
})

app.get('/contact', function(req, res){
  res.render('contact');
})


app.get('/blog', function(req, res){
  res.render('blog');
})

app.use('/account/', require('./controllers/account.route'));



const PORT = 3000;
app.listen(PORT, function () {
  console.log(`E-Commerce app is listening at http://localhost:${PORT}`)
})
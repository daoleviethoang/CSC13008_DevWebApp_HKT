const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');

const app = express();


app.use(morgan('dev'));
app.engine('hbs', exphbs({
  // defaultLayout: 'main.hbs',
  defaultLayout: 'bs4.hbs'
}));
app.set('view engine', 'hbs');
app.use(express.urlencoded({
  extended: true
}));
app.use('/design', express.static('design'));

app.get('/', function (req, res) {
  // res.send('Hello World!');
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
// app.use('/admin/categories/', require('./controllers/category.route'));
// app.use('/admin/products/', require('./controllers/product.route'));
app.use('/account/', require('./controllers/account.route'));



const PORT = 3000;
app.listen(PORT, function () {
  console.log(`E-Commerce app is listening at http://localhost:${PORT}`)
})
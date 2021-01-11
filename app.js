const express = require('express');
const hbs = require("hbs");
const home = require("./controllers/home.route")
const morgan = require('morgan');
const hbs_sections = require('express-handlebars-sections');
const app = express();
const path = require('path');

app.use(morgan('dev'));
app.use(express.urlencoded({
    extended: true
}));
app.use('/design', express.static('design'));
app.use('/video', express.static('video'));

require('./middlewares/session.mdw')(app);
require('./middlewares/locals.mdw')(app);
//require('./middlewares/view.mdw')(app);
const PartialPath = path.join(__dirname, "./views/partials");


app.set("view engine", "hbs");
hbs.registerPartials(PartialPath); ///Header and Footer register
app.use(home); //home
require('./middlewares/routes.mdw')(app);


app.use(function(err, req, res, next) { //render khi có lỗi trong code
    console.error(err.stack);
    res.render('500', {
        layout: false
    })
})

const PORT = 3000;
app.listen(PORT, function() {
    console.log(`E-Commerce app is listening at http://localhost:${PORT}`)
})
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
app.use('/imgs', express.static('imgs')); //lấy hình ảnh

require('./middlewares/session.mdw')(app);
require('./middlewares/locals.mdw')(app);
require('./middlewares/view.mdw')(app);
require('./middlewares/routes.mdw')(app);


app.use(function(err, req, res, next) { //render khi có lỗi trong code
    res.render('500', {
        layout: false
    })
})

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`App is listening on https://app-web-abc.herokuapp.com:${port}`);
});
// app.listen(port, () => {
//     console.log(`App is listening on https://app-web-abc.herokuapp.com:${port}`);
// });
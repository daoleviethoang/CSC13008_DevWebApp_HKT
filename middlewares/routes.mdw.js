const auth = require('./auth.mdw');
const bodyparser = require("body-parser");                                  //lấy data form từ req.body
module.exports = function(app) {
    // app.get('/', function(req, res) {
    //     res.render('index');
    // });

    app.get('/about', function(req, res) {
        res.render('about');
    })

    app.get('/pricing', function(req, res) {
        res.render('pricing');
    })

    app.get('/contact', function(req, res) {
        res.render('contact');
    })

    app.get('/teacher', function(req, res) {
        res.render('teacher');
    })
    app.get('/blog', function(req, res) {
        res.render('blog');
    })

    //dành cho OTP
    app.use(bodyparser.urlencoded({ extended: false }));
    app.use(bodyparser.json());


    app.use('/account/', require('./../controllers/account.route'));
    app.use('/course/', require('./../controllers/course.route')); //dùng để sửa đổi course cho admin
    app.use('/', require('./../controllers/home.route'));
    app.use('/search/', require('./../controllers/search.route'));
    app.use('/courses/', require('../controllers/courses-fe.route')); //lấy từng course để show ra
    app.use('/cart/', auth, require('../controllers/cart.route')); //handle cart
    app.use('/user/', auth, require('./../controllers/user.route'));
    app.use('/admin/', auth, require('./../controllers/admin.route'));
    app.get('/err', function(req, res) {
        throw new Error('Error!');
    });

    app.use(function(req, res) { //render khi ko tìm thấy địa chỉ yêu cầu
        res.render('404', {
            layout: false
        });
    });

}
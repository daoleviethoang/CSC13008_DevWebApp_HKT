module.exports = function(app) {
    app.get('/', function(req, res) {
        res.render('bs4');
    });

    app.get('/about', function(req, res) {
        res.render('about');
    })


    app.get('/pricing', function(req, res) {
        res.render('pricing');
    })

    app.get('/contact', function(req, res) {
        res.render('contact');
    })


    app.get('/blog', function(req, res) {
        res.render('blog');
    })

    app.use('/account/', require('./../controllers/account.route'));
    app.use('/course/', require('./../controllers/course.route'));
    app.use('/home/', require('./../controllers/home.route'));

    app.get('/err', function(req, res) {
        throw new Error('Error!');
    });

    app.use(function(req, res) { //render khi ko tìm thấy địa chỉ yêu cầu
        res.render('404', {
            layout: false
        });
    });

}
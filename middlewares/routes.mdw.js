module.exports = function (app) {
    app.get('/', function (req, res) {
        res.render('index');
    });

    app.get('/courses', function (req, res) {
        res.render('courses');
    })

    app.get('/about', function (req, res) {
        res.render('about');
    })

    app.get('/teacher', function (req, res) {
        res.render('teacher');
    })

    app.get('/about', function (req, res) {
        res.render('about');
    })

    app.get('/pricing', function (req, res) {
        res.render('pricing');
    })

    app.get('/contact', function (req, res) {
        res.render('contact');
    })


    app.get('/blog', function (req, res) {
        res.render('blog');
    })

    app.use('/account/', require('./../controllers/account.route'));

}
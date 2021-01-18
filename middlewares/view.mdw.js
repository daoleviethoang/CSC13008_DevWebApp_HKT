const exphbs = require('express-handlebars');
const hbs_sections = require('express-handlebars-sections');
const hbs = require('hbs');
const numeral = require('numeral');
var hbs_helpers = require('handlebars-helpers')();

module.exports = function(app) {
    app.set('view engine', 'hbs');
    hbs.registerPartials(__dirname + '/views/partials');

    app.engine('hbs', exphbs({
        // defaultLayout: 'main.hbs',
        defaultLayout: 'bs4.hbs',
        helpers: {
            section: hbs_sections(),
            format_number(val) {
                return numeral(val).format('0,0[.]00 $');
            }
        },
        hbs_helpers
    }));
}
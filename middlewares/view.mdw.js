import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';
import numeral from 'numeral';

export default function (app) {
  app.engine('hbs', engine({
    extname: 'hbs',
    helpers: {
      section: hbs_sections(),
      format_number(val) {
        return numeral(val).format('0,0');
      }
    }
  }));
  app.set('view engine', 'hbs');
  app.set('views', './views');
}
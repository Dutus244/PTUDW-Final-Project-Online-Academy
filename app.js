import express from 'express';

import activate_session from './middlewares/session.mdw.js';
import activate_views from './middlewares/view.mdw.js';
import activate_resLocals from './middlewares/locals.mdw.js';
import activate_routes from './middlewares/routes.mdw.js';
import activate_error_handlers from './middlewares/error.mdw.js';
import {fileURLToPath} from "url";
import path, {dirname} from "path";
import {engine} from "express-handlebars";
import hbs_sections from "express-handlebars-sections";
import numeral from "numeral";
import moment from "moment/moment.js";


const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();
app.use('/public', express.static(path.join(__dirname, 'public')));
// cho sử dụng req.body khi dùng POST
app.use(express.urlencoded({
  extended: true
}));

activate_session(app);
// activate_views(app,__dirname);
activate_resLocals(app);
activate_routes(app);
activate_error_handlers(app);

app.engine('hbs', engine({
  extname: 'hbs',
  defaultLayout: 'main.hbs',
  helpers: {
    section: hbs_sections(),
    format_number(val) {
      return numeral(val).format('0,0');
    },
    ifEquals: function(v1, v2, options) {
      if(v1 === v2) {
        return options.fn(this);
      }
      return options.inverse(this);
    },
    ifCompare: function(v1, v2, options) {
      if(v1 > v2) {
        return options.fn(this);
      }
      return options.inverse(this);
    },
    format_date_ddmmyyyy(val) {
      if (val)
        return moment(val).format('DD-MM-YYYY')
      else
        return null
    },
  }
}));
console.log(__dirname)
app.set('view engine', 'hbs');
app.set('views', __dirname +'/views');

app.listen(process.env.PORT, function () {
  console.log(`http://localhost:${process.env.PORT}`);
});
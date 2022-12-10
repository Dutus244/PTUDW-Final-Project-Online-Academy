import express from 'express';
import { engine } from 'express-handlebars';
import hbs_sections from 'express-handlebars-sections';

const app = express();
app.use('/public', express.static('public'));

// cho sử dụng req.body khi dùng POST
app.use(express.urlencoded({
  extended: true
}));

app.engine('hbs', engine({
  extname: 'hbs',
  defaultLayout: 'bs4',
  helpers: {
    section: hbs_sections(),
  }
}));
app.set('view engine', 'hbs');
app.set('views', './views');

app.get('/', function (req, res) {
    res.send('test')
})

const PORT = 3000;
app.listen(PORT, function () {
  console.log(`http://localhost:${PORT}`);
});
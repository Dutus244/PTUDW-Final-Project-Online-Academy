

export default function (app) {
  app.get('/', function (req, res) {
    res.render('vwGuest/home')
  })
}
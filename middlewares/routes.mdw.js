import categoryRoute from '../routes/category.route.js'

export default function (app) {
  app.get('/', function (req, res) {
    res.render('vwGuest/home')
  })

  app.use('/category', categoryRoute)
}
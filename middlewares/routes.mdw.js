import authWithRequiredPermission from './auth.mdw.js';
import categoryRoute from '../routes/category.route.js'
import courseRoute from '../routes/course.route.js'
import studentRoute from '../routes/student.route.js'
import teacherRoute from '../routes/lectuer.route.js'
import accountRoute from '../routes/account.route.js'

export default function (app) {
  app.get('/', function (req, res) {
    res.render('vwGuest/home')
  })

  // app.use('/category', categoryRoute)
  app.use('/course', courseRoute)
  app.use('/student', authWithRequiredPermission(0), studentRoute)
  app.use('/teacher', authWithRequiredPermission(0), teacherRoute)

  // Amdin with authWithRequiredPermission
  app.use('/admin/categories',categoryRoute)
  app.use('/admin/courses',courseRoute)
  app.use('/admin/lecturers',teacherRoute)
  app.use('/admin/students',studentRoute)

  app.use('/account', accountRoute)
}

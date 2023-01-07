import authWithRequiredPermission from './auth.mdw.js';
import categoryRoute from '../routes/category.route.js'
import courseRoute from '../routes/course.route.js'
import studentRoute from '../routes/student.route.js'
import teacherRoute from '../routes/lectuer.route.js'
import accountRoute from '../routes/account.route.js'
import courseService from '../services/course.service.js';

export default function (app) {
  app.get('/', async (req, res)=> {
    const listFeatured = await courseService.featured();
    const listCreated = await courseService.created();
    const listViewed = await courseService.viewed();
    
    res.render('vwGuest/home', {
        first: listFeatured[0][0],
        second: listFeatured[0][1],
        third: listFeatured[0][2],
        
        created: listCreated[0],
        viewed: listViewed[0],
    })
    
  })

  // app.use('/category', categoryRoute)
  app.use('/course', courseRoute)
  app.use('/student', authWithRequiredPermission(0), studentRoute)
  app.use('/teacher', authWithRequiredPermission(1), teacherRoute)

  // Amdin with authWithRequiredPermission
  app.use('/admin/categories',categoryRoute)
  app.use('/admin/courses',courseRoute)
  app.use('/admin/lecturers',teacherRoute)
  app.use('/admin/students',studentRoute)

  app.use('/account', accountRoute)

}

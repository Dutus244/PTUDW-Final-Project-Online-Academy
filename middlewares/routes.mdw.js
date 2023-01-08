import authWithRequiredPermission from './auth.mdw.js';
import categoryRoute from '../routes/category.route.js'
import courseRoute from '../routes/course.route.js'
import studentRoute from '../routes/student.route.js'
import teacherRoute from '../routes/lectuer.route.js'
import accountRoute from '../routes/account.route.js'
import courseService from '../services/course.service.js';
import {getVisiblePage} from "../utils/helper.js";
import router from "../routes/course.route.js";

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

    app.get('/search',async function (req, res) {
        const searchBy = req.query.searchBy;
        const search = req.query.search;
        const sortBy = req.query.sortBy || "courseid";
        const sortTheo = req.query.sortTheo || "asc";
        if (search.length === 0) {
            // Item per page
            const limit = 6
            const curPage = +req.query.page || 1
            const offset = (curPage - 1) * limit

            const total = await courseService.countAll()
            const totalPages = Math.ceil(total / limit)

            const visiblePages = 5
            const pages = getVisiblePage(totalPages, visiblePages, curPage)
            const bestsellerquota = await courseService.getBestSellerMinQuota()

            const list = await courseService.findPageByAllSort(offset, limit,sortBy,sortTheo)
            res.render('vwCourse/searchByCat', {
                courses: list,
                empty: list.length === 0,
                sortBy: sortBy,
                sortTheo: sortTheo,
                searchBy: searchBy,
                search: search,
                pages: pages,
                totalPages: totalPages,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                bestsellerquota: bestsellerquota,
            })
        }
        else if (searchBy === "Category") {
            // Item per page
            const limit = 6
            const curPage = +req.query.page || 1
            const offset = (curPage - 1) * limit

            const total = await courseService.countByCatName(search)
            const totalPages = Math.ceil(total / limit)

            const visiblePages = 5
            const pages = getVisiblePage(totalPages, visiblePages, curPage)
            const bestsellerquota = await courseService.getBestSellerMinQuota()

            const list = await courseService.findPageByNameSort(search, offset, limit,sortBy,sortTheo)
            res.render('vwCourse/searchByCat', {
                courses: list,
                empty: list.length === 0,
                sortBy: sortBy,
                sortTheo: sortTheo,
                searchBy: searchBy,
                search: search,
                searchEmpty: search.length === 0,
                pages: pages,
                totalPages: totalPages,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                bestsellerquota: bestsellerquota,
            })
        }
        else if (searchBy === "Category Level") {
            // Item per page
            const limit = 6
            const curPage = +req.query.page || 1
            const offset = (curPage - 1) * limit

            const total = await courseService.countByCatLevel(search)
            const totalPages = Math.ceil(total / limit)

            const visiblePages = 5
            const pages = getVisiblePage(totalPages, visiblePages, curPage)
            const bestsellerquota = await courseService.getBestSellerMinQuota()

            const list = await courseService.findPageByCatLevelSort(search, offset, limit,sortBy,sortTheo)
            res.render('vwCourse/searchByCat', {
                courses: list,
                empty: list.length === 0,
                sortBy: sortBy,
                sortTheo: sortTheo,
                searchBy: searchBy,
                search: search,
                searchEmpty: search.length === 0,
                pages: pages,
                totalPages: totalPages,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                bestsellerquota: bestsellerquota,
            })
        }
        else if (searchBy === "CourseName") {
            // Item per page
            const limit = 6
            const curPage = +req.query.page || 1
            const offset = (curPage - 1) * limit

            const total = await courseService.countByCourseName(search)
            const totalPages = Math.ceil(total / limit)

            const visiblePages = 5
            const pages = getVisiblePage(totalPages, visiblePages, curPage)
            const bestsellerquota = await courseService.getBestSellerMinQuota()

            const list = await courseService.findPageByCourseNameSort(search, offset, limit,sortBy,sortTheo)
            res.render('vwCourse/searchByCat', {
                courses: list,
                empty: list.length === 0,
                sortBy: sortBy,
                sortTheo: sortTheo,
                searchBy: searchBy,
                search: search,
                searchEmpty: search.length === 0,
                pages: pages,
                totalPages: totalPages,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                bestsellerquota: bestsellerquota,
            })
        }
        else if (searchBy === "Lecturer") {
            // Item per page
            const limit = 6
            const curPage = +req.query.page || 1
            const offset = (curPage - 1) * limit

            const total = await courseService.countByLecName(search)
            const totalPages = Math.ceil(total / limit)

            const visiblePages = 5
            const pages = getVisiblePage(totalPages, visiblePages, curPage)
            const bestsellerquota = await courseService.getBestSellerMinQuota()

            const list = await courseService.findPageByLecNameSort(search, offset, limit,sortBy,sortTheo)
            res.render('vwCourse/searchByCat', {
                courses: list,
                empty: list.length === 0,
                sortBy: sortBy,
                sortTheo: sortTheo,
                searchBy: searchBy,
                search: search,
                searchEmpty: search.length === 0,
                pages: pages,
                totalPages: totalPages,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                bestsellerquota: bestsellerquota,
            })
        }
    })


}

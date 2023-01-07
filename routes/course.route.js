import express from 'express';
import courseService from '../services/course.service.js';
import categoryService from "../services/category.service.js";
import studentService from '../services/student.service.js';
import { getVisiblePage } from '../utils/helper.js'
import authWithRequiredPermission from '../middlewares/auth.mdw.js';
import moment from 'moment';

const router = express.Router()

router.get('/byCat', async(req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countAll()
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    
    const list = await courseService.findPageByAll(offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: null,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.get('/byCat/:catName', async(req, res) => {
    const catName = req.params.catName

    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByCatName(catName)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    
    const list = await courseService.findPageByName(catName, offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: catName,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.get('/catLevel/:name', async(req, res) => {
    const name = req.params.name

    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByCatLevel(name)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    
    const list = await courseService.findPageByCatLevel(name, offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: name,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.get('/detail/:id', async function (req, res) {
    const id = req.params.id || '0';
    const accountid = res.locals.auth ? res.locals.authUser.accountid : '0'
    const course = await courseService.findById(id);
    const coursecontent = await courseService.getCourseContent(id);
    const feedback = await courseService.findFeedbacks(id);
    const isBought = await courseService.isBought(accountid, id)
    const isInWatchlist = await courseService.isInWatchlist(accountid, id)
    const similarCourses = await courseService.findSimilarCourses(id);

    // console.log(course);

    if (course === null)
      return res.redirect('/');

    res.render('vwGuest/detail', {
      course: course,
      coursecontent: coursecontent,
      feedback: feedback,
      isBought: isBought,
      isInWatchlist: isInWatchlist,
      courses: similarCourses,
    })
})

router.post('/detail/:id/addToWatchlist', authWithRequiredPermission(0), async (req, res) => {
    const courseid = req.params.id || '0'
    await courseService.addToWatchlist(res.locals.authUser.accountid, courseid)
    res.redirect('/course/detail/' + courseid)
  })
  
router.post('/detail/:id/buy', authWithRequiredPermission(0), async (req, res) => {
    const courseid = req.params.id || '0'
    await courseService.buyCourse(res.locals.authUser.accountid, courseid)
    await studentService.removeFromWatchlist(res.locals.authUser.accountid, courseid)
    res.redirect('/course/detail/' + courseid)
})

router.get('/:id/learn', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid || '0'
    const courseid = req.params.id || '0'

    const flag = await courseService.isBought(studentid, courseid)
    if (!flag) {
        res.render('403', {
            layout: false
        })
        return
    }

    const course  = await courseService.getCourseName(courseid)
    if (!course) {
        res.render('404', {
            layout: false
        })
        return
    }
    const coursecontent = await courseService.getCourseContent(courseid)
    const watchedContent = await courseService.watchedContentByCourse(studentid, courseid)
    const feedback = await courseService.getFeedback(studentid, courseid)

    res.render('vwCourse/learn', {
        courseid: courseid,
        coursename: course.coursename,
        coursecontent: coursecontent,
        watchedContent: JSON.stringify(watchedContent),
        feedback: feedback,
    })
})

router.post('/:id/rating', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid || '0'
    const courseid = req.params.id || '0'
    const { rating, textReview } = req.body

    await courseService.postFeedback(studentid, courseid, textReview, rating)
    res.redirect(`/course/${courseid}/learn`)
})

router.post('/:id/hasWatched', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid || '0'
    const contentid = req.params.id || '0'

    await courseService.hasWatched(studentid, contentid)
})

// Amdin with authWithRequiredPermission
router.get('/', authWithRequiredPermission(2),async function (req, res) {
    const list = await courseService.findAll();
    res.render('vwAdmin/courses/index', {
        layout: 'mainAdmin',
        courses: list,
        empty: list.length === 0
    });
})

router.get('/del',authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await courseService.del(id);
    res.redirect('/admin/courses/');
});

export default router
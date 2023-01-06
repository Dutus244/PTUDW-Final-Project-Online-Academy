import express from 'express';
import courseService from '../services/course.service.js';
import categoryService from "../services/category.service.js";
import { getVisiblePage } from '../utils/helper.js'
import authWithRequiredPermission from '../middlewares/auth.mdw.js';

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
    const id = req.params.id || 0;
    const course = await courseService.findById(id);
    if (course === null)
      return res.redirect('/');

    res.render('vwGuest/detail', {
      course: course
    })
})

router.get('/:id/learn', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid
    const courseid = req.params.id
    const { coursename } = await courseService.getCourseName(courseid)
    const coursecontent = await courseService.getCourseContent(courseid)
    const feedback = await courseService.getFeedback(studentid, courseid)

    res.render('vwCourse/learn', {
        courseid: courseid,
        coursename: coursename,
        coursecontent: coursecontent,
        feedback: feedback,
    })
})

router.post('/:id/rating', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid
    const courseid = req.params.id
    const { rating, textReview } = req.body

    await courseService.postFeedback(studentid, courseid, textReview, rating)
    res.redirect(`/course/${courseid}/learn`)
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
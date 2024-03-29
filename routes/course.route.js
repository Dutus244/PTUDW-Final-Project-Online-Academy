import express from 'express';
import courseService from '../services/course.service.js';
import categoryService from "../services/category.service.js";
import studentService from '../services/student.service.js';
import { getVisiblePage } from '../utils/helper.js'
import authWithRequiredPermission from '../middlewares/auth.mdw.js';
import moment from 'moment';
import lecturerService from "../services/lecturer.service.js";
import { v4 as uuidv4 } from "uuid";

const router = express.Router()

router.get('/byCat', async (req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countAll()
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    const bestsellerquota = await courseService.getBestSellerMinQuota()

    const list = await courseService.findPageByAll(offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: null,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
        bestsellerquota: bestsellerquota,
    })
})

router.get('/byCat/:catName', async (req, res) => {
    const catName = req.params.catName

    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByCatName(catName)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    const bestsellerquota = await courseService.getBestSellerMinQuota()

    const list = await courseService.findPageByName(catName, offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: catName,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
        bestsellerquota: bestsellerquota,
    })
})

router.get('/catLevel/:name', async (req, res) => {
    const name = req.params.name

    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByCatLevel(name)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)
    const bestsellerquota = await courseService.getBestSellerMinQuota()

    const list = await courseService.findPageByCatLevel(name, offset, limit)
    res.render('vwCourse/byCat', {
        courses: list,
        empty: list.length === 0,
        catName: name,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
        bestsellerquota: bestsellerquota,
    })
})

router.get('/detail/:id', async function (req, res) {
    const courseid = req.params.id || '0';
    const accountid = res.locals.auth ? res.locals.authUser.accountid : '0'
    const course = await courseService.findById(courseid);
    const coursecontent = await courseService.getCourseContent(courseid);
    const feedback = await courseService.findFeedbacks(courseid);
    const isBought = await courseService.isBought(accountid, courseid)
    const isInWatchlist = await courseService.isInWatchlist(accountid, courseid)
    const similarCourses = await courseService.findSimilarCourses(courseid);
    const isLecturerCourse = await courseService.isLecturerCourse(courseid, accountid)

    const views = await courseService.getViews(courseid) + 1
    await courseService.updateViews(courseid, views)

    if (course === null)
        return res.redirect('/');

    res.render('vwGuest/detail', {
        course: course,
        coursecontent: coursecontent,
        feedback: feedback,
        isBought: isBought,
        isInWatchlist: isInWatchlist,
        similarCourses: similarCourses,
        isLecturerCourse: isLecturerCourse,
    })
})

// Require student permission
router.post('/detail/:id/addToWatchlist', authWithRequiredPermission(0), async (req, res) => {
    const courseid = req.params.id || '0'
    await courseService.addToWatchlist(res.locals.authUser.accountid, courseid)
    res.redirect('/course/detail/' + courseid)
})

router.post('/detail/:id/buy', authWithRequiredPermission(0), async (req, res) => {
    const courseid = req.params.id || '0'
    await courseService.buyCourse(res.locals.authUser.accountid, courseid)

    const students = await courseService.countStudents(courseid)
    await courseService.updateStudents(courseid,students)

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

    const course = await courseService.getCourseName(courseid)
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

    const reviews = await courseService.countReviews(courseid)
    await courseService.updateReviews(courseid,reviews)
    const sumRating = await courseService.sumRating(courseid)
    const userrating = sumRating / reviews
    await courseService.updateRating(courseid,userrating)

    res.redirect(`/course/${courseid}/learn`)
})

router.post('/:id/hasWatched', authWithRequiredPermission(0), async function (req, res) {
    const studentid = res.locals.authUser.accountid || '0'
    const contentid = req.params.id || '0'

    await courseService.hasWatched(studentid, contentid)
})

// Require lecturer permission
router.post('/detail/:id/completed', authWithRequiredPermission(1), async (req, res) => {
    const courseid = req.params.id || '0'
    await courseService.markCompleted(courseid)
    res.redirect('/course/detail/' + courseid)
})

// Amdin with authWithRequiredPermission
router.get('/', authWithRequiredPermission(2), async function (req, res) {
    const list = await courseService.findAll();
    res.render('vwAdmin/courses/index', {
        layout: 'mainAdmin',
        courses: list,
        empty: list.length === 0
    });
})

router.get('/del', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await courseService.del(id);
    res.redirect('/admin/courses/');
});

router.get('/disable', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await courseService.disable(id);

    res.redirect('/admin/courses/');
});

router.get('/enable', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await courseService.enable(id);

    res.redirect('/admin/courses/');
});

router.post('/', authWithRequiredPermission(2), async function (req, res) {
    const searchby = req.body.searchby;
    const search = req.body.search;
    if (search.length === 0) {
        const list = await courseService.findAll();
        res.render('vwAdmin/courses/index', {
            layout: 'mainAdmin',
            courses: list,
            empty: list.length === 0
        });
    }
    else if (searchby === "Category") {
        const list = await courseService.findByCategoryName(search);
        res.render('vwAdmin/courses/index', {
            layout: 'mainAdmin',
            courses: list,
            empty: list.length === 0
        });
    }
    else {
        const list = await courseService.findByLecturerName(search);
        res.render('vwAdmin/courses/index', {
            layout: 'mainAdmin',
            courses: list,
            empty: list.length === 0
        });
    }
})

export default router
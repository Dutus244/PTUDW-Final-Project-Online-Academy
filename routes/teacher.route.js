import express from 'express';
import bcrypt from 'bcryptjs';
import teacherService from '../services/teacher.service.js';
import userService from '../services/user.service.js';
import courseService from '../services/course.service.js';
import { getVisiblePage } from '../utils/helper.js'


const router = express.Router()

router.get('/profile', async (req, res) => {
    const teacher = await teacherService.getTeacherProfile(res.locals.authUser.accountid)
    if (!res.locals.authUser['name'])
        res.locals.authUser['name'] = teacher.teachername

    res.render('vwTeacher/profile', {
        name: teacher.teachername,
        email: teacher.email,
    })
})

router.post('/profile', async (req, res) => {
    const teacher = await teacherService.updateTeacherProfile(res.locals.authUser.accountid, req.body.name, req.body.email)
    if (req.body.name)
        res.locals.authUser['name'] = req.body.name
    if (req.body.email)
        res.locals.authUser['email'] = req.body.email

    res.render('vwTeacher/profile', {
        name: res.locals.authUser.name,
        email: res.locals.authUser.email,
        msg: 'Update successfully',
    })
})

router.get('/security', async (req, res) => {
    res.render('vwTeacher/security', {
        name: res.locals.authUser.name,
    })
})

router.post('/security', async (req, res) => {
    const user = await userService.login(req.session.authUser.email)
    const ret = bcrypt.compareSync(req.body.pass, user.pass.toString());

    var msg
    var err_msg

    if (ret === false) {
        err_msg = 'Current password is incorrect'
    }
    else {
        const salt = bcrypt.genSaltSync(10);
        const hash = bcrypt.hashSync(req.body.newPass, salt);
        await userService.updatePass(req.session.authUser.accountid, hash)
        msg = 'Change password successfully'
    }
    res.render('vwTeacher/security', {
        name: res.locals.authUser.name,
        msg: msg,
        err_msg: err_msg,
    })
})

router.get('/watchlist', async (req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByWatchlist(res.locals.authUser.accountid)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)

    const list = await teacherService.getTeacherWatchlist(res.locals.authUser.accountid, offset, limit)

    res.render('vwTeacher/watchlist', {
        courses: list,
        empty: list.length === 0,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.get('/my-courses', async (req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByStudent(res.locals.authUser.accountid)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)

    const list = await teacherService.getTeacherCourses(res.locals.authUser.accountid, offset, limit)

    res.render('vwTeacher/my-courses', {
        courses: list,
        empty: list.length === 0,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.post('/removeFromWatchlist/:id', async (req, res) => {
    const courseid = req.params.id
    await teacherService.removeFromWatchlist(res.locals.authUser.accountid, courseid)
})

router.post('/addToWatchlist', async (req, res) => {
    // const courseid = '2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'
    // await studentService.addToWatchlist(res.locals.authUser.accountid, courseid)
})

export default router
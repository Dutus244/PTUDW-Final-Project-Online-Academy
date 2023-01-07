import express from 'express';
import bcrypt from 'bcryptjs';
import studentService from '../services/student.service.js';
import userService from '../services/user.service.js';
import courseService from '../services/course.service.js';
import { getVisiblePage } from '../utils/helper.js'
import authWithRequiredPermission from "../middlewares/auth.mdw.js";
import lecturerService from "../services/lecturer.service.js";
import {v4} from "uuid";
import userServices from "../services/user.service.js";


const router = express.Router()

router.get('/profile', async (req, res) => {
  const student = await studentService.getStudentProfile(res.locals.authUser.accountid)
  if (!res.locals.authUser['name'])
    res.locals.authUser['name'] = student.studentname

  res.render('vwStudent/profile', {
    name: student.studentname,
    email: student.email,
  })
})

router.post('/profile', async (req, res) => {
  const student = await studentService.updateStudentProfile(res.locals.authUser.accountid, req.body.name, req.body.email)
  if (req.body.name)
    res.locals.authUser['name'] = req.body.name
  if (req.body.email)
    res.locals.authUser['email'] = req.body.email

  res.render('vwStudent/profile', {
    name: res.locals.authUser.name,
    email: res.locals.authUser.email,
    msg: 'Update successfully',
  })
})

router.get('/security', async (req, res) => {
  res.render('vwStudent/security', {
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
  res.render('vwStudent/security', {
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

  const list = await studentService.getStudentWatchlist(res.locals.authUser.accountid, offset, limit)

  res.render('vwStudent/watchlist', {
    name: res.locals.authUser.name,
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

  const list = await studentService.getStudentCourses(res.locals.authUser.accountid, offset, limit, res.locals.authUser.accountid)

  res.render('vwStudent/my-courses', {
    name: res.locals.authUser.name,
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
  await studentService.removeFromWatchlist(res.locals.authUser.accountid, courseid)
})

router.post('/addToWatchlist', async (req, res) => {
  // const courseid = '2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'
  // await studentService.addToWatchlist(res.locals.authUser.accountid, courseid)
})

// Amdin with authWithRequiredPermission
router.get('/', authWithRequiredPermission(2), async function (req, res) {
  const list = await studentService.findAll();
  let student = []
  for (let temp of list) {
    const countlike = await studentService.countCourseLike(temp['studentid']);
    const stu = {
      studentid: temp['studentid'],
      email: temp['email'],
      studentname: temp['studentname'],
      countenroll: temp['amount'],
      countlike: countlike[0].amount,
      lockaccount: temp['lockaccount'],
    }
    student.push(stu);
  }
  res.render('vwAdmin/students/index', {
    layout: 'mainAdmin',
    students: student,
    empty: list.length === 0
  });
})

router.get('/lock', authWithRequiredPermission(2), async function (req, res) {
  const id = req.query.id || 0;
  await studentService.lock(id);

  res.redirect('/admin/students');
});

router.get('/unlock', authWithRequiredPermission(2), async function (req, res) {
  const id = req.query.id || 0;
  await studentService.unlock(id);

  res.redirect('/admin/students');
});

router.get('/edit', authWithRequiredPermission(2), async function (req, res) {
  const id = req.query.id || 0;
  const temp = await studentService.findById(id);
  const countlike = await studentService.countCourseLike(id);
  const student = {
    studentid: temp['studentid'],
    email: temp['email'],
    studentname: temp['studentname'],
    countenroll: temp['amount'],
    countlike: countlike[0].amount,
    lockaccount: temp['lockaccount'],
  }

  const enrollcourses = await studentService.findAllCoursesEnrollByStudentID(id);
  const likecourses = await studentService.findAllCoursesLikeByStudentID(id);
  if (student === null)
    return res.redirect('/admin/students');

  res.render('vwAdmin/students/edit', {
    layout: 'mainAdmin',
    student: student,
    enrollcourses: enrollcourses,
    enrollcoursesEmpty: enrollcourses.length === 0,
    likecourses: likecourses,
    likecoursesEmpty: likecourses.length === 0,
  });
});

router.post('/del', authWithRequiredPermission(2), async function (req, res) {
  const id = req.body.studentid;
  await studentService.del(id);
  await studentService.delAccount(id);
  res.redirect('/admin/students');
});

router.post('/patch', authWithRequiredPermission(2),async function (req, res) {
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(req.body.password, salt);

  const account = {
    accountid: req.body.studentid,
    email: req.body.email,
    pass: hash,
  }

  const student = {
    studentid: req.body.studentid,
    studentname: req.body.studentname,
  }

  await studentService.patchAccount(account);
  await studentService.patch(student);
  res.redirect('/admin/students/');
});

router.get('/add', authWithRequiredPermission(2),async function (req, res) {
  res.render('vwAdmin/students/add', {
    layout: 'mainAdmin',
  });
})

router.post('/add', authWithRequiredPermission(2),async function (req, res) {
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(req.body.password, salt);

  const id = v4()

  const account = {
    accountid: id,
    email: req.body.email,
    pass: hash,
    accounttype: 0,
  }

  const student = {
    studentid: id,
    studentname:req.body.studentname,
  }

  await userServices.add(account)
  await userServices.addStudent(student)
  res.render('vwAdmin/students/add', {
    layout: 'mainAdmin',
  });
})

export default router
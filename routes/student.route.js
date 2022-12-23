import express from 'express';
import bcrypt from 'bcryptjs';
import studentService from '../services/student.service.js';
import userService from '../services/user.service.js';


const router = express.Router()

router.get('/profile', async (req, res) => {
  const student = await studentService.getStudentProfile(res.locals.authUser.accountid)
  if(!res.locals.authUser['name'])
    res.locals.authUser['name'] = student.studentname

  res.render('vwStudent/profile', {
    name: student.studentname,
    email: student.email,
    msg: req.session.msg,
  })
  delete req.session.msg
})

router.post('/profile', async (req, res) => {
  await studentService.updateStudentProfile(res.locals.authUser.accountid, req.body.name, req.body.email)
  req.session.msg = 'Cập nhật thành công'
  res.redirect('/student/profile')
})

router.get('/security', async (req, res) => {
  res.render('vwStudent/security', {
    name: res.locals.authUser.name,
    msg: req.session.msg,
    err_msg: req.session.err_msg,
  })
  delete req.session.msg
  delete req.session.err_msg
})

router.post('/security', async (req, res) => {
  const user = await userService.login(req.session.authUser.email)
  const ret = bcrypt.compareSync(req.body.pass, user.pass.toString());

  console.log(ret);
  if (ret === false) {
    req.session.err_msg = 'Mật khẩu hiện tại không đúng'
  }
  else {
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(req.body.newPass, salt);
    await userService.updatePass(req.session.authUser.accountid, hash)
    req.session.msg = 'Đổi mật khẩu thành công'
  }
  res.redirect('/student/security')
})

router.get('/watchlist', async (req, res) => {
  res.render('vwStudent/watchlist', {

  })
})

router.get('/my-courses', async (req, res) => {
  res.render('vwStudent/my-courses', {

  })
})

export default router
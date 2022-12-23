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
  })
})

router.post('/profile', async (req, res) => {
  const student = await studentService.updateStudentProfile(res.locals.authUser.accountid, req.body.name, req.body.email)
  if(req.body.name)
    res.locals.authUser['name'] = req.body.name
  if(req.body.email)
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

  console.log(ret);
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
  res.render('vwStudent/watchlist', {

  })
})

router.get('/my-courses', async (req, res) => {
  res.render('vwStudent/my-courses', {

  })
})

export default router
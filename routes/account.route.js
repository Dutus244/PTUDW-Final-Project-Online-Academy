import express from 'express';
import bcrypt from 'bcryptjs';
import userServices from "../services/user.service.js";
import { v4 } from 'uuid'

const router = express.Router();

router.get('/register', async function(req, res){
    res.render('vwAccount/register')
});

router.post('/register', async (req, res) => {
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(req.body.password, salt);

    const id = v4()

    const user = {
        accountid: id,    
        email: req.body.email,
        pass: hash,
        accounttype: 0,
    }

    const student={
        studentid: id,
        studentname:req.body.name,
    }


    await userServices.add(user)
    await userServices.addStudent(student)

    res.render('vwAccount/register')
})

router.get('/signin', async function(req, res){
    req.session.retUrl = req.headers.referer
    res.render('vwAccount/signin')
});

router.post('/signin', async (req,res)=>{
    const user = await userServices.login(req.body.email);
    if (user === null) {
      return res.render('vwAccount/signin', {
        err_message: 'Invalid username or password.'
      });
    }
    if (user.lockaccount === 1) {
        return res.render('vwAccount/signin', {
            err_message: 'Your account is locked.'
        });
    }
    
    const ret = bcrypt.compareSync(req.body.password, user.pass.toString());
    if (ret === false) {
      return res.render('vwAccount/signin', {
        err_message: 'Invalid username or password.'
      });
    }

    delete user.pass;

    req.session.auth = true;
    req.session.authUser = user;

    let url = req.session.retUrl || '/';
    delete req.session.retUrl;
    if (user.permission == 2) {
        url = "/admin/categories";
    }
    res.redirect(url);
});

router.post('/logout', function (req, res) {
  req.session.auth = false;
  req.session.authUser = null;

  const url = req.headers.referer || '/';
  res.redirect(url);
});

router.get('/is-available', async function (req, res) {
  const email = req.query.email;
  const user = await userServices.findByEmail(email);
  if (user === null)
    return res.json(true);

  res.json(false);
})

export default router
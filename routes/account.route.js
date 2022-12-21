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
    console.log(req.body.password);
    const hash = bcrypt.hashSync(req.body.password, salt);

    const user = {
        accountid: v4(),    
        email: req.body.email,
        pass: hash,
        accounttype: 0,
    }

    await userServices.add(user)
    res.render('vwAccount/register')
})

router.get('/signin', async function(req, res){
    res.render('vwAccount/signin')
});

router.post('/signin', async (req,res)=>{
    const user = await userServices.login(req.body.email);
    if (user === null) {
      return res.render('vwAccount/signin', {
        layout: false,
        err_message: 'Invalid username or password.'
      });
    }
    
    console.log(user);

    const ret = bcrypt.compareSync(req.body.password, user.pass.toString());
    if (ret === false) {
      return res.render('vwAccount/signin', {
        layout: false,
        err_message: 'Invalid username or password.'
      });
    }

    delete user.pass;

    console.log(user)

    req.session.auth = true;
    req.session.authUser = user;

    console.log(req.session.authUser);
  
    const url = req.session.retUrl || '/';
    delete req.session.retUrl;
    res.redirect(url);
})

export default router
import express from 'express';
import bcrypt from 'bcryptjs';
import userServices from "../services/user.service.js";

const router = express.Router();

router.get('/register', async function(req, res){
    res.render('vwAccount/register')
});

router.post('/register', async (req, res) => {
    const salt = bcrypt.genSaltSync(10);
    console.log(req.body.password);
    const hash = bcrypt.hashSync(req.body.password, salt);

    const user = {
        email: req.body.email,
        password: hash,
        name: req.body.name,
        permission: 0,
    }

    await userServices.add(user)
    res.render('vwAccount/register')
})

router.get('/signin', async function(req, res){
    res.render('vwAccount/signin')
});

export default router
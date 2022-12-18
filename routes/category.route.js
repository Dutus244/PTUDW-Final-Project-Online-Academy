import express from 'express';
import categoryService from '../services/category.service.js';
import { v4 as uuidv4 } from 'uuid';

const router = express.Router()

router.get('/', async function (req, res) {
    const list = await categoryService.findAll();
    res.render('vwAdmin/categories/index', {
        layout: 'mainAdmin',
        categories: list,
        empty: list.length === 0
    });
})

router.get('/add',async function (req, res) {
    res.render('vwAdmin/categories/add', {
        layout: 'mainAdmin',
    });
})

router.post('/add',async function (req, res) {
    const insert = req.body
    insert["catid"] = uuidv4();
    const ret = await categoryService.add(req.body);
    res.render('vwAdmin/categories/add', {
        layout: 'mainAdmin',
    });
})

router.get('/edit', async function (req, res) {
    const id = req.query.id || 0;
    const category = await categoryService.findById(id);
    if (category === null)
        return res.redirect('/admin/categories');

    res.render('vwCategory/edit', {
        category: category
    });
})

export default router
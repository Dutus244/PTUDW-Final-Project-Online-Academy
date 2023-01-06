import express from 'express';
import categoryService from '../services/category.service.js';
import { v4 as uuidv4 } from 'uuid';
import authWithRequiredPermission from "../middlewares/auth.mdw.js";

const router = express.Router()

router.get('/', authWithRequiredPermission(2), async function (req, res) {
    const list = await categoryService.findAll();
    res.render('vwAdmin/categories/index', {
        layout: 'mainAdmin',
        categories: list,
        empty: list.length === 0
    });
})

router.get('/add', authWithRequiredPermission(2),async function (req, res) {
    res.render('vwAdmin/categories/add', {
        layout: 'mainAdmin',
    });
})

router.post('/add', authWithRequiredPermission(2),async function (req, res) {
    const insert = req.body
    insert["catid"] = uuidv4();
    const ret = await categoryService.add(req.body);
    res.render('vwAdmin/categories/add', {
        layout: 'mainAdmin',
    });
})

router.get('/edit', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    const category = await categoryService.findById(id);
    const courses = await categoryService.findAllCoursesByCatID(id);
    if (category === null)
        return res.redirect('/admin/categories');

    res.render('vwAdmin/categories/edit', {
        layout: 'mainAdmin',
        category: category,
        courses: courses,
        coursesEmpty: courses.length === 0
    });
});

router.post('/del', authWithRequiredPermission(2), async function (req, res) {
    const id = req.body.catid;
    await categoryService.del(id);
    res.redirect('/admin/categories');
});

router.post('/patch', authWithRequiredPermission(2),async function (req, res) {
    await categoryService.patch(req.body);
    res.redirect('/admin/categories/');
});

router.get('/courses/del', authWithRequiredPermission(2),async function (req, res) {
    const id = req.query.id || 0;
    await categoryService.delCourse(id);
    res.redirect('/admin/categories/');
});

export default router
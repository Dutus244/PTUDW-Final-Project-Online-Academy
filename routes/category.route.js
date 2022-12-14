import express from 'express';
import categoryService from '../services/category.service.js';

const router = express.Router()

router.get('/:catName', (req, res) => {
    res.render('vwGuest/category')
})

export default router
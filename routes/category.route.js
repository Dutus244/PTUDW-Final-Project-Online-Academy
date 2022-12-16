import express from 'express';
import categoryService from '../services/category.service.js';

const router = express.Router()

router.get('/:catName', async(req, res) => {
    const catName = req.params.catName

    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await categoryService.countByCatName(catName)
    const nPages = Math.ceil(total / limit)

    const pageNumbers = []
    for (let i = 1; i <= nPages; i++) {
        pageNumbers.push({
            value: i,
            isCurrent: i === +curPage
        })
    }
    
    const list = await categoryService.findPageByName(catName, offset, limit)
    res.render('vwGuest/category', {
        courses: list,
        catName: catName,
        pageNumbers: pageNumbers,
        totalPages: JSON.stringify(pageNumbers.length),
        prevPage: curPage - 1 === 0 ? 1 : curPage - 1,
        nextPage: curPage + 1 > nPages ? curPage : curPage + 1,
    })
})

export default router
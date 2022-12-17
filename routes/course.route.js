import express from 'express';
import courseService from '../services/course.service.js';

const router = express.Router()

router.get('/byCat', async(req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countAll()
    const totalPages = Math.ceil(total / limit)

    // Limit the visible page
    var visiblePages = 5
    if (visiblePages > totalPages) {
        visiblePages = totalPages;
    }
    const half = Math.floor(visiblePages / 2);
    var start = curPage - half + 1 - visiblePages % 2;
    var end = curPage + half;

    // handle boundary case
    if (start <= 0) {
        start = 1;
        end = visiblePages;
    }
    if (end > totalPages) {
        start = totalPages - visiblePages + 1;
        end = totalPages;
    }
    
    const pages = []
    for (let i = start; i <= end; i++) {
        pages.push({
            value: i,
            isCurrent: i === +curPage
        })
    }
    
    const list = await courseService.findPageByAll(offset, limit)
    res.render('vwGuest/category', {
        courses: list,
        empty: list.length === 0,
        catName: null,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

router.get('/byCat/:catName', async(req, res) => {
    const catName = req.params.catName

    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByCatName(catName)
    const totalPages = Math.ceil(total / limit)

    // Limit the visible page
    var visiblePages = 5
    if (visiblePages > totalPages) {
        visiblePages = totalPages;
    }
    const half = Math.floor(visiblePages / 2);
    var start = curPage - half + 1 - visiblePages % 2;
    var end = curPage + half;

    // handle boundary case
    if (start <= 0) {
        start = 1;
        end = visiblePages;
    }
    if (end > totalPages) {
        start = totalPages - visiblePages + 1;
        end = totalPages;
    }
    
    const pages = []
    for (let i = start; i <= end; i++) {
        pages.push({
            value: i,
            isCurrent: i === +curPage
        })
    }
    
    const list = await courseService.findPageByName(catName, offset, limit)
    res.render('vwGuest/category', {
        courses: list,
        empty: list.length === 0,
        catName: catName,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

export default router
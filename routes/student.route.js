import express from 'express';
import studentService from '../services/student.service.js';

const router = express.Router()

router.get('/profile', async (req, res) => {
  res.render('vwStudent/profile', {

  })
})

router.post('/profile', async (req, res) => {
  res.render('vwStudent/profile', {

  })
})

router.get('/security', async (req, res) => {
  res.render('vwStudent/security', {

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
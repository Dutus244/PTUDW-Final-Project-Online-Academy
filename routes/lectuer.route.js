import express from 'express';
import bcrypt from 'bcryptjs';
import lecturerService from '../services/lecturer.service.js';
import userService from '../services/user.service.js';
import courseService from '../services/course.service.js';
import { getVisiblePage } from '../utils/helper.js'
import authWithRequiredPermission from "../middlewares/auth.mdw.js";
import categoryService from "../services/category.service.js";
import { v4, v4 as uuidv4 } from "uuid";
import userServices from "../services/user.service.js";
import multer from 'multer';
import bodyParser from 'body-parser';




const router = express.Router()


// apply them

router.use(bodyParser.json())
router.use(bodyParser.urlencoded({ extended: true }))
//router.use(multer().array())
export const config = {
    api: {
        bodyParser: false
    }
}


router.get('/addcourse', authWithRequiredPermission(1), async function (req, res) {
    const categorylist = await categoryService.findAllForAddCourse()
    res.render('vwTeacher/add-courses', {
        categorylist: categorylist
    })
})

router.post('/addcourse', authWithRequiredPermission(1), async function (req, res) {
    const id = v4()
    console.log('dsa');

    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, './public/img/')
        },
        filename: function (req, file, cb) {
            // const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
            cb(null, id + '.png')
        }
    })

    const upload = multer({ storage: storage })
    upload.array('fuMain', 5)(req, res, async function (err) {
        const name = req.body.coursename
        const smalldetail = req.body.coursesmalldetail
        const detail = req.body.coursedetail
        const cat = req.body.coursecat
        const tuition = req.body.courseprice
        const imagelink = '/public/img/' + id + '.png'

        const course = {
            courseid: id,
            coursename: name,
            courseavatar: imagelink,
            catid: cat,
            tinydes: smalldetail,
            fulldes: detail,
            tuition: tuition,
            lecid: res.locals.authUser.accountid
        }

        console.log(course)

        await courseService.addcourse(course)        
      if (err instanceof multer.MulterError) {
        // A Multer error occurred when uploading.
        console.error(err);
      } else if (err) {
        // An unknown error occurred when uploading.
        console.error(err);
      }
      const categorylist = await categoryService.findAllForAddCourse()
      res.render("vwTeacher/add-courses",{
        categorylist: categorylist,
        msg:'Thêm khóa học thành công'
      })
      
    })
})

router.get('/addchapter/:id', authWithRequiredPermission(1), async function (req, res){
    const courseid = req.params.id
    const course = await courseService.findById(courseid)
    res.render('vwTeacher/add-chapter', {
        courseid:courseid,
        course:course
    })
})

router.post('/addchapter/:id', authWithRequiredPermission(1), async function (req, res){
    const id = v4()
    const courseid = req.params.id
    const chapname = req.body.chapname
    const check = req.body.preview ? true : false

    var preview = 0
    if(check === true){
        preview = 1
    }

    const chapter ={
        courseid : courseid,
        chapterid : id,
        chaptername: chapname,
        preview: preview
    }

    console.log(chapter)

    await courseService.addchapter(chapter)
    const course = await courseService.findById(courseid)
    res.render("vwTeacher/add-chapter",{
        courseid: courseid,
        course:course,
        msg:'Thêm chương mới thành công'
      })
})

router.get('/addcontent/:courseid/:chapid', authWithRequiredPermission(1), async function (req, res){
    const courseid = req.params.courseid
    const chapid = req.params.chapid

    const courselist = await courseService.findById(courseid)
    const chaplist = await lecturerService.getCoursesChapter(chapid)
    console.log(chaplist[0])
    res.render('vwTeacher/add-content', {
        courseid: courseid,
        chapid: chapid,
        course: courselist,
        chap: chaplist[0],
    })
})

router.post('/addcontent/:courseid/:chapid', authWithRequiredPermission(1), async function (req, res){
    const id = v4()
    const courseid = req.params.courseid
    const chapid = req.params.chapid

    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
          cb(null, './public/vid/')
        },
        filename: function (req, file, cb) {
          // const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
          cb(null, id +'.mp4')
        }
    })

      const upload = multer({ storage: storage }) 
    upload.array('fuMain', 5)(req, res, async function (err){
        const contentname = req.body.contentname
        const contentinf = "/public/vid/" + id +'.mp4' 
        const chaptercontent ={
            courseid : courseid,
            chapterid : chapid,
            contentid : id,
            contentname : contentname,
            content: contentinf,
        }
        await courseService.addContent(courseid, chapid, id, contentname, contentinf)
        const courselist = await courseService.findById(courseid)
        const chaplist = await lecturerService.getCoursesChapter(chapid)
        console.log(chaplist[0])
        res.render('vwTeacher/add-content', {
            courseid: courseid,
            chapid: chapid,
            course: courselist,
            chap: chaplist[0],
            msg: 'Thêm bài học thành công'
        })
        if (err instanceof multer.MulterError) {
            // A Multer error occurred when uploading.
            console.error(err);
        } else if (err) {
            // An unknown error occurred when uploading.
            console.error(err);
        }
    })
})

router.get('/profile', async (req, res) => {
    const teacher = await lecturerService.getTeacherProfile(res.locals.authUser.accountid)
    if (!res.locals.authUser['name'])
        res.locals.authUser['name'] = teacher.name
    if (!res.locals.authUser['experience'])
        res.locals.authUser['experience'] = teacher.experience
    if (!res.locals.authUser['aboutme'])
        res.locals.authUser['aboutme'] = teacher.aboutme

    res.render('vwTeacher/profile', {
        name: teacher.name,
        email: teacher.email,
        experience: teacher.experience,
        aboutme: teacher.aboutme,
    })
})

router.post('/profile', async (req, res) => {
    const teacher = await lecturerService.updateTeacherProfile(
        res.locals.authUser.accountid, req.body.name, req.body.email, req.body.experience, req.body.aboutme);
    if (req.body.name)
        res.locals.authUser['name'] = req.body.name
    if (req.body.email)
        res.locals.authUser['email'] = req.body.email
    if (req.body.experience)
        res.locals.authUser['experience'] = req.body.experience
    if (req.body.aboutme)
        res.locals.authUser['aboutme'] = req.body.aboutme

    res.render('vwTeacher/profile', {
        name: res.locals.authUser.name,
        email: res.locals.authUser.email,
        experience: res.locals.authUser.experience,
        aboutme: res.locals.authUser.aboutme,
        msg: 'Update successfully',
    })
})

router.get('/security', async (req, res) => {
    res.render('vwTeacher/security', {
        name: res.locals.authUser.name,
    })
})

router.post('/security', async (req, res) => {
    const user = await userService.login(req.session.authUser.email)
    const ret = bcrypt.compareSync(req.body.pass, user.pass.toString());

    var msg
    var err_msg

    if (ret === false) {
        err_msg = 'Current password is incorrect'
    }
    else {
        const salt = bcrypt.genSaltSync(10);
        const hash = bcrypt.hashSync(req.body.newPass, salt);
        await userService.updatePass(req.session.authUser.accountid, hash)
        msg = 'Change password successfully'
    }
    res.render('vwTeacher/security', {
        name: res.locals.authUser.name,
        msg: msg,
        err_msg: err_msg,
    })
})

router.get('/my-courses', async (req, res) => {
    // Item per page
    const limit = 6
    const curPage = +req.query.page || 1
    const offset = (curPage - 1) * limit

    const total = await courseService.countByStudent(res.locals.authUser.accountid)
    const totalPages = Math.ceil(total / limit)

    const visiblePages = 5
    const pages = getVisiblePage(totalPages, visiblePages, curPage)

    const list = await lecturerService.getTeacherCourses(res.locals.authUser.accountid, offset, limit)
    // console.log(list);
    res.render('vwTeacher/my-courses', {
        name: res.locals.authUser.name,
        courses: list,
        empty: list.length === 0,
        pages: pages,
        totalPages: totalPages,
        prevPage: curPage - 1,
        nextPage: curPage + 1,
    })
})

// Amdin with authWithRequiredPermission
router.get('/', authWithRequiredPermission(2), async function (req, res) {
    const list = await lecturerService.findAll();
    res.render('vwAdmin/lecturers/index', {
        layout: 'mainAdmin',
        lecturers: list,
        empty: list.length === 0
    });
})

router.get('/add', authWithRequiredPermission(2), async function (req, res) {
    res.render('vwAdmin/lecturers/add', {
        layout: 'mainAdmin',
    });
})

router.post('/add', authWithRequiredPermission(2), async function (req, res) {
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(req.body.password, salt);

    const id = v4()

    const account = {
        accountid: id,
        email: req.body.email,
        pass: hash,
        accounttype: 1,
    }

    const lecturer = {
        lecid: id,
        lecname: req.body.lecname,
        experience: req.body.experience,
    }

    await userServices.add(account)
    await userServices.addLecturer(lecturer)
    res.render('vwAdmin/lecturers/add', {
        layout: 'mainAdmin',
    });
})

router.get('/edit', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    const lecturer = await lecturerService.findById(id);
    const courses = await lecturerService.findAllCoursesByLecID(id);
    if (lecturer === null)
        return res.redirect('/admin/lecturers');

    res.render('vwAdmin/lecturers/edit', {
        layout: 'mainAdmin',
        lecturer: lecturer,
        courses: courses,
        coursesEmpty: courses.length === 0
    });
});

router.get('/lock', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await lecturerService.lock(id);

    res.redirect('/admin/lecturers');
});

router.get('/unlock', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await lecturerService.unlock(id);

    res.redirect('/admin/lecturers');
});

router.post('/del', authWithRequiredPermission(2), async function (req, res) {
    const id = req.body.lecid;
    await lecturerService.del(id);
    await lecturerService.delAccount(id);
    res.redirect('/admin/lecturers');
});

router.post('/patch', authWithRequiredPermission(2), async function (req, res) {
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(req.body.password, salt);

    const account = {
        accountid: req.body.lecid,
        email: req.body.email,
        pass: hash,
    }

    const lecturer = {
        lecid: req.body.lecid,
        lecname: req.body.lecname,
        experience: req.body.experience,
        aboutme: req.body.aboutme,
    }

    await lecturerService.patchAccount(account);
    await lecturerService.patch(lecturer);
    res.redirect('/admin/lecturers/');
});

router.get('/courses/del', authWithRequiredPermission(2), async function (req, res) {
    const id = req.query.id || 0;
    await lecturerService.delCourse(id);
    res.redirect('/admin/categories/');
});

export default router
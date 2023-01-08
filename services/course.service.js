import db from '../utils/db.js';

export default {
    async addcourse(entity){
        return db('courses').insert(entity)
    },

    async countAll() {
        const list = await db
            .count({ amount: 'courseid' })
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')

        return list[0].amount
    },

    async countByCatName(name) {
        const list = await db
            .count({ amount: 'courseid' })
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .where('catname', '=', name)
        return list[0].amount
    },

    async countByCatLevel(catlevel) {
        const list = await db
            .count({ amount: 'courseid' })
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .where('catlevel', '=', catlevel)

        return list[0].amount
    },

    async countByLecName(lecname) {
        const list = await db
            .count({ amount: 'courseid' })
            .from('courses')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('lecname', '=', lecname)

        return list[0].amount
    },

    async countByWatchlist(studentid) {
        const list = await db
            .count({ amount: 'watchlists.courseid' })
            .from('courses')
            .join('watchlists', 'courses.courseid', 'watchlists.courseid')
            .where('watchlists.studentid', studentid)

        return list[0].amount
    },

    async countByStudent(studentid) {
        const list = await db
            .count({ amount: 'studentcourses.courseid' })
            .from('studentcourses')
            .where('studentcourses.studentid', studentid)

        return list[0].amount
    },

    async countByCourseName(coursename) {
        const sql = `SELECT count(*) as amount FROM courses WHERE MATCH (coursename) AGAINST ('${coursename}' IN NATURAL LANGUAGE MODE)`;
        try {
            const list = await db.raw(sql);
            return list[0][0].amount;
        } catch (error) {
            console.log(error);
        }
    },

    async findPageByAll(offset, limit) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByAllSort(offset, limit,sortBy,sortTheo) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .offset(offset)
            .limit(limit)
            .orderBy(sortBy,sortTheo)

        return list
    },

    async findPageByName(name, offset, limit) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catname', '=', name)
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByNameSort(name, offset, limit,sortBy,sortTheo) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catname', '=', name)
            .offset(offset)
            .limit(limit)
            .orderBy(sortBy,sortTheo)

        return list
    },

    async findPageByCatLevel(catlevel, offset, limit) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catlevel', '=', catlevel)
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByCatLevelSort(catlevel, offset, limit,sortBy,sortTheo) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catlevel', '=', catlevel)
            .offset(offset)
            .limit(limit)
            .orderBy(sortBy,sortTheo)

        return list
    },

    async findPageByLecName(lecname, offset, limit) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('lecname', '=', lecname)
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByLecNameSort(lecname, offset, limit,sortBy,sortTheo) {
        const list = await db
            .select('students', 'courseavatar', 'catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('lecname', '=', lecname)
            .offset(offset)
            .limit(limit)
            .orderBy(sortBy,sortTheo)

        return list
    },

    async findPageByCourseNameSort(coursename,offset, limit,sortBy,sortTheo) {
        const sql = `SELECT students,courseavatar,catname,coursename,lecname,rating,reviews,tuition,discount,courseid FROM courses join categories on courses.catid=categories.catid join lecturers on courses.lecid=lecturers.lecid  WHERE MATCH (coursename) AGAINST ('${coursename}' IN NATURAL LANGUAGE MODE)  order by ${sortBy} ${sortTheo} limit ${limit} offset ${offset}`;
        try {
            const list = await db.raw(sql);
            return list[0];
        } catch (error) {
            console.log(error);
        }
    },

    async findById(id) {
        const list = await db
            .select('courses.courseid', 'courseavatar', 'coursename', 'tinydes', 'fulldes', 'lecname', 'rating', 'tuition', 'discount', 'reviews', 'updatetime', 'students', 'experience', 'aboutme', 'chaptername')
            .from('courses')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
            .leftJoin('coursechapter', 'coursechapter.courseid', 'courses.courseid')
            .where('courses.courseid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findChapter(id) {
        const list = await db
            .select('contentname', 'content', 'updatetime')
            .from('chaptercontent')
            .where('courseid', id);
        if (list.length === 0) {
            return null;
        }
        return list;
    },

    async findFeedbacks(id) {
        const list = await db
            .select('feedback', 'rating', 'updatetime', 'studentname')
            .from('feedbacks')
            .leftJoin('students', 'students.studentid', 'feedbacks.studentid')
            .where('courseid', id);
        if (list.length === 0) {
            return null;
        }
        return list;
    },

    async findSimilarCourses(id) {
        // const courseid = await db
        //     .select('course2.courseid')
        //     .from('courses as course1')
        //     .join('courses as course2', 'course1.catid', 'course2.catid')
        //     .where('course1.courseid', id);

        // if (courseid.length === 0) {
        //     return null;
        // }

        // var bought = []

        // for (let i in courseid){
        //     let amount = await this.countByBought(courseid[i])
        //     bought.push({courseid: courseid[i], amount: amount})
        // }

        // bought.sort(function(a, b){return b.amount - a.amount});

        // if(bought.length > 5){
        //     bought = bought.slice(0, 5)
        // }

        // var courses = []

        // for (let x in bought){
        //     var list = await this.findAll(bought[x].courseid)
        //     courses.push(list[0])
        // }

        const sql = `select courseavatar, courseid, coursename, rating, reviews, tuition, discount, lecname from courses 
            join lecturers on courses.lecid = lecturers.lecid
            where catid =
            (select catid from courses
            where courseid = '${id}') and courseid != '${id}'
            order by students desc
            limit 5`
        const courses = await db.raw(sql)

        return courses[0];
    },

    async countByBought(courseid) {
        const list = await db
            .count({ amount: 'studentid' })
            .from('studentcourses')
            .where('courseid', courseid)

        return list[0].amount
    },

    async findAll() {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'views', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime','createtime', 'lecturers.lecname','disable','complete')
            .from('courses')
            .leftJoin('categories', 'categories.catid', 'courses.catid')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
        return list;
    },

    del(id) {
        return db('courses').where('courseid', id).del();
    },

    async getCourseName(id) {
        const coursename = await db
            .select('coursename')
            .from('courses')
            .where('courseid', id)

        return coursename[0]
    },

    async getCourseContent(id) {
        const list = await db
            .select('coursechapter.chapterid', 'chaptername', 'contentid', 'contentname', 'content', 'preview')
            .from('courses')
            .join('coursechapter', 'courses.courseid', 'coursechapter.courseid')
            .leftJoin('chaptercontent', 'coursechapter.chapterid', 'chaptercontent.chapterid')
            .where('courses.courseid', id)
        if (list.length === 0)
            return null

        var coursecontent = []
        var curChapterId = list[0].chapterid
        var curChapterName = list[0].chaptername
        var curPreview = list[0].preview
        var contentList = []
        for (const i in list) {
            const { chapterid, chaptername, contentid, contentname, content, preview } = list[i]
            if (curChapterId != chapterid) {
                coursecontent.push({
                    chapterid: curChapterId,
                    chaptername: curChapterName,
                    chaptercontent: contentList,
                    preview: curPreview,
                })
                curChapterId = chapterid
                curChapterName = chaptername
                curPreview = preview
                contentList = []
            }

            contentList.push({ contentid: contentid, contentname: contentname, content: content })

        }
        coursecontent.push({
            chapterid: curChapterId,
            chaptername: curChapterName,
            chaptercontent: contentList,
            preview: curPreview,
        })

        // console.log(coursecontent);
        return coursecontent
    },

    async getFeedback(studentid, courseid) {
        const fb = await db('feedbacks')
            .select('feedback as text', 'rating')
            .where('studentid', studentid)
            .andWhere('courseid', courseid)

        return fb[0]
    },

    async postFeedback(studentid, courseid, text, rating) {
        const sql = `insert into feedbacks values ('${studentid}', '${courseid}', '${text}', '${rating}', now())`
        try {
            await db.raw(sql)
        } catch (error) {
            console.log(error);
        }
    },

    async featured() {
        const sql = `SELECT * FROM courses order by rating desc limit 3`;
        try {
            const list = await db.raw(sql);
            return list;
        } catch (error) {
            console.log(error);
        }
    },

    async viewed() {
        const sql = `SELECT courses.CourseID, CourseAvatar, CourseName, CatName, LecName, Rating, Reviews, Discount, Tuition
        FROM courses
        join categories on courses.catid = categories.catid
        join lecturers on lecturers.lecid = courses.lecid
        order by views desc limit 10`;
        try {
            const list = await db.raw(sql);
            return list;
        } catch (error) {
            console.log(error);
        }
    },

    async created() {
        const sql = `SELECT courses.CourseID, CourseAvatar, CourseName, CatName, LecName, Rating, Reviews, Discount, Tuition
        FROM courses 
        join categories on courses.catid = categories.catid
        join lecturers on lecturers.lecid = courses.lecid
        order by createtime desc limit 10`;
        try {
            const list = await db.raw(sql);
            return list;
        } catch (error) {
            console.log(error);
        }
    },

    async mostBoughtCategories() {
        const sql = `select catname
            from categories join courses on courses.catid = categories.catid
            join lecturers on lecturers.lecid = courses.lecid
            group by courses.catid
            order by sum(students) desc
            limit 5`
        try {
            const list = await db.raw(sql)
            return list[0]
        } catch (error) {
            console.log(error);
        }
    },

    async isBought(studentid, courseid) {
        const list = await db
            .select('*')
            .from('studentcourses')
            .where('courseid', courseid)
            .andWhere('studentid', studentid)

        return list.length === 0 ? false : true
    },

    async hasWatched(studentid, contentid) {
        try {
            await db('studentwatchcontent')
                .insert({
                    'studentid': studentid,
                    'contentid': contentid,
                })
        } catch (error) {
            console.log(error);
        }
    },

    async watchedContentByCourse(studentid, courseid) {
        const list = await db
            .select('studentwatchcontent.contentid')
            .from('studentwatchcontent')
            .join('chaptercontent', 'studentwatchcontent.contentid', 'chaptercontent.contentid')
            .where('studentid', studentid)
            .andWhere('chaptercontent.courseid', courseid)

        // console.log(list);
        return list
    },

    async isInWatchlist(studentid, courseid) {
        const list = await db('watchlists')
            .where('studentid', studentid)
            .andWhere('courseid', courseid)

        return list.length === 0 ? false : true
    },

    async addToWatchlist(studentid, courseid) {
        try {
            return await db('watchlists')
                .insert({ 'studentid': studentid, 'courseid': courseid })
        } catch (error) {
            console.log(error);
        }

    },

    async buyCourse(studentid, courseid) {
        try {
            return await db('studentcourses')
                .insert({ 'studentid': studentid, 'courseid': courseid })
        } catch (error) {
            console.log(error);
        }
    },

    disable(id) {
        const course = {
            disable: 1,
        }
        return db('courses').where('courseid', id).update(course);
    },

    enable(id) {
        const course = {
            disable: 0,
        }
        return db('courses').where('courseid', id).update(course);
    },

    async getBestSellerMinQuota() {
        const sql = `select (sum(students) / count(*)) as quota from courses`
        const quota = await db.raw(sql)
        return quota[0][0].quota
    },

    async findByCategoryName(name) {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'views', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime','createtime', 'lecturers.lecname','disable','complete')
            .from('courses')
            .join('categories', 'categories.catid', 'courses.catid')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('categories.catname',name)
        return list;
    },

    async findByLecturerName(name) {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'views', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime','createtime', 'lecturers.lecname','disable','complete')
            .from('courses')
            .leftJoin('categories', 'categories.catid', 'courses.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('lecturers.lecname',name)
        return list;
    },
}
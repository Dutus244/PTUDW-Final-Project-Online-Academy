import db from '../utils/db.js';

export default {
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

    async findPageByAll(offset, limit) {
        const list = await db
            .select('catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByName(name, offset, limit) {
        const list = await db
            .select('catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catname', '=', name)
            .offset(offset)
            .limit(limit)

        return list
    },

    async findPageByCatLevel(catlevel, offset, limit) {
        const list = await db
            .select('catname', 'coursename', 'lecname', 'rating', 'reviews', 'tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catlevel', '=', catlevel)
            .offset(offset)
            .limit(limit)

        return list
    },

    async findById(id) {
        const list = await db
            .select('courseavatar', 'coursename', 'tinydes', 'fulldes', 'lecname', 'courses.rating', 'tuition', 'discount', 'reviews', 'courses.updatetime', 'students', 'experience', 'aboutme', 'chaptername', 'content', 'chaptercontent.updatetime', 'feedback', 'feedbacks.updatetime', 'studentname')
            .from('courses')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
            .leftJoin('chaptercontent', 'chaptercontent.courseid', 'courses.courseid')
            .leftJoin('coursechapter', 'coursechapter.courseid', 'courses.courseid')
            .leftJoin('feedbacks', 'feedbacks.courseid', 'courses.courseid')
            .leftJoin('students', 'students.studentid', 'feedbacks.studentid')
            .where('courses.courseid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findAll() {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'views', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime', 'lecturers.lecname')
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
            .select('coursechapter.chapterid', 'chaptername', 'contentid', 'contentname', 'content')
            .from('courses')
            .join('coursechapter', 'courses.courseid', 'coursechapter.courseid')
            .leftJoin('chaptercontent', 'coursechapter.chapterid', 'chaptercontent.chapterid')
            .where('courses.courseid', id)

        var coursecontent = []
        var curChapterId = list[0].chapterid
        var curChapterName = list[0].chaptername
        var contentList = []
        for (const i in list) {
            const { chapterid, chaptername, contentid, contentname, content } = list[i]
            if (curChapterId != chapterid) {
                coursecontent.push({
                    chapterid: curChapterId,
                    chaptername: curChapterName,
                    chaptercontent: contentList
                })
                curChapterId = chapterid
                curChapterName = chaptername
                contentList = []
            }

            contentList.push({ contentid: contentid, contentname: contentname, content: content })

        }
        coursecontent.push({
            chapterid: curChapterId,
            chaptername: curChapterName,
            chaptercontent: contentList
        })

        // console.log(coursecontent[0].chaptercontent);
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
}
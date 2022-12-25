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
            .select('courseavatar', 'coursename', 'tinydes', 'fulldes', 'lecname', 'rating', 'tuition', 'discount', 'reviews', 'courses.updatetime', 'students', 'experience', 'aboutme', 'chaptername', 'content', 'chaptercontent.updatetime', 'feedback', 'feedbacks.updatetime', 'studentname')
            .from('courses')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .join('chaptercontent', 'chaptercontent.courseid', 'courses.courseid')
            .join('coursechapter', 'coursechapter.courseid', 'courses.courseid')
            .join('feedbacks', 'feedbacks.courseid', 'courses.courseid')
            .join('students', 'students.studentid', 'feedbacks.studentid')
            .where('courses.courseid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findAll() {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime', 'lecturers.lecname')
            .from('courses')
            .leftJoin('categories', 'categories.catid', 'courses.catid')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
        return list;
    },

    del(id) {
        return db('courses').where('courseid', id).del();
    },
}
import db from '../utils/db.js';

export default {
    async getTeacherProfile(id) {
        const teacher = await db
            .select('teachername', 'email')
            .from('accounts')
            .join('teachers', 'accountid', 'teacherid')
            .where('accounts.accountid', '=', id)

        return teacher[0]
    },

    async updateTeacherProfile(id, name, email) {
        if (email) {
            await db('accounts')
                .where('accountid', '=', id)
                .update('email', email)
        }
        if (name) {
            await db('teachers')
                .where('teacherid', '=', id)
                .update('teachername', name)
        }
        return
    },

    async getTeacherWatchlist(id, offset, limit) {
        return await db
            .select('catname', 'coursename', 'lecname', 'rating',
                'reviews', 'tuition', 'discount', 'courses.courseid')
            .from('watchlists')
            .join('courses', 'watchlists.courseid', 'courses.courseid')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('watchlists.teacherid', id)
            .offset(offset)
            .limit(limit)
    },

    async removeFromWatchlist(teacherid, courseid) {
        return await db('watchlists').where('teacherid', studentid).where('courseid', courseid).del()
    },

    async addToWatchlist(teacherid, courseid) {
        return await db('watchlists')
            .insert({'teacherid': teacherid, 'courseid': courseid})
    },

    async getTeacherCourses(id, offset, limit) {
        return await db
            .select('catname', 'coursename', 'lecname', 'rating',
                'reviews', 'courses.courseid')
            .from('teachercourses')
            .join('courses', 'teachercourses.courseid', 'courses.courseid')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('teachercourses.teacherid', id)
            .offset(offset)
            .limit(limit)
    },
}
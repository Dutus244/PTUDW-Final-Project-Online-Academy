import db from '../utils/db.js';

export default {
    async getTeacherProfile(id) {
        const teacher = await db
            .select('LecName', 'email')
            .from('accounts')
            .join('lecturers', 'AccountID', 'LecID')
            .where('accounts.AccountID', '=', id)

        return teacher[0]
    },

    async updateTeacherProfile(id, name, email) {
        if (email) {
            await db('accounts')
                .where('AccountID', '=', id)
                .update('email', email)
        }
        if (name) {
            await db('teachers')
                .where('LecID', '=', id)
                .update('LecName', name)
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
            .where('watchlists.lecid', id)
            .offset(offset)
            .limit(limit)
    },

    async removeFromWatchlist(LecID, courseid) {
        return await db('watchlists').where('LecID', studentid).where('courseid', courseid).del()
    },

    async addToWatchlist(LecID, courseid) {
        return await db('watchlists')
            .insert({'LecID': LecID, 'courseid': courseid})
    },

    async getTeacherCourses(id, offset, limit) {
        return await db
            .select('catname', 'coursename', 'lecname', 'rating',
                'reviews', 'courses.courseid')
            .from('teachercourses')
            .join('courses', 'teachercourses.courseid', 'courses.courseid')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('studentcourses.LecID', id)
            .offset(offset)
            .limit(limit)
    },
}
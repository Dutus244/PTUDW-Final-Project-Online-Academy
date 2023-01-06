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

    async findAll() {
        const list = await db
            .select('lecturers.lecid', 'accounts.email','lecname','experience','aboutme')
            .count({amount: 'courseid'})
            .from('lecturers')
            .leftJoin('courses', 'courses.lecid', 'lecturers.lecid')
            .join('accounts','lecturers.lecid','accounts.accountid')
            .groupBy('lecturers.lecid')
        return list;
    },

    async findById(id) {
        const list = await db
            .select('lecturers.lecid','accounts.email','lecname','experience','aboutme')
            .count({amount: 'courseid'})
            .from('lecturers')
            .leftJoin('courses', 'courses.lecid', 'lecturers.lecid')
            .join('accounts','lecturers.lecid','accounts.accountid')
            .groupBy('lecturers.lecid')
            .where('lecturers.lecid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findAllCoursesByLecID(id) {
        const list = await db
            .select('courseid','coursename','categories.catname','tinydes','fulldes','rating','reviews','students','tuition','discount','discountinfo','updatetime','lecturers.lecname')
            .from('courses')
            .leftJoin('categories','categories.catid','courses.catid')
            .leftJoin('lecturers','courses.lecid','lecturers.lecid')
            .where('courses.lecid', id);
        return list;
    },

    add(entity) {
        return db('lecturers').insert(entity);
    },

    patch(entity) {
        return db('lecturers').where('lecid', entity.lecid).update(entity);
    },

    patchAccount(entity) {
        return db('accounts').where('accountid', entity.accountid).update(entity);
    },

    del(id) {
        return db('lecturers').where('lecid', id).del();
    },

    delAccount(id) {
        return db('accounts').where('accountid', id).del();
    },

    delCourse(id) {
        return db('courses').where('courseid', id).del();
    }
}
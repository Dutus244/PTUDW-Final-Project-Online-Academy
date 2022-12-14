import db from '../utils/db.js';

export default {
    async getTeacherProfile(id) {
        const teacher = await db
            .select('lecname as name', 'email', 'experience', 'aboutme')
            .from('accounts')
            .join('lecturers', 'AccountID', 'LecID')
            .where('accounts.AccountID', '=', id)

        return teacher[0]
    },

    async updateTeacherProfile(id, name, email, experience, aboutme) {
        if (email) {
            await db('accounts')
                .where('AccountID', '=', id)
                .update('email', email)
        }
        if (name) {
            await db('lecturers')
                .where('LecID', '=', id)
                .update('LecName', name)
        }
        if (experience) {
            await db('lecturers')
                .where('LecID', '=', id)
                .update('experience', experience)
        }
        if (aboutme) {
            await db('lecturers')
                .where('LecID', '=', id)
                .update('aboutme', aboutme)
        }
        return
    },

    async getTeacherCourses(id, offset, limit) {
        const list = await db
            .select('complete', 'courseavatar', 'catname', 'coursename', 'rating',
                'reviews', 'courses.courseid', 'tuition', 'discount')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .where('courses.lecid', id)
            .offset(offset)
            .limit(limit)

        return list;
    },

    async findAll() {
        const list = await db
            .select('lecturers.lecid', 'accounts.email', 'lecname', 'experience', 'aboutme', 'lockaccount')
            .count({ amount: 'courseid' })
            .from('lecturers')
            .leftJoin('courses', 'courses.lecid', 'lecturers.lecid')
            .join('accounts', 'lecturers.lecid', 'accounts.accountid')
            .groupBy('lecturers.lecid')
        return list;
    },

    async findById(id) {
        const list = await db
            .select('lecturers.lecid', 'accounts.email', 'lecname', 'experience', 'aboutme', 'lockaccount')
            .count({ amount: 'courseid' })
            .from('lecturers')
            .leftJoin('courses', 'courses.lecid', 'lecturers.lecid')
            .join('accounts', 'lecturers.lecid', 'accounts.accountid')
            .groupBy('lecturers.lecid')
            .where('lecturers.lecid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findAllCoursesByLecID(id) {
        const list = await db
            .select('courseid', 'coursename', 'categories.catname', 'tinydes', 'fulldes', 'rating', 'reviews', 'students', 'tuition', 'discount', 'discountinfo', 'updatetime', 'lecturers.lecname')
            .from('courses')
            .leftJoin('categories', 'categories.catid', 'courses.catid')
            .leftJoin('lecturers', 'courses.lecid', 'lecturers.lecid')
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
    },

    lock(id) {
        const lecturer = {
            lockaccount: 1,
        }
        return db('accounts').where('accountid', id).update(lecturer);
    },

    unlock(id) {
        const lecturer = {
            lockaccount: 0,
        }
        return db('accounts').where('accountid', id).update(lecturer);
    },

    async getCoursesChapter(id){
        const list = await db
            .select('chapterid', 'chaptername')
            .from('coursechapter')
            .where('chapterid', id)
        return list;
    }
}
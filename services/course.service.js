import db from '../utils/db.js';

export default {
    async countAll() {
        const list = await db
            .count({amount: 'courseid'})
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            
        return list[0].amount
    },

    async countByCatName(name) {
        const list = await db
            .count({amount: 'courseid'})
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .where('catname', '=', name)
            
        return list[0].amount
    },

    async findPageByAll(offset, limit) {
        const list = await db
            .select('courses.catid', 'coursename', 'lecname', 'rating', 'tuition', 'discount')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .offset(offset)
            .limit(limit)
            
        return list
    },

    async findPageByName(name, offset, limit) {
        const list = await db
            .select('courses.catid', 'coursename', 'lecname', 'rating', 'tuition', 'discount')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catname', '=', name)
            .offset(offset)
            .limit(limit)
            
        return list
    },
}
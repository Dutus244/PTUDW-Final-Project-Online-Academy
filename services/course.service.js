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

    async countByCatLevel(catlevel) {
        const list = await db
            .count({amount: 'courseid'})
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .where('catlevel', '=', catlevel)
            
        return list[0].amount
    },

    async findPageByAll(offset, limit) {
        const list = await db
            .select('courses.catid', 'catname', 'coursename', 'lecname', 'rating', 'reviews','tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .offset(offset)
            .limit(limit)
            
        return list
    },

    async findPageByName(name, offset, limit) {
        const list = await db
            .select('courses.catid', 'catname', 'coursename', 'lecname', 'rating', 'reviews','tuition', 'discount', 'courseid')
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
            .select('courses.catid', 'catname', 'coursename', 'lecname', 'rating', 'reviews','tuition', 'discount', 'courseid')
            .from('courses')
            .join('categories', 'courses.catid', 'categories.catid')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('catlevel', '=', catlevel)
            .offset(offset)
            .limit(limit)
            
        return list
    },

    async findById(id) {
        const list = await db.
            select('courseavatar', 'coursename', 'tinydes', 'fulldes', 'lecname', 'rating', 'tuition', 'discount', 'reviews', 'updatetime')
            .from('courses')
            .join('lecturers', 'courses.lecid', 'lecturers.lecid')
            .where('courseid', id);
        if (list.length === 0) {
          return null;
        }
        return list[0];
      },
}
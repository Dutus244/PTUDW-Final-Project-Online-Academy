import db from '../utils/db.js';

export default {
    async findAll() {
        const list = await db
            .select('categories.catid','catname','catlevel')
            .count({amount: 'courseid'})
            .from('categories')
            .leftJoin('courses', 'courses.catid', 'categories.catid')
            .groupBy('categories.catid')
        return list;
    },

    async findById(id) {
        const list = await db
            .select('categories.catid','catname','catlevel')
            .count({amount: 'courseid'})
            .from('categories')
            .leftJoin('courses', 'courses.catid', 'categories.catid')
            .groupBy('categories.catid')
            .where('categories.catid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    async findAllCoursesByCatID(id) {
        const list = await db
            .select('courseid','coursename','categories.catname','tinydes','fulldes','rating','reviews','students','tuition','discount','discountinfo','updatetime','lecturers.lecname')
            .from('courses')
            .leftJoin('categories','categories.catid','courses.catid')
            .leftJoin('lecturers','courses.lecid','lecturers.lecid')
            .where('categories.catid', id);
        return list;
    },

    async countCoursesByCatId(id) {
        const list = await db
            .count({amount: 'courseid'})
            .from('categories')
            .leftJoin('courses', 'courses.catid', 'categories.catid')
            .groupBy('categories.catid')
            .where('categories.catid', id);
        return list[0].amount;
    },

    add(entity) {
        return db('categories').insert(entity);
    },

    patch(entity) {
        delete entity["amount"];
        return db('categories').where('catid', entity.catid).update(entity);
    },

    del(id) {
        return db('categories').where('catid', id).del();
    },
}
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

    add(entity) {
        return db('categories').insert(entity);
    },

    async findById(id) {
        const list = await db('categories').where('catid', id);
        if (list.length === 0) {
            return null;
        }
        return list[0];
    },

    del(id) {
        return db('categories').where('catid', id).del();
    },
}
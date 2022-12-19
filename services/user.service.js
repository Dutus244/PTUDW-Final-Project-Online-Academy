import db from '../utils/db.js';

export default {
    add(entity) {
        return db('accounts').insert(entity)
    },

    async findByUsername(email) {
        const list = await db('accounts').where('email', email);
        if (list.length !== 0)
            return list[0]
        return null
    },
}
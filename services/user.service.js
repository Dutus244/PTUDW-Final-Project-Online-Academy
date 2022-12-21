import db from '../utils/db.js';

export default {
    add(entity) {
        return db('accounts').insert(entity)
    },

    async login(email){
        const list = await db('accounts')
            .select('email', 'pass')
            .where('email', email);
        if(list.length !==0)
            return list[0];
        return null;
    },

    async findByUsername(email) {
        const list = await db('accounts').where('email', email);
        if (list.length !== 0)
            return list[0]
        return null
    },
}
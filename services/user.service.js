import db from '../utils/db.js';

export default {
    add(entity) {
        return db('accounts').insert(entity)
    },

    async login(email){
        const list = await db('accounts')
            .select('accountid', 'email', 'pass', 'accounttype as permission')
            .where('email', email);
        if(list.length !==0)
            return list[0];
        return null;
    },

    async findByEmail(email) {
        const list = await db('accounts').where('email', email);
        if (list.length !== 0)
            return list[0]
        return null
    },

    async updatePass(id, hash) {
        await db('accounts')
            .where('accountid', '=', id)
            .update('pass', hash)
        return
    }
}
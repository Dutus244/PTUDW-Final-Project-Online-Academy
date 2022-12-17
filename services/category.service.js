import db from '../utils/db.js';

export default {
    async findAll() {
        const categories = await db('categories')
        // console.log(categories);
        var list = {}
        for (const i in categories) {
            if (!list[categories[i].CatLevel])
                list[categories[i].CatLevel] = []
            list[categories[i].CatLevel].push(categories[i].CatName)
        }
        return list
    },

}
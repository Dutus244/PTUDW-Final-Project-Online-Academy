import db from '../utils/db.js';

export default {
  async getStudentProfile(id) {
    const student = await db
      .select('studentname', 'email')
      .from('accounts')
      .join('students', 'accountid', 'studentid')
      .where('accounts.accountid', '=', id)
    
    return student[0]
  },

  async updateStudentProfile(id, name, email) {
    if (email) {
      await db('accounts')
      .where('accountid', '=', id)
      .update('email', email)
    }
    if (name) {
      await db('students')
      .where('studentid', '=', id)
      .update('studentname', name)
    }
    return
  }
}
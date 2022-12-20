import db from '../utils/db.js';

export default {
  async getStudentProfile(id) {
    const student = await db
      .select('studentname', 'email')
      .from('accounts')
      .join('students', 'accountid', 'studentid')
      .where('accounts.accountid', '=', id)
    
    return student
  }
}
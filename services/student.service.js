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
  },

  async getStudentWatchlist(id, offset, limit) {
    return await db
      .select('catname', 'coursename', 'lecname', 'rating',
        'reviews', 'tuition', 'discount', 'courses.courseid')
      .from('watchlists')
      .join('courses', 'watchlists.courseid', 'courses.courseid')
      .join('categories', 'courses.catid', 'categories.catid')
      .join('lecturers', 'courses.lecid', 'lecturers.lecid')
      .where('watchlists.studentid', id)
      .offset(offset)
      .limit(limit)
  }, 
  
  async removeFromWatchlist(studentid, courseid) {
    return await db('watchlists').where('studentid', studentid).where('courseid', courseid).del()
  },

  async addToWatchlist(studentid, courseid) {
    return await db('watchlists')
      .insert({'studentid': studentid, 'courseid': courseid})
  },

  async getStudentCourses(id, offset, limit) {
    return await db
      .select('catname', 'coursename', 'lecname', 'rating',
        'reviews', 'courses.courseid')
      .from('studentcourses')
      .join('courses', 'studentcourses.courseid', 'courses.courseid')
      .join('categories', 'courses.catid', 'categories.catid')
      .join('lecturers', 'courses.lecid', 'lecturers.lecid')
      .where('studentcourses.studentid', id)
      .offset(offset)
      .limit(limit)
  },

  async findAll() {
    const list = await db
        .select('students.studentid','accounts.email','studentname')
        .count({amount: 'studentcourses.studentid'})
        // .count({amountwatchlists: 'watchlists.studentid'})
        .from('students')
        .leftJoin('studentcourses', 'students.studentid', 'studentcourses.studentid')
        // .leftJoin('watchlists', 'students.studentid', 'watchlists.studentid')
        .join('accounts','students.studentid','accounts.accountid')
        .groupBy('students.studentid')
    return list;
  },

  async countCourseInWatchLists(id) {
    const list = await db
        .count({amount: 'studentid'})
        .from('watchlists')
        .groupBy('studentid')
        .where('studentid', id);
    return list[0].amount;
  }
}
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
      .select('courseavatar', 'catname', 'coursename', 'lecname', 'rating',
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

  async getStudentCourses(id, offset, limit, studentid) {
    const list = await db
      .select('courseavatar', 'catname', 'coursename', 'lecname', 'rating',
        'reviews', 'courses.courseid')
      .from('studentcourses')
      .join('courses', 'studentcourses.courseid', 'courses.courseid')
      .join('categories', 'courses.catid', 'categories.catid')
      .join('lecturers', 'courses.lecid', 'lecturers.lecid')
      .where('studentcourses.studentid', id)
      .offset(offset)
      .limit(limit)

    for (const i in list) {
      const sql = `select * from 
        (select count(*) as sum from chaptercontent where courseid = '${list[i].courseid}') as l join
        (select count(*) as watchedSum from studentwatchcontent 
        join chaptercontent on chaptercontent.contentid = studentwatchcontent.contentid
        where studentid = '${studentid}' and courseid = '${list[i].courseid}') as m
        where l.sum = m.watchedSum`
      const flag = await db.raw(sql)
      if (flag[0].length === 1)
        list[i]['iscompleted'] = true
      else
        list[i]['iscompleted'] = false
    }

    return list
  },

  async findAll() {
    const list = await db
      .select('students.studentid', 'accounts.email', 'studentname','lockaccount')
      .count({ amount: 'studentcourses.studentid' })
      .from('students')
      .leftJoin('studentcourses', 'students.studentid', 'studentcourses.studentid')
      .join('accounts', 'students.studentid', 'accounts.accountid')
      .groupBy('students.studentid')
    return list;
  },

  lock(id) {
    const student = {
      lockaccount: 1,
    }
    return db('accounts').where('accountid', id).update(student);
  },

  unlock(id) {
    const student = {
      lockaccount: 0,
    }
    return db('accounts').where('accountid', id).update(student);
  },

  async findById(id) {
    const list = await db
        .select('students.studentid', 'accounts.email', 'studentname','lockaccount')
        .count({ amount: 'studentcourses.studentid' })
        .from('students')
        .leftJoin('studentcourses', 'students.studentid', 'studentcourses.studentid')
        .join('accounts', 'students.studentid', 'accounts.accountid')
        .groupBy('students.studentid')
        .where('students.studentid', id);
    if (list.length === 0) {
      return null;
    }
    return list[0];
  },

  async findAllCoursesEnrollByStudentID(id) {
    const sql = `select courses.courseid,coursename,categories.catname,tinydes,fulldes,rating,reviews,students,tuition,discount,discountinfo,updatetime,lecturers.lecname from courses left join categories on categories.catid = courses.catid left join lecturers on lecturers.lecid = courses.lecid join studentcourses on (studentcourses.courseid = courses.courseid and studentcourses.studentid='${id}')`;
    try {
      const list = await db.raw(sql);
      return list[0];
    } catch (error) {
      console.log(error);
    }
  },

  async findAllCoursesLikeByStudentID(id) {
    const sql = `select courses.courseid,coursename,categories.catname,tinydes,fulldes,rating,reviews,students,tuition,discount,discountinfo,updatetime,lecturers.lecname from courses left join categories on categories.catid = courses.catid left join lecturers on lecturers.lecid = courses.lecid join watchlists on watchlists.courseid = courses.courseid and watchlists.studentid='${id}'`;
    try {
      const list = await db.raw(sql);
      return list[0];
    } catch (error) {
      console.log(error);
    }
  },

  async countCourseLike(id) {
    const sql = `SELECT COUNT(watchlists.studentid) as amount FROM watchlists right join students on watchlists.studentid = students.studentid where students.studentid='${id}' group by students.studentid`
    try {
      const list = await db.raw(sql);
      return list[0];
    } catch (error) {
      console.log(error);
    }
  },

  del(id) {
    return db('students').where('studentid', id).del();
  },

  delAccount(id) {
    return db('accounts').where('accountid', id).del();
  },

  patch(entity) {
    return db('students').where('studentid', entity.studentid).update(entity);
  },

  patchAccount(entity) {
    return db('accounts').where('accountid', entity.accountid).update(entity);
  },
}
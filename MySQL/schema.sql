BEGIN;
CREATE DATABASE ptudw_finalproject_onlineacademy;

BEGIN;
USE ptudw_finalproject_onlineacademy;

BEGIN;
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	CatID varchar(36) NOT NULL,
    CatName nvarchar(100) COLLATE utf8_general_ci NOT NULL UNIQUE,
    CatLevel nvarchar(100) COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY(CatID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	AccountID varchar(36) NOT NULL,
    Email varchar(50) COLLATE utf8_general_ci NOT NULL,
    Pass binary(60) NOT NULL,
    AccountType int CHECK (AccountType IN (0,1,2)) NOT NULL,
    PRIMARY KEY(AccountID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS lecturers;
CREATE TABLE lecturers (
	LecID varchar(36) NOT NULL,
    LecName nvarchar(100) COLLATE utf8_general_ci NOT NULL,
    Experience text COLLATE utf8_general_ci,
    AboutMe text COLLATE utf8_general_ci,
    FOREIGN KEY (LecID) REFERENCES accounts(AccountID),
    PRIMARY KEY(LecID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	CourseID varchar(36) NOT NULL,
    CourseName nvarchar(100) NOT NULL,
    CatID varchar(36) NOT NULL,
    CourseAvatar varchar(100) NOT NULL,
    TinyDes varchar(100) COLLATE utf8_general_ci NOT NULL,
	FullDes text COLLATE utf8_general_ci NOT NULL,
    Rating float,
    Reviews int,
    Students int,
    Tuition int,
    Discount int,
    DiscountInfo text COLLATE utf8_general_ci,
    UpdateTime datetime,
    LecID varchar(36) NOT NULL,
    FOREIGN KEY (CatID) REFERENCES categories(CatID),
    FOREIGN KEY (LecID) REFERENCES lecturers(LecID),
    FULLTEXT (CourseName,TinyDes,FullDes),
    PRIMARY KEY(CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS coursechapter;
CREATE TABLE coursechapter (
	CourseID varchar(36) NOT NULL,
    ChapterID varchar(36) NOT NULL,
    ChapterName nvarchar(100) COLLATE utf8_general_ci NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(CourseID,ChapterID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS chaptercontent;
CREATE TABLE chaptercontent (
	CourseID varchar(36) NOT NULL,
    ChapterID varchar(36) NOT NULL,
    ContentID varchar(36) NOT NULL,
    Content text COLLATE utf8_general_ci NOT NULL,
    UpdateTime datetime,
    FOREIGN KEY (CourseID,ChapterID) REFERENCES coursechapter(CourseID,ChapterID),
    PRIMARY KEY(CourseID, ChapterID,ContentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS students;
CREATE TABLE students (
	StudentID varchar(36) NOT NULL,
    StudentName nvarchar(100) COLLATE utf8_general_ci NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES accounts(AccountID),
    PRIMARY KEY(StudentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS watchlists;
CREATE TABLE watchlists (
	StudentID varchar(36) NOT NULL,
    CourseID varchar(36) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(StudentID, CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS studentcourses;
CREATE TABLE studentcourses (
	StudentID varchar(36) NOT NULL,
    CourseID varchar(36) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(StudentID, CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS feedbacks;
CREATE TABLE feedbacks (
	StudentID varchar(36) NOT NULL,
    CourseID varchar(36) NOT NULL,
    Feedback text COLLATE utf8_general_ci,
    UpdateTime datetime,
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(StudentID, CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
	AdminID varchar(36) NOT NULL,
    AdminName nvarchar(100) COLLATE utf8_general_ci NOT NULL,
    FOREIGN KEY (AdminID) REFERENCES accounts(AccountID),
    PRIMARY KEY(AdminID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
INSERT INTO categories values ('110b962e-041c-11e1-9234-0123456789ab', 'Front end','Lập trình Web');
INSERT INTO categories values ('210b962e-041c-11e1-9234-0123456789ab', 'Back end','Lập trình Web');

BEGIN;
INSERT INTO accounts values ('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127100@student.hcmus.edu.vn','$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1);
INSERT INTO accounts values ('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127376@student.hcmus.edu.vn','$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1);
INSERT INTO accounts values ('15637ec4-c85f-11ea-87d0-0242ac130003','20127610@student.hcmus.edu.vn','$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',2);
INSERT INTO accounts values ('25637ec4-c85f-11ea-87d0-0242ac130003','20127575@student.hcmus.edu.vn','$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',2);
INSERT INTO accounts values ('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127013@student.hcmus.edu.vn','$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',0);

BEGIN;
INSERT INTO lecturers values ('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Nguyễn Trịnh Như Ý','Sinh viên tốt nghiệp xuất sắc KHTN','Thông minh và thân thiện');
INSERT INTO lecturers values ('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Trần Nhật Trường','Thủ khoa Khoa học máy tính','Ngài');

BEGIN;
INSERT INTO courses values ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình front end với HTML','110b962e-041c-11e1-9234-0123456789ab','','','',0,0,0,1000000,999999,'',NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b');
INSERT INTO courses values ('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình back end với Java','210b962e-041c-11e1-9234-0123456789ab','','','',0,0,0,1000000,999999,'',NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b');

BEGIN;
INSERT INTO coursechapter values ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','Mở đầu về HTML');
INSERT INTO coursechapter values ('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','22345678-4067-11e9-8bad-9b1deb4d3b7d','Cách sử dụng tag');

BEGIN;
INSERT INTO chaptercontent values ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','12345678-c85f-11ea-87d0-0242ac130003','Bài 1',NULL);
INSERT INTO chaptercontent values ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','22345678-c85f-11ea-87d0-0242ac130003','Bài 2',NULL);

BEGIN;
INSERT INTO students values ('15637ec4-c85f-11ea-87d0-0242ac130003', 'Trương Samuel');
INSERT INTO students values ('25637ec4-c85f-11ea-87d0-0242ac130003', 'Huỳnh Cao Nguyên');

BEGIN;
INSERT INTO watchlists values ('15637ec4-c85f-11ea-87d0-0242ac130003', '1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');
INSERT INTO watchlists values ('25637ec4-c85f-11ea-87d0-0242ac130003', '2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');

BEGIN;
INSERT INTO studentcourses values ('25637ec4-c85f-11ea-87d0-0242ac130003', '1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');
INSERT INTO studentcourses values ('15637ec4-c85f-11ea-87d0-0242ac130003', '2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');

BEGIN;
INSERT INTO feedbacks values ('25637ec4-c85f-11ea-87d0-0242ac130003', '1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Khóa học hấp dẫn',NULL);

BEGIN;
INSERT INTO admins values ('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b', 'Đặng Nguyễn Duy');

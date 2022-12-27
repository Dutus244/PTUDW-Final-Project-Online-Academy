BEGIN;
CREATE DATABASE ptudw_finalproject_onlineacademy;

BEGIN;
USE ptudw_finalproject_onlineacademy;

BEGIN;
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	CatID varchar(36),
    CatName nvarchar(100) COLLATE utf8_general_ci UNIQUE,
    CatLevel nvarchar(100) COLLATE utf8_general_ci,
    PRIMARY KEY(CatID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	AccountID varchar(36),
    Email varchar(50) COLLATE utf8_general_ci,
    Pass binary(60),
    AccountType int CHECK (AccountType IN (0,1,2)),
    PRIMARY KEY(AccountID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS lecturers;
CREATE TABLE lecturers (
	LecID varchar(36),
    LecName nvarchar(100) COLLATE utf8_general_ci,
    Experience text COLLATE utf8_general_ci,
    AboutMe text COLLATE utf8_general_ci,
    FOREIGN KEY (LecID) REFERENCES accounts(AccountID),
    PRIMARY KEY(LecID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	CourseID varchar(36),
    CourseName nvarchar(100),
    CatID varchar(36),
    CourseAvatar varchar(100),
    TinyDes varchar(100) COLLATE utf8_general_ci,
	FullDes text COLLATE utf8_general_ci,
    Rating float,
    Reviews int,
    Views int,
    Students int,
    Tuition int,
    Discount int,
    DiscountInfo text COLLATE utf8_general_ci,
    CreateTime datetime,
    UpdateTime datetime,
    LecID varchar(36),
    FOREIGN KEY (CatID) REFERENCES categories(CatID),
    FOREIGN KEY (LecID) REFERENCES lecturers(LecID),
    FULLTEXT (CourseName),
    PRIMARY KEY(CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS coursechapter;
CREATE TABLE coursechapter (
	CourseID varchar(36),
    ChapterID varchar(36),
    ChapterName nvarchar(100) COLLATE utf8_general_ci,
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(ChapterID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS chaptercontent;
CREATE TABLE chaptercontent (
	CourseID varchar(36),
    ChapterID varchar(36),
    ContentID varchar(36),
    ContentName nvarchar(100) COLLATE utf8_general_ci,
    Content text COLLATE utf8_general_ci,
    UpdateTime datetime,
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    FOREIGN KEY (ChapterID) REFERENCES coursechapter(ChapterID),
    PRIMARY KEY(ContentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS students;
CREATE TABLE students (
	StudentID varchar(36),
    StudentName nvarchar(100) COLLATE utf8_general_ci,
    FOREIGN KEY (StudentID) REFERENCES accounts(AccountID),
    PRIMARY KEY(StudentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS watchlists;
CREATE TABLE watchlists (
	StudentID varchar(36),
    CourseID varchar(36),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(StudentID, CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS studentcourses;
CREATE TABLE studentcourses (
	StudentID varchar(36),
    CourseID varchar(36),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES courses(CourseID),
    PRIMARY KEY(StudentID, CourseID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
DROP TABLE IF EXISTS feedbacks;
CREATE TABLE feedbacks (
	StudentID varchar(36),
    CourseID varchar(36),
    Feedback text COLLATE utf8_general_ci,
    Rating int,
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
DROP TABLE IF EXISTS studentwatchcontent;
CREATE TABLE studentwatchcontent (
	StudentID varchar(36),
    ContentID varchar(36),
    FOREIGN KEY (StudentID) REFERENCES students(StudentID),
    FOREIGN KEY (ContentID) REFERENCES chaptercontent(ContentID),
    PRIMARY KEY(StudentID,ContentID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

BEGIN;
INSERT INTO `accounts` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','20127610@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',0),('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127100@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1),('25637ec4-c85f-11ea-87d0-0242ac130003','20127575@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',0),('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127376@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',1),('3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127343@student.hcmus.edu.vn',_binary '$2a$12$OMCCdYl4mIbK3ZHmBolitu1pknVlvDOCp00sW.6n60uhbk2m6gmSy',1),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','test@yahoo.com',_binary '$2a$10$bao/yC/btbS1IXRF6xjzL.oz2zZ.9wLy/.4rFqk.CVVDhZRNJmIZy',0),('6cf0f452-a848-4684-bcb4-1f42fc4353ab','test123@gmail.com',_binary '$2a$10$eXYLav/Fjr1OBKRBjrnfOuJUKDg4Y9T4hFydF5HZiyQuZ.ZgpPguu',0),('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','20127013@student.hcmus.edu.vn',_binary '$2y$10$VDZAxMaIgFZK1IHus9tC9eAJjsNF6Wr9U3cArbbHr6el64/RyuQka',2),('75c802af-7137-4b0c-aa0f-1176a8c95f1b','def@gmail.com',_binary '$2a$10$daUTAZuz9EelC5GTkjthUOyY0s/pxiKn9m6Y3dQIhC6YNwVq8iG4K',0),('85182197-937e-4e35-8e74-c0568657ee89','19127245@student.hcmus.edu.vn',_binary '$2a$10$vHvHby9toI8m2tF00otGDuFGR3ZOaLEfdLcwT4Jtj8qt4.W6x2qgO',0),('933212ef-f83b-4685-8d78-f545e957eb10','abc@gmail.com',_binary '$2a$10$/OXZpfn4inKS2zvVugmMEOZTM9DScuCT452E3l9VcB97NbZ5GRI5a',0),('9ef1f138-1fa6-427e-93f5-7b507dbfc3fb','lala@gmail.com',_binary '$2a$10$wxOi7rCGkRXfTicGAPZ3reTCJQmats9S/EmDKErDZbOao4uD7i446',0),('b95fdf54-0077-4f91-9b71-4436dd48825b','test@gmail.com',_binary '$2a$10$RZyp1Bjg3.itTR2a0/d.ZOLCVfX55uZzfwUIAAXg9qp9Ri2v.qU0.',0),('d3a17fae-e896-41bb-bc42-cc04641cbafd','lulu@gmail.com',_binary '$2a$10$6swKu8f69fYLi0U1UOeSGOXxnh71TwT5FzFSwySr8KmZA4vpN9t6y',0);

BEGIN;
INSERT INTO `admins` VALUES ('6ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Đặng Nguyễn Duy');

BEGIN;
INSERT INTO `lecturers` VALUES ('1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Nguyễn Trịnh Như Ý','Sinh viên tốt nghiệp xuất sắc KHTN','Thông minh và thân thiện'),('2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Trần Nhật Trường','Thủ khoa Khoa học máy tính','Ngài'),('3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b','Phạm Ngọc Anh Thư','Chuyên gia phân tích tài chính',NULL);

BEGIN;
INSERT INTO `categories` VALUES ('110b962e-041c-11e1-9234-0123456789ab','Lập Trình Web','IT'),('1d040fab-0dff-40c7-8337-5d28acb1c691','Khởi Nghiệp','Kinh Doanh'),('210b962e-041c-11e1-9234-0123456789ab','Lập Trình Hệ Điều Hành','IT'),('287caac6-b824-4f4c-9f2d-f8d7f08f3bb5','Yoga','Sức khỏe & Đời sống'),('385ab80e-36fd-4e8f-a5db-4ee7ef5a2e42','Thiết kế 3D & Hoạt Cảnh','Thiết Kế'),('7b47291a-ec31-4def-812a-efaa1075486b','Thương Mại Điện Tử','Kinh Doanh'),('94b2ac8e-c4c4-4871-8711-4a9a3f5f6025','Thể Thao','Sức khỏe & Đời sống'),('9f5dc560-ffb1-44dd-80e2-bed3fa25d40e','Lập Trình Thiết Bị Di Động','IT'),('ba6d6f92-5320-482f-a4da-9a620f9078ea','Thiết kế Web','Thiết Kế'),('c02ba921-85f0-4fd2-a862-34dde79e165f','SEO','Marketing'),('fa7508ce-a34d-4cd2-9476-500e84cfb954','Tiếp Thị Kỹ Thuật Số','Marketing'),('fd296b2e-6a96-4609-8339-a1c36b01712f','Sản Xuất Âm Nhạc','Âm Nhạc');

BEGIN;
INSERT INTO `courses` VALUES ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình front end với HTML','110b962e-041c-11e1-9234-0123456789ab','','','',0,0,0,0,1000000,999999,'',NULL,NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b'),('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình back end với Java','210b962e-041c-11e1-9234-0123456789ab','','','',0,0,0,0,1000000,999999,'',NULL,NULL,'2ec0bd7f-11c0-43da-975e-2a8ad9ebae0b'),('3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Starup','1d040fab-0dff-40c7-8337-5d28acb1c691','','','',0,0,0,0,1500000,1200000,NULL,NULL,NULL,'3ec0bd7f-11c0-43da-975e-2a8ad9ebae0b'),('4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','Lập trình Web MVC','110b962e-041c-11e1-9234-0123456789ab','','','',0,0,0,0,2500000,2000000,NULL,NULL,NULL,'1ec0bd7f-11c0-43da-975e-2a8ad9ebae0b');

BEGIN;
INSERT INTO `students` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','Trương Samuel'),('25637ec4-c85f-11ea-87d0-0242ac130003','Huỳnh Cao Nguyên'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','testyahoo'),('6cf0f452-a848-4684-bcb4-1f42fc4353ab','Test'),('85182197-937e-4e35-8e74-c0568657ee89','Phuc Tran'),('b95fdf54-0077-4f91-9b71-4436dd48825b','Trương Samuel'),('d3a17fae-e896-41bb-bc42-cc04641cbafd','');

BEGIN;
INSERT INTO `watchlists` VALUES ('15637ec4-c85f-11ea-87d0-0242ac130003','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('25637ec4-c85f-11ea-87d0-0242ac130003','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','4c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');

BEGIN;
INSERT INTO `studentcourses` VALUES ('25637ec4-c85f-11ea-87d0-0242ac130003','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('698d05d3-39e2-40a7-9767-f71ecdf08b8e','1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('15637ec4-c85f-11ea-87d0-0242ac130003','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d'),('b95fdf54-0077-4f91-9b71-4436dd48825b','3c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d');

BEGIN;
INSERT INTO `coursechapter` VALUES ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','Mở đầu về HTML'),('2c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','22345678-4067-11e9-8bad-9b1deb4d3b7d','Cách sử dụng tag');

BEGIN;
INSERT INTO `chaptercontent` VALUES ('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','12345678-c85f-11ea-87d0-0242ac130003','Bài 1','',NULL),('1c5ea4c0-4067-11e9-8bad-9b1deb4d3b7d','12345678-4067-11e9-8bad-9b1deb4d3b7d','22345678-c85f-11ea-87d0-0242ac130003','Bài 2','',NULL);

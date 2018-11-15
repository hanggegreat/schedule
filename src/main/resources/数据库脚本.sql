# 一、删除数据库
# DROP DATABASE IF EXISTS eduManagement;
# 二、创建数据库
# CREATE DATABASE eduManagement
#   CHARACTER SET UTF8;
# 三、使用数据库
# USE eduManagement;
# 四、删除数据表
DROP TABLE IF EXISTS pke_timetable;

DROP TABLE IF EXISTS pke_teach;

DROP TABLE IF EXISTS pke_program;

-- 五、创建数据表

-- 1.创建培养方案表
-- amount表示课程的课时数
-- exam表示考查方式，0表示考试，1表示考查
-- status表示发布状态，0表示待审核，1表示已发布，2表示未审核通过被驳回
CREATE TABLE pke_program (
  id         CHAR(7),
  year       CHAR(4),
  enrollYear CHAR(4),
  name       VARCHAR(20),
  amount     SMALLINT,
  exam       CHAR(1),
  status     CHAR(1),
  gradeNo    CHAR(1),
  subNo      CHAR(2),
  CONSTRAINT pk_program PRIMARY KEY (id)
)
  ENGINE = innodb;

-- 2.任课表
CREATE TABLE pke_teach (
  id        BIGINT AUTO_INCREMENT,
  teachNo   CHAR(19),
  programId CHAR(7),
  teacherNo CHAR(4),
  classNo   CHAR(8),
  CONSTRAINT pk_teach PRIMARY KEY (id)
)
  ENGINE = innodb;

-- 3.创建课程表
-- time表示所开课程是该班级每周的第几节
-- status表示发布状态，0表示待审核，1表示已发布
CREATE TABLE pke_timetable (
  id      CHAR(25),
  status  CHAR(1),
  time    SMALLINT,
  teachNo CHAR(19),
  roomNo  CHAR(3),
  CONSTRAINT pk_timetable PRIMARY KEY (id)
)
  ENGINE = innodb;

INSERT INTO pke_program
VALUES ('2018201', '2018', '2017', '语文1', 11, '1', '0', '2', '01');

DROP VIEW pke_teacherView;
DROP VIEW pke_studentView;
DROP VIEW pke_classView;
DROP VIEW pke_gradeView;
DROP VIEW pke_roomView;
DROP VIEW pke_subjectView;

CREATE VIEW pke_teacherView AS
  SELECT t.TeacherNo,
         TeacherName,
         TeacherSex,
         TeacherGrade,
         TeacherState,
         StateName,
         TeacherSub,
         subName,
         TeacherKey,
         TeacherJob,
         JobName
  FROM js0_teacher t,
       `js1.2_zhuang_tai` zt,
       `js3.0_xue_ke` xk,
       `js1.1_jiao_shi_zhi_wei` jszw,
       `js1.0_zhi_wei` zw
  WHERE t.TeacherState = zt.StateNo
    AND t.TeacherSub = xk.SubNo
    AND t.TeacherNo = jszw.TeacherNo
    AND jszw.TeacherJob = zw.JobNo;

CREATE VIEW pke_studentView AS
  SELECT Sno, Sname, Gender, ClassNo, SStatus, StuStaName, Password
  FROM XJ_Student s,
       XJ_StudentStaNo ss
  WHERE s.SStatus = ss.StuStaNo;

CREATE VIEW pke_classView AS
  SELECT ClassNo, ClassName, GradeNo, TeacherNo
  FROM XJ_Class;

CREATE VIEW pke_gradeView AS
  SELECT EnrollYear, GradeNo, OfficeNo
  FROM XJ_Grade;

CREATE VIEW pke_roomView AS
  SELECT RoomNo, fj.RoomFunctionNo, RoomFunctionContent, RoomNowPeople, RoomCapacity, RoomBlockNo
  FROM `js6.0_fang_jian` fj,
       `js6.1_fang_jian_gong_neng` fjgn
  WHERE fj.RoomFunctionNo = fjgn.RoomFunctionNo;

CREATE VIEW pke_subjectView AS
  SELECT xk.SubNo, SubName, xkzz.GradeNo, xkzz.TeacherNo, t.TeacherName
  FROM `js3.0_xue_ke` xk,
       `js3.1_xue_ke_zu_zhang` xkzz,
       js0_teacher t
  WHERE xk.SubNo = xkzz.SubNo
    AND xkzz.TeacherNo = t.TeacherNo;

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

# 五、创建数据表

# 1.创建培养方案表
# amount表示课程的课时数
# exam表示考查方式，0表示考试，1表示考查
# status表示发布状态，0表示待审核，1表示已发布，2表示未审核通过被驳回
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

# 2.任课表
CREATE TABLE pke_teach (
  id        BIGINT AUTO_INCREMENT,
  teachNo   CHAR(17),
  programId CHAR(7),
  teacherNo CHAR(4),
  classNo   CHAR(6),
  CONSTRAINT pk_teach PRIMARY KEY (id)
)
  ENGINE = innodb;

# 3.创建课程表
# time表示所开课程是该班级每周的第几节
# status表示发布状态，0表示待审核，1表示已发布
CREATE TABLE pke_timetable (
  id          BIGINT AUTO_INCREMENT,
  timetableNo CHAR(23),
  status      CHAR(1),
  time        SMALLINT,
  teachNo     CHAR(19),
  roomNo      CHAR(4),
  CONSTRAINT pk_timetable PRIMARY KEY (id)
)
  ENGINE = innodb;

# 培养方案测试数据
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016701', '2016', '2016', '语文1', 8, '1', '0', '7', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016702', '2016', '2016', '数学1', 11, '1', '0', '7', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016703', '2016', '2016', '英语1', 10, '1', '0', '7', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016706', '2016', '2016', '生物1', 2, '1', '0', '7', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016707', '2016', '2016', '历史1', 2, '1', '0', '7', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016708', '2016', '2016', '政治1', 2, '1', '0', '7', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016709', '2016', '2016', '地理1', 2, '1', '0', '7', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016710', '2016', '2016', '体育1', 1, '0', '0', '7', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016711', '2016', '2016', '艺术1', 1, '0', '0', '7', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016712', '2016', '2016', '信息科技1', 1, '0', '0', '7', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017801', '2017', '2016', '语文2', 8, '1', '0', '8', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017802', '2017', '2016', '数学2', 10, '1', '0', '8', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017803', '2017', '2016', '英语2', 8, '1', '0', '8', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017804', '2017', '2016', '物理1', 3, '1', '0', '8', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017806', '2017', '2016', '生物2', 2, '1', '0', '8', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017807', '2017', '2016', '历史2', 2, '1', '0', '8', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017808', '2017', '2016', '政治2', 2, '1', '0', '8', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017809', '2017', '2016', '地理2', 2, '1', '0', '8', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017810', '2017', '2016', '体育2', 1, '0', '0', '8', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017811', '2017', '2016', '艺术2', 1, '0', '0', '8', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017812', '2017', '2016', '信息科技2', 1, '0', '0', '8', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018901', '2018', '2016', '语文3', 8, '1', '0', '9', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018902', '2018', '2016', '数学3', 11, '1', '0', '9', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018903', '2018', '2016', '英语3', 10, '1', '0', '9', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018904', '2018', '2016', '物理2', 3, '1', '0', '9', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018905', '2018', '2016', '化学1', 2, '1', '0', '9', '05');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018907', '2018', '2016', '历史3', 2, '1', '0', '9', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018908', '2018', '2016', '政治3', 2, '1', '0', '9', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018910', '2018', '2016', '体育3', 1, '0', '0', '9', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018912', '2018', '2016', '信息科技3', 1, '0', '0', '9', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017701', '2017', '2017', '语文1', 9, '1', '0', '7', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017702', '2017', '2017', '数学1', 11, '1', '0', '7', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017703', '2017', '2017', '英语1', 9, '1', '0', '7', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017706', '2017', '2017', '生物1', 2, '1', '0', '7', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017707', '2017', '2017', '历史1', 2, '1', '0', '7', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017708', '2017', '2017', '政治1', 2, '1', '0', '7', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017709', '2017', '2017', '地理1', 2, '1', '0', '7', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017710', '2017', '2017', '体育1', 1, '0', '0', '7', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017711', '2017', '2017', '艺术1', 1, '0', '0', '7', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2017712', '2017', '2017', '信息科技1', 1, '0', '0', '7', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018801', '2018', '2017', '语文2', 7, '1', '0', '8', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018802', '2018', '2017', '数学2', 11, '1', '0', '8', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018803', '2018', '2017', '英语2', 8, '1', '0', '8', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018804', '2018', '2017', '物理1', 3, '1', '0', '8', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018806', '2018', '2017', '生物2', 2, '1', '0', '8', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018807', '2018', '2017', '历史2', 2, '1', '0', '8', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018808', '2018', '2017', '政治2', 2, '1', '0', '8', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018809', '2018', '2017', '地理2', 2, '1', '0', '8', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018810', '2018', '2017', '体育2', 1, '0', '0', '8', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018811', '2018', '2017', '艺术2', 1, '0', '0', '8', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018812', '2018', '2017', '信息科技2', 1, '0', '0', '8', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019901', '2019', '2017', '语文3', 9, '1', '0', '9', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019902', '2019', '2017', '数学3', 11, '1', '0', '9', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019903', '2019', '2017', '英语3', 9, '1', '0', '9', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019904', '2019', '2017', '物理2', 3, '1', '0', '9', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019905', '2019', '2017', '化学1', 2, '1', '0', '9', '05');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019907', '2019', '2017', '历史3', 2, '1', '0', '9', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019908', '2019', '2017', '政治3', 2, '1', '0', '9', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019910', '2019', '2017', '体育3', 1, '0', '0', '9', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019912', '2019', '2017', '信息科技3', 1, '0', '0', '9', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018701', '2018', '2018', '语文1', 9, '1', '0', '7', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018702', '2018', '2018', '数学1', 10, '1', '0', '7', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018703', '2018', '2018', '英语1', 10, '1', '0', '7', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018706', '2018', '2018', '生物1', 2, '1', '0', '7', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018707', '2018', '2018', '历史1', 2, '1', '0', '7', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018708', '2018', '2018', '政治1', 2, '1', '0', '7', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018709', '2018', '2018', '地理1', 2, '1', '0', '7', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018710', '2018', '2018', '体育1', 1, '0', '0', '7', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018711', '2018', '2018', '艺术1', 1, '0', '0', '7', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018712', '2018', '2018', '信息科技1', 1, '0', '0', '7', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019801', '2019', '2018', '语文2', 8, '1', '0', '8', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019802', '2019', '2018', '数学2', 10, '1', '0', '8', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019803', '2019', '2018', '英语2', 8, '1', '0', '8', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019804', '2019', '2018', '物理1', 3, '1', '0', '8', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019806', '2019', '2018', '生物2', 2, '1', '0', '8', '06');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019807', '2019', '2018', '历史2', 2, '1', '0', '8', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019808', '2019', '2018', '政治2', 2, '1', '0', '8', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019809', '2019', '2018', '地理2', 2, '1', '0', '8', '09');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019810', '2019', '2018', '体育2', 1, '0', '0', '8', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019811', '2019', '2018', '艺术2', 1, '0', '0', '8', '11');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2019812', '2019', '2018', '信息科技2', 1, '0', '0', '8', '12');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020901', '2020', '2018', '语文3', 8, '1', '0', '9', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020902', '2020', '2018', '数学3', 12, '1', '0', '9', '02');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020903', '2020', '2018', '英语3', 9, '1', '0', '9', '03');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020904', '2020', '2018', '物理2', 3, '1', '0', '9', '04');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020905', '2020', '2018', '化学1', 2, '1', '0', '9', '05');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020907', '2020', '2018', '历史3', 2, '1', '0', '9', '07');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020908', '2020', '2018', '政治3', 2, '1', '0', '9', '08');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020910', '2020', '2018', '体育3', 1, '0', '0', '9', '10');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2020912', '2020', '2018', '信息科技3', 1, '0', '0', '9', '12');
# 任教测试数据
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090012201702', '2018809', '0012', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010046201603', '2018901', '0046', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060033201801', '2018706', '0033', '201801');
# 课表测试数据
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo)
VALUES ('20188090012201702110105', '0', 5, '20188090012201702', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo)
VALUES ('20188090012201702110116', '0', 16, '20189010046201603', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo)
VALUES ('20188090012201702110137', '0', 37, '20187060033201801', '1309');

# DROP VIEW pke_teacherView;
# DROP VIEW pke_studentView;
# DROP VIEW pke_classView;
# DROP VIEW pke_gradeView;
# DROP VIEW pke_roomView;
# DROP VIEW pke_subjectView;
#
# CREATE VIEW pke_teacherView AS
#   SELECT t.TeacherNo,
#          TeacherName,
#          TeacherSex,
#          TeacherGrade,
#          TeacherState,
#          StateName,
#          TeacherSub,
#          subName,
#          TeacherKey,
#          TeacherJob,
#          JobName
#   FROM js0_teacher t,
#        `js1.2_zhuang_tai` zt,
#        `js3.0_xue_ke` xk,
#        `js1.1_jiao_shi_zhi_wei` jszw,
#        `js1.0_zhi_wei` zw
#   WHERE t.TeacherState = zt.StateNo
#     AND t.TeacherSub = xk.SubNo
#     AND t.TeacherNo = jszw.TeacherNo
#     AND jszw.TeacherJob = zw.JobNo;
#
# CREATE VIEW pke_studentView AS
#   SELECT Sno, Sname, Gender, ClassNo, SStatus, StuStaName, Password
#   FROM XJ_Student s,
#        XJ_StudentStaNo ss
#   WHERE s.SStatus = ss.StuStaNo;
#
# CREATE VIEW pke_classView AS
#   SELECT ClassNo, ClassName, GradeNo, TeacherNo
#   FROM XJ_Class;
#
# CREATE VIEW pke_gradeView AS
#   SELECT EnrollYear, GradeNo, OfficeNo
#   FROM XJ_Grade;
#
# CREATE VIEW pke_roomView AS
#   SELECT RoomNo, fj.RoomFunctionNo, RoomFunctionContent, RoomNowPeople, RoomCapacity, RoomBlockNo
#   FROM `js6.0_fang_jian` fj,
#        `js6.1_fang_jian_gong_neng` fjgn
#   WHERE fj.RoomFunctionNo = fjgn.RoomFunctionNo;
#
# CREATE VIEW pke_subjectView AS
#   SELECT xk.SubNo, SubName, xkzz.GradeNo, xkzz.TeacherNo, t.TeacherName
#   FROM `js3.0_xue_ke` xk,
#        `js3.1_xue_ke_zu_zhang` xkzz,
#        js0_teacher t
#   WHERE xk.SubNo = xkzz.SubNo
#     AND xkzz.TeacherNo = t.TeacherNo;
#
# DROP VIEW pke_teacherView;
# DROP VIEW pke_studentView;
# DROP VIEW pke_classView;
# DROP VIEW pke_gradeView;
# DROP VIEW pke_roomView;
# DROP VIEW pke_subjectView;
#
# CREATE VIEW pke_teacherView AS
#   SELECT t.TeacherNo,
#          TeacherName,
#          TeacherSex,
#          TeacherGrade,
#          TeacherState,
#          StateName,
#          TeacherSub,
#          subName,
#          TeacherKey,
#          TeacherJob,
#          JobName
#   FROM js0_teacher t,
#        `js1.2_zhuang_tai` zt,
#        `js3.0_xue_ke` xk,
#        `js1.1_jiao_shi_zhi_wei` jszw,
#        `js1.0_zhi_wei` zw
#   WHERE t.TeacherState = zt.StateNo
#     AND t.TeacherSub = xk.SubNo
#     AND t.TeacherNo = jszw.TeacherNo
#     AND jszw.TeacherJob = zw.JobNo;
#
# CREATE VIEW pke_studentView AS
#   SELECT Sno, Sname, Gender, ClassNo, SStatus, StuStaName, Password
#   FROM XJ_Student s,
#        XJ_StudentStaNo ss
#   WHERE s.SStatus = ss.StuStaNo;
#
# CREATE VIEW pke_classView AS
#   SELECT ClassNo, ClassName, GradeNo, TeacherNo
#   FROM XJ_Class;
#
# CREATE VIEW pke_gradeView AS
#   SELECT EnrollYear, GradeNo, OfficeNo
#   FROM XJ_Grade;
#
# CREATE VIEW pke_roomView AS
#   SELECT RoomNo, fj.RoomFunctionNo, RoomFunctionContent, RoomNowPeople, RoomCapacity, RoomBlockNo
#   FROM `js6.0_fang_jian` fj,
#        `js6.1_fang_jian_gong_neng` fjgn
#   WHERE fj.RoomFunctionNo = fjgn.RoomFunctionNo;
#
# CREATE VIEW pke_subjectView AS
#   SELECT xk.SubNo, SubName, xkzz.GradeNo, xkzz.TeacherNo, t.TeacherName
#   FROM `js3.0_xue_ke` xk,
#        `js3.1_xue_ke_zu_zhang` xkzz,
#        js0_teacher t
#   WHERE xk.SubNo = xkzz.SubNo
#     AND xkzz.TeacherNo = t.TeacherNo;

# 排课组权限
GRANT SELECT, UPDATE, INSERT ON eduManagement.pke_program TO 'pke'@'%';
GRANT SELECT, UPDATE, INSERT ON eduManagement.pke_teach TO 'pke'@'%';
GRANT SELECT, UPDATE, INSERT ON eduManagement.pke_timetable TO 'pke'@'%';
GRANT SELECT ON eduManagement.js0_teacher TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js1.0_zhi_wei` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js1.1_jiao_shi_zhi_wei` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js1.2_zhuang_tai` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js3.0_xue_ke` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js3.1_xue_ke_zu_zhang` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js6.0_fang_jian` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js6.1_fang_jian_gong_neng` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js6.2_fang_jian_zhuang_tai` TO 'pke'@'%';
GRANT SELECT ON eduManagement.`js6.3_lou` TO 'pke'@'%';
GRANT SELECT ON eduManagement.XJ_Class TO 'pke'@'%';
GRANT SELECT ON eduManagement.XJ_Grade TO 'pke'@'%';
GRANT SELECT ON eduManagement.XJ_Student TO 'pke'@'%';
GRANT SELECT ON eduManagement.XJ_StudentStaNo TO 'pke'@'%';
# 成绩1组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_largedetail TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_paperstate TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_score TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_singlescore TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_smalldetail TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_testpaperdetail TO 'cj1'@'%';
# 成绩2组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_ExamStatus TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_IssueStatus TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_Paper TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_PaperDetail TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_StudentScore TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_TotalScore TO 'cj2'@'%';
# 教师组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js0_teacher` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js1.0_zhi_wei` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js1.1_jiao_shi_zhi_wei` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js1.2_zhuang_tai` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js2.0_lou_ceng_nian_ji` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js2.3_ban_gong_shi_nian_ji` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js3.0_xue_ke` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js3.1_xue_ke_zu_zhang` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js4.1_jiao_xue_bei_ke` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js4.2_ke_cheng_zong_jie` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js5.0_shen_qing` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js5.2_shen_he` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js5.3_shen_he_zhuang_tai` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js6.0_fang_jian` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js6.1_fang_jian_gong_neng` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js6.2_fang_jian_zhuang_tai` TO 'js'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js6.3_lou` TO 'js'@'%';
GRANT SELECT ON eduManagement.pke_teach TO 'js'@'%';
GRANT SELECT ON eduManagement.pke_program TO 'js'@'%';
GRANT SELECT ON eduManagement.XJ_Class TO 'js'@'%';
GRANT SELECT ON eduManagement.XJ_Grade TO 'js'@'%';
GRANT SELECT ON eduManagement.XJ_GradeNum TO 'js'@'%';
# 评教组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_assess TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_cancel TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_JCbProject TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_jcProject TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_project TO 'pj'@'%';
# 排考组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_Exam TO 'pkao'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_ExamInfo TO 'pkao'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_ExamJK TO 'pkao'@'%';
# 学籍组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_ApplyModifyInform TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Bed TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Building TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Class TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_EnrollmentStatusModified TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Floor TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Grade TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_GradeNum TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_ModifyApplicationCont TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Room TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_SchoolYear TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Semester TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_Student TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_StudentStaNo TO 'xj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_StudentToDistribute TO 'xj'@'%';

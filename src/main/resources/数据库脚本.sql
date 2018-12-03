# 一、删除数据库
DROP DATABASE IF EXISTS eduManagement;
# 二、创建数据库
CREATE DATABASE eduManagement CHARACTER SET UTF8;
# 三、使用数据库
USE eduManagement;
# 四、删除数据表
DROP TABLE IF EXISTS pke_timetable;

DROP TABLE IF EXISTS pke_teach;

DROP TABLE IF EXISTS pke_program;

# 五、创建数据表

# 1.创建培养方案表
# amount表示课程的课时数
# exam表示考查方式 ，0表示考试，1表示考查
# status表示发布状态，0表示待审核，1表示已发布，2表示未审核通过被驳回
CREATE TABLE pke_program
(
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
CREATE TABLE pke_teach
(
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
CREATE TABLE pke_timetable
(
  id          BIGINT AUTO_INCREMENT,
  timetableNo CHAR(23),
  status      CHAR(1),
  time        SMALLINT,
  teachNo     CHAR(19),
  roomNo      CHAR(4),
  CONSTRAINT pk_timetable PRIMARY KEY (id)
)
  ENGINE = innodb;

# 培养方案数据
INSERT INTO pke_program(id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
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
# 任教数据
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010004201801', '2018701', '0004', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020005201801', '2018702', '0005', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030042201801', '2018703', '0042', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060009201801', '2018706', '0009', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070010201801', '2018707', '0010', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080011201801', '2018708', '0011', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090012201801', '2018709', '0012', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100013201801', '2018710', '0013', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110014201801', '2018711', '0014', '201801');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120015201801', '2018712', '0015', '201801');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010049201802', '2018701', '0049', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020005201802', '2018702', '0005', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030006201802', '2018703', '0006', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060060201802', '2018706', '0060', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070061201802', '2018707', '0061', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080062201802', '2018708', '0062', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090063201802', '2018709', '0063', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100064201802', '2018710', '0064', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110065201802', '2018711', '0065', '201802');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120066201802', '2018712', '0066', '201802');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010049201803', '2018701', '0049', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020050201803', '2018702', '0050', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030042201803', '2018703', '0042', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060009201803', '2018706', '0009', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070010201803', '2018707', '0010', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080011201803', '2018708', '0011', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090012201803', '2018709', '0012', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100013201803', '2018710', '0013', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110014201803', '2018711', '0014', '201803');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120015201803', '2018712', '0015', '201803');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010040201804', '2018701', '0040', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020041201804', '2018702', '0041', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030051201804', '2018703', '0051', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060060201804', '2018706', '0060', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070061201804', '2018707', '0061', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080062201804', '2018708', '0062', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090063201804', '2018709', '0063', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100064201804', '2018710', '0064', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110065201804', '2018711', '0065', '201804');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120066201804', '2018712', '0066', '201804');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010004201805', '2018701', '0004', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020050201805', '2018702', '0050', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030051201805', '2018703', '0051', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060009201805', '2018706', '0009', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070010201805', '2018707', '0010', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080011201805', '2018708', '0011', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090012201805', '2018709', '0012', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100013201805', '2018710', '0013', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110014201805', '2018711', '0014', '201805');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120015201805', '2018712', '0015', '201805');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010040201806', '2018701', '0040', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020041201806', '2018702', '0041', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030006201806', '2018703', '0006', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060060201806', '2018706', '0060', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070061201806', '2018707', '0061', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080062201806', '2018708', '0062', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090063201806', '2018709', '0063', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100064201806', '2018710', '0064', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110065201806', '2018711', '0065', '201806');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120066201806', '2018712', '0066', '201806');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010004201807', '2018701', '0004', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020005201807', '2018702', '0005', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030042201807', '2018703', '0042', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060009201807', '2018706', '0009', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070010201807', '2018707', '0010', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080011201807', '2018708', '0011', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090012201807', '2018709', '0012', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100013201807', '2018710', '0013', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110014201807', '2018711', '0014', '201807');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120015201807', '2018712', '0015', '201807');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187010049201808', '2018701', '0049', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187020041201808', '2018702', '0041', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187030006201808', '2018703', '0006', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187060060201808', '2018706', '0060', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187070061201808', '2018707', '0061', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187080062201808', '2018708', '0062', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187090063201808', '2018709', '0063', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187100064201808', '2018710', '0064', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187110065201808', '2018711', '0065', '201808');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20187120066201808', '2018712', '0066', '201808');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010016201701', '2018801', '0016', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020017201701', '2018802', '0017', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030018201701', '2018803', '0018', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040019201701', '2018804', '0019', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060021201701', '2018806', '0021', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070022201701', '2018807', '0022', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080023201701', '2018808', '0023', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090024201701', '2018809', '0024', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100025201701', '2018810', '0025', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110026201701', '2018811', '0026', '201701');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120027201701', '2018812', '0027', '201701');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010052201702', '2018801', '0052', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020053201702', '2018802', '0053', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030054201702', '2018803', '0054', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040067201702', '2018804', '0067', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060069201702', '2018806', '0069', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070070201702', '2018807', '0070', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080071201702', '2018808', '0071', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090072201702', '2018809', '0072', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100073201702', '2018810', '0073', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110074201702', '2018811', '0074', '201702');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120075201702', '2018812', '0075', '201702');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010043201703', '2018801', '0043', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020044201703', '2018802', '0044', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030045201703', '2018803', '0045', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040019201703', '2018804', '0019', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060021201703', '2018806', '0021', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070022201703', '2018807', '0022', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080023201703', '2018808', '0023', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090024201703', '2018809', '0024', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100025201703', '2018810', '0025', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110026201703', '2018811', '0026', '201703');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120027201703', '2018812', '0027', '201703');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010016201704', '2018801', '0016', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020017201704', '2018802', '0017', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030018201704', '2018803', '0018', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040067201704', '2018804', '0067', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060069201704', '2018806', '0069', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070070201704', '2018807', '0070', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080071201704', '2018808', '0071', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090072201704', '2018809', '0072', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100073201704', '2018810', '0073', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110074201704', '2018811', '0074', '201704');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120075201704', '2018812', '0075', '201704');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010016201705', '2018801', '0016', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020017201705', '2018802', '0017', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030018201705', '2018803', '0018', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040019201705', '2018804', '0019', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060021201705', '2018806', '0021', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070022201705', '2018807', '0022', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080023201705', '2018808', '0023', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090024201705', '2018809', '0024', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100025201705', '2018810', '0025', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110026201705', '2018811', '0026', '201705');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120027201705', '2018812', '0027', '201705');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010052201706', '2018801', '0052', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020053201706', '2018802', '0053', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030054201706', '2018803', '0054', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040067201706', '2018804', '0067', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060069201706', '2018806', '0069', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070070201706', '2018807', '0070', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080071201706', '2018808', '0071', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090072201706', '2018809', '0072', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100073201706', '2018810', '0073', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110074201706', '2018811', '0074', '201706');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120075201706', '2018812', '0075', '201706');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010043201707', '2018801', '0043', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020044201707', '2018802', '0044', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030045201707', '2018803', '0045', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040019201707', '2018804', '0019', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060021201707', '2018806', '0021', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070022201707', '2018807', '0022', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080023201707', '2018808', '0023', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090024201707', '2018809', '0024', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100025201707', '2018810', '0025', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110026201707', '2018811', '0026', '201707');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120027201707', '2018812', '0027', '201707');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188010016201708', '2018801', '0016', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020017201708', '2018802', '0017', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030018201708', '2018803', '0018', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188040067201708', '2018804', '0067', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188060069201708', '2018806', '0069', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188070070201708', '2018807', '0070', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188080071201708', '2018808', '0071', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188090072201708', '2018809', '0072', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188100073201708', '2018810', '0073', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188110074201708', '2018811', '0074', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188120075201708', '2018812', '0075', '201708');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010028201601', '2018901', '0028', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020029201601', '2018902', '0029', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030030201601', '2018903', '0030', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040031201601', '2018904', '0031', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050032201601', '2018905', '0032', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070034201601', '2018907', '0034', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080035201601', '2018908', '0035', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100037201601', '2018910', '0037', '201601');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120039201601', '2018912', '0039', '201601');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010046201602', '2018901', '0046', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020047201602', '2018902', '0047', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030048201602', '2018903', '0048', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040076201602', '2018904', '0076', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050077201602', '2018905', '0077', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070079201602', '2018907', '0079', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080080201602', '2018908', '0080', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100082201602', '2018910', '0082', '201602');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120084201602', '2018912', '0084', '201602');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010055201603', '2018901', '0055', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020056201603', '2018902', '0056', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030057201603', '2018903', '0057', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040031201603', '2018904', '0031', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050032201603', '2018905', '0032', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070034201603', '2018907', '0034', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080035201603', '2018908', '0035', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100037201603', '2018910', '0037', '201603');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120039201603', '2018912', '0039', '201603');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010028201604', '2018901', '0028', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020029201604', '2018902', '0029', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030030201604', '2018903', '0030', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040076201604', '2018904', '0076', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050077201604', '2018905', '0077', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070079201604', '2018907', '0079', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080080201604', '2018908', '0080', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100082201604', '2018910', '0082', '201604');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120084201604', '2018912', '0084', '201604');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010046201605', '2018901', '0046', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020047201605', '2018902', '0047', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030048201605', '2018903', '0048', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040031201605', '2018904', '0031', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050032201605', '2018905', '0032', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070034201605', '2018907', '0034', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080035201605', '2018908', '0035', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100037201605', '2018910', '0037', '201605');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120039201605', '2018912', '0039', '201605');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010055201606', '2018901', '0055', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020056201606', '2018902', '0056', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030057201606', '2018903', '0057', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040076201606', '2018904', '0076', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050077201606', '2018905', '0077', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070079201606', '2018907', '0079', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080080201606', '2018908', '0080', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100082201606', '2018910', '0082', '201606');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120084201606', '2018912', '0084', '201606');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010028201607', '2018901', '0028', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020029201607', '2018902', '0029', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030030201607', '2018903', '0030', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040031201607', '2018904', '0031', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050032201607', '2018905', '0032', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070034201607', '2018907', '0034', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080035201607', '2018908', '0035', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100037201607', '2018910', '0037', '201607');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120039201607', '2018912', '0039', '201607');

INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189010046201608', '2018901', '0046', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189020047201608', '2018902', '0047', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189030048201608', '2018903', '0048', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189040076201608', '2018904', '0076', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189050077201608', '2018905', '0077', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189070079201608', '2018907', '0079', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189080080201608', '2018908', '0080', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189100082201608', '2018910', '0082', '201608');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20189120084201608', '2018912', '0084', '201608');

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
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_largedetail TO 'cj1' @ '%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_paperstate TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_score TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_singlescore TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_smalldetail TO 'cj1'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.cj1_testpaperdetail TO 'cj1'@'%';
# 成绩2组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_ExamStatus TO 'cj2' @ '%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_IssueStatus TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_Paper TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_PaperDetail TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_StudentScore TO 'cj2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.CJ2_TotalScore TO 'cj2'@'%';
# 教师组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.`js0_teacher` TO 'js' @ '%';
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
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_assess TO 'pj' @ '%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_cancel TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_JCbProject TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_jcProject TO 'pj'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pj_project TO 'pj'@'%';
# 排考组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_Exam TO 'pkao' @ '%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_ExamInfo TO 'pkao'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.pkao_ExamJK TO 'pkao'@'%';
# 学籍组权限
GRANT SELECT, INSERT, UPDATE, DELETE ON eduManagement.XJ_ApplyModifyInform TO 'xj' @ '%';
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

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
VALUES ('2016701', '2016', '2016', '语文1', 9, '1', '0', '7', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2016702', '2016', '2016', '数学1', 10, '1', '0', '7', '02');
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
VALUES ('2018901', '2018', '2016', '语文3', 9, '1', '0', '9', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018902', '2018', '2016', '数学3', 10, '1', '0', '9', '02');
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
VALUES ('2018801', '2018', '2017', '语文2', 8, '1', '0', '8', '01');
INSERT INTO pke_program (id, year, enrollYear, name, amount, exam, status, gradeNo, subNo)
VALUES ('2018802', '2018', '2017', '数学2', 10, '1', '0', '8', '02');
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
VALUES ('20188010043201708', '2018801', '0043', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188020044201708', '2018802', '0044', '201708');
INSERT INTO pke_teach (teachNo, programId, teacherNo, classNo)
VALUES ('20188030045201708', '2018803', '0045', '201708');
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


INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601131209', '0', 9, '20189010028201601', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601131719', '0', 19, '20189010028201601', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601130715', '0', 15, '20189010028201601', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601131322', '0', 22, '20189010028201601', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601130808', '0', 8, '20189010028201601', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601130125', '0', 25, '20189010028201601', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601131840', '0', 40, '20189010028201601', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601130814', '0', 14, '20189010028201601', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201601131428', '0', 28, '20189010028201601', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601131529', '0', 29, '20189020029201601', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601130104', '0', 4, '20189020029201601', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601131732', '0', 32, '20189020029201601', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601131336', '0', 36, '20189020029201601', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601130823', '0', 23, '20189020029201601', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601130503', '0', 3, '20189020029201601', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601132012', '0', 12, '20189020029201601', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601131334', '0', 34, '20189020029201601', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601131511', '0', 11, '20189020029201601', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201601130430', '0', 30, '20189020029201601', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131302', '0', 2, '20189030030201601', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131217', '0', 17, '20189030030201601', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601130431', '0', 31, '20189030030201601', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601132005', '0', 5, '20189030030201601', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131637', '0', 37, '20189030030201601', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131901', '0', 1, '20189030030201601', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601130310', '0', 10, '20189030030201601', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131624', '0', 24, '20189030030201601', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601131939', '0', 39, '20189030030201601', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201601130318', '0', 18, '20189030030201601', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201601131507', '0', 7, '20189040031201601', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201601130626', '0', 26, '20189040031201601', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201601130416', '0', 16, '20189040031201601', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201601131621', '0', 21, '20189050032201601', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201601130513', '0', 13, '20189050032201601', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201601131938', '0', 38, '20189070034201601', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201601131735', '0', 35, '20189070034201601', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201601131620', '0', 20, '20189080035201601', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201601130627', '0', 27, '20189080035201601', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100037201601210106', '0', 6, '20189100037201601', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120039201601131033', '0', 33, '20189120039201601', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602131618', '0', 18, '20189010046201602', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602130529', '0', 29, '20189010046201602', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602130820', '0', 20, '20189010046201602', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602131508', '0', 8, '20189010046201602', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602131727', '0', 27, '20189010046201602', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602131405', '0', 5, '20189010046201602', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602130326', '0', 26, '20189010046201602', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602131915', '0', 15, '20189010046201602', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201602130433', '0', 33, '20189010046201602', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130440', '0', 40, '20189020047201602', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130206', '0', 6, '20189020047201602', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130838', '0', 38, '20189020047201602', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130804', '0', 4, '20189020047201602', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130602', '0', 2, '20189020047201602', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602131203', '0', 3, '20189020047201602', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602132028', '0', 28, '20189020047201602', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130437', '0', 37, '20189020047201602', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130419', '0', 19, '20189020047201602', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201602130732', '0', 32, '20189020047201602', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602131514', '0', 14, '20189030048201602', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602130330', '0', 30, '20189030048201602', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602131821', '0', 21, '20189030048201602', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602131707', '0', 7, '20189030048201602', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602130522', '0', 22, '20189030048201602', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602130824', '0', 24, '20189030048201602', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602131235', '0', 35, '20189030048201602', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602130317', '0', 17, '20189030048201602', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602131613', '0', 13, '20189030048201602', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201602132016', '0', 16, '20189030048201602', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201602131923', '0', 23, '20189040076201602', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201602130536', '0', 36, '20189040076201602', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201602131909', '0', 9, '20189040076201602', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201602130439', '0', 39, '20189050077201602', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201602131931', '0', 31, '20189050077201602', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201602132025', '0', 25, '20189070079201602', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201602130312', '0', 12, '20189070079201602', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201602130510', '0', 10, '20189080080201602', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201602130234', '0', 34, '20189080080201602', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100082201602210111', '0', 11, '20189100082201602', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120084201602131001', '0', 1, '20189120084201602', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603130737', '0', 37, '20189010055201603', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603130140', '0', 40, '20189010055201603', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603131622', '0', 22, '20189010055201603', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603131215', '0', 15, '20189010055201603', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603131919', '0', 19, '20189010055201603', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603132004', '0', 4, '20189010055201603', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603130118', '0', 18, '20189010055201603', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603131401', '0', 1, '20189010055201603', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201603130827', '0', 27, '20189010055201603', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130214', '0', 14, '20189020056201603', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130530', '0', 30, '20189020056201603', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603131705', '0', 5, '20189020056201603', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603131321', '0', 21, '20189020056201603', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603131510', '0', 10, '20189020056201603', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130632', '0', 32, '20189020056201603', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603131516', '0', 16, '20189020056201603', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130113', '0', 13, '20189020056201603', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130623', '0', 23, '20189020056201603', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201603130638', '0', 38, '20189020056201603', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603131803', '0', 3, '20189030057201603', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603131608', '0', 8, '20189030057201603', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603130333', '0', 33, '20189030057201603', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603132017', '0', 17, '20189030057201603', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603131231', '0', 31, '20189030057201603', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603130435', '0', 35, '20189030057201603', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603130526', '0', 26, '20189030057201603', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603131809', '0', 9, '20189030057201603', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603131736', '0', 36, '20189030057201603', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201603132029', '0', 29, '20189030057201603', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201603130506', '0', 6, '20189040031201603', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201603131411', '0', 11, '20189040031201603', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201603130612', '0', 12, '20189040031201603', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201603131924', '0', 24, '20189050032201603', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201603131325', '0', 25, '20189050032201603', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201603131402', '0', 2, '20189070034201603', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201603131520', '0', 20, '20189070034201603', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201603130528', '0', 28, '20189080035201603', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201603130834', '0', 34, '20189080035201603', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100037201603210107', '0', 7, '20189100037201603', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120039201603131139', '0', 39, '20189120039201603', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604131639', '0', 39, '20189010028201604', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604130724', '0', 24, '20189010028201604', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604130429', '0', 29, '20189010028201604', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604130821', '0', 21, '20189010028201604', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604130611', '0', 11, '20189010028201604', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604131327', '0', 27, '20189010028201604', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604131301', '0', 1, '20189010028201604', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604130338', '0', 38, '20189010028201604', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201604131713', '0', 13, '20189010028201604', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604131920', '0', 20, '20189020029201604', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130610', '0', 10, '20189020029201604', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130205', '0', 5, '20189020029201604', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130306', '0', 6, '20189020029201604', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130816', '0', 16, '20189020029201604', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130509', '0', 9, '20189020029201604', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604131722', '0', 22, '20189020029201604', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604131926', '0', 26, '20189020029201604', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604130128', '0', 28, '20189020029201604', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201604131918', '0', 18, '20189020029201604', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604130407', '0', 7, '20189030030201604', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604132014', '0', 14, '20189030030201604', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604130415', '0', 15, '20189030030201604', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604131636', '0', 36, '20189030030201604', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604132003', '0', 3, '20189030030201604', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604130608', '0', 8, '20189030030201604', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604132033', '0', 33, '20189030030201604', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604132040', '0', 40, '20189030030201604', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604130119', '0', 19, '20189030030201604', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201604131712', '0', 12, '20189030030201604', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201604131804', '0', 4, '20189040076201604', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201604131517', '0', 17, '20189040076201604', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201604132031', '0', 31, '20189040076201604', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201604131523', '0', 23, '20189050077201604', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201604130835', '0', 35, '20189050077201604', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201604130334', '0', 34, '20189070079201604', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201604130102', '0', 2, '20189070079201604', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201604131725', '0', 25, '20189080080201604', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201604130532', '0', 32, '20189080080201604', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100082201604210130', '0', 30, '20189100082201604', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120084201604131137', '0', 37, '20189120084201604', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130109', '0', 9, '20189010046201605', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130521', '0', 21, '20189010046201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130422', '0', 22, '20189010046201605', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130634', '0', 34, '20189010046201605', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130504', '0', 4, '20189010046201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130631', '0', 31, '20189010046201605', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605131814', '0', 14, '20189010046201605', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605130540', '0', 40, '20189010046201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201605131436', '0', 36, '20189010046201605', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130313', '0', 13, '20189020047201605', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605131729', '0', 29, '20189020047201605', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130217', '0', 17, '20189020047201605', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130825', '0', 25, '20189020047201605', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605131815', '0', 15, '20189020047201605', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130539', '0', 39, '20189020047201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130308', '0', 8, '20189020047201605', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605130527', '0', 27, '20189020047201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605131433', '0', 33, '20189020047201605', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201605132026', '0', 26, '20189020047201605', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605130511', '0', 11, '20189030048201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605130832', '0', 32, '20189030048201605', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605131318', '0', 18, '20189030048201605', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605132038', '0', 38, '20189030048201605', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605131905', '0', 5, '20189030048201605', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605130628', '0', 28, '20189030048201605', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605130703', '0', 3, '20189030048201605', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605130712', '0', 12, '20189030048201605', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605131223', '0', 23, '20189030048201605', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201605131906', '0', 6, '20189030048201605', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201605131330', '0', 30, '20189040031201605', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201605130720', '0', 20, '20189040031201605', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201605131219', '0', 19, '20189040031201605', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201605131307', '0', 7, '20189050032201605', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201605130810', '0', 10, '20189050032201605', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201605130124', '0', 24, '20189070034201605', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201605132001', '0', 1, '20189070034201605', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201605130537', '0', 37, '20189080035201605', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201605131716', '0', 16, '20189080035201605', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100037201605210102', '0', 2, '20189100037201605', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120039201605131135', '0', 35, '20189120039201605', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131229', '0', 29, '20189010055201606', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131331', '0', 31, '20189010055201606', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131916', '0', 16, '20189010055201606', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606130130', '0', 30, '20189010055201606', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606130110', '0', 10, '20189010055201606', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131228', '0', 28, '20189010055201606', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131308', '0', 8, '20189010055201606', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606130309', '0', 9, '20189010055201606', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010055201606131502', '0', 2, '20189010055201606', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131701', '0', 1, '20189020056201606', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131434', '0', 34, '20189020056201606', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131512', '0', 12, '20189020056201606', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606130718', '0', 18, '20189020056201606', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131904', '0', 4, '20189020056201606', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131522', '0', 22, '20189020056201606', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131715', '0', 15, '20189020056201606', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131936', '0', 36, '20189020056201606', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131206', '0', 6, '20189020056201606', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020056201606131240', '0', 40, '20189020056201606', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606132023', '0', 23, '20189030057201606', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606131607', '0', 7, '20189030057201606', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130519', '0', 19, '20189030057201606', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130605', '0', 5, '20189030057201606', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130839', '0', 39, '20189030057201606', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130711', '0', 11, '20189030057201606', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130520', '0', 20, '20189030057201606', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130625', '0', 25, '20189030057201606', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130314', '0', 14, '20189030057201606', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030057201606130337', '0', 37, '20189030057201606', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201606131833', '0', 33, '20189040076201606', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201606131524', '0', 24, '20189040076201606', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201606130232', '0', 32, '20189040076201606', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201606131538', '0', 38, '20189050077201606', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201606131903', '0', 3, '20189050077201606', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201606131935', '0', 35, '20189070079201606', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201606130426', '0', 26, '20189070079201606', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201606130121', '0', 21, '20189080080201606', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201606130213', '0', 13, '20189080080201606', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100082201606210127', '0', 27, '20189100082201606', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120084201606131117', '0', 17, '20189120084201606', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130303', '0', 3, '20189010028201607', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607131326', '0', 26, '20189010028201607', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607131602', '0', 2, '20189010028201607', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130307', '0', 7, '20189010028201607', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130116', '0', 16, '20189010028201607', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130620', '0', 20, '20189010028201607', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607131723', '0', 23, '20189010028201607', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130717', '0', 17, '20189010028201607', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010028201607130305', '0', 5, '20189010028201607', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130738', '0', 38, '20189020029201607', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130727', '0', 27, '20189020029201607', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607131619', '0', 19, '20189020029201607', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607131731', '0', 31, '20189020029201607', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607131337', '0', 37, '20189020029201607', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130139', '0', 39, '20189020029201607', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130815', '0', 15, '20189020029201607', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130413', '0', 13, '20189020029201607', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130514', '0', 14, '20189020029201607', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020029201607130701', '0', 1, '20189020029201607', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607130229', '0', 29, '20189030030201607', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607130106', '0', 6, '20189030030201607', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607130425', '0', 25, '20189030030201607', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607131811', '0', 11, '20189030030201607', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607130621', '0', 21, '20189030030201607', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607130730', '0', 30, '20189030030201607', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607131335', '0', 35, '20189030030201607', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607132022', '0', 22, '20189030030201607', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607131934', '0', 34, '20189030030201607', '1319');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030030201607131828', '0', 28, '20189030030201607', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201607130304', '0', 4, '20189040031201607', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201607131536', '0', 36, '20189040031201607', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040031201607130618', '0', 18, '20189040031201607', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201607131812', '0', 12, '20189050032201607', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050032201607131509', '0', 9, '20189050032201607', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201607131533', '0', 33, '20189070034201607', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070034201607131310', '0', 10, '20189070034201607', '1313');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201607131408', '0', 8, '20189080035201607', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080035201607130640', '0', 40, '20189080035201607', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100037201607210132', '0', 32, '20189100037201607', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120039201607131024', '0', 24, '20189120039201607', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608131616', '0', 16, '20189010046201608', '1316');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130325', '0', 25, '20189010046201608', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130417', '0', 17, '20189010046201608', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608132007', '0', 7, '20189010046201608', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130123', '0', 23, '20189010046201608', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130837', '0', 37, '20189010046201608', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608131432', '0', 32, '20189010046201608', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130603', '0', 3, '20189010046201608', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189010046201608130702', '0', 2, '20189010046201608', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608130714', '0', 14, '20189020047201608', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608131431', '0', 31, '20189020047201608', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608131212', '0', 12, '20189020047201608', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608132021', '0', 21, '20189020047201608', '1320');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608130524', '0', 24, '20189020047201608', '1305');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608131534', '0', 34, '20189020047201608', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608130311', '0', 11, '20189020047201608', '1303');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608131830', '0', 30, '20189020047201608', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608130809', '0', 9, '20189020047201608', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189020047201608131418', '0', 18, '20189020047201608', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608131426', '0', 26, '20189030048201608', '1314');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130801', '0', 1, '20189030048201608', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608131239', '0', 39, '20189030048201608', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130736', '0', 36, '20189030048201608', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130615', '0', 15, '20189030048201608', '1306');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130240', '0', 40, '20189030048201608', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130120', '0', 20, '20189030048201608', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608131710', '0', 10, '20189030048201608', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130719', '0', 19, '20189030048201608', '1307');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189030048201608130427', '0', 27, '20189030048201608', '1304');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201608131208', '0', 8, '20189040076201608', '1312');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201608131829', '0', 29, '20189040076201608', '1318');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189040076201608130135', '0', 35, '20189040076201608', '1301');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201608131505', '0', 5, '20189050077201608', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189050077201608130204', '0', 4, '20189050077201608', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201608131728', '0', 28, '20189070079201608', '1317');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189070079201608130222', '0', 22, '20189070079201608', '1302');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201608131506', '0', 6, '20189080080201608', '1315');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189080080201608130833', '0', 33, '20189080080201608', '1308');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189100082201608210138', '0', 38, '20189100082201608', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20189120084201608131113', '0', 13, '20189120084201608', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801110527', '0', 27, '20187010004201801', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801110106', '0', 6, '20187010004201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801110116', '0', 16, '20187010004201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801110309', '0', 9, '20187010004201801', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801111411', '0', 11, '20187010004201801', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801111315', '0', 15, '20187010004201801', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801110102', '0', 2, '20187010004201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801112019', '0', 19, '20187010004201801', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201801111612', '0', 12, '20187010004201801', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801110421', '0', 21, '20187020005201801', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801111620', '0', 20, '20187020005201801', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801111325', '0', 25, '20187020005201801', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801111924', '0', 24, '20187020005201801', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801110722', '0', 22, '20187020005201801', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801112023', '0', 23, '20187020005201801', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801110438', '0', 38, '20187020005201801', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801110434', '0', 34, '20187020005201801', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801112004', '0', 4, '20187020005201801', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201801110540', '0', 40, '20187020005201801', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801110117', '0', 17, '20187030042201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801111433', '0', 33, '20187030042201801', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801110636', '0', 36, '20187030042201801', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801110529', '0', 29, '20187030042201801', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801110814', '0', 14, '20187030042201801', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801110101', '0', 1, '20187030042201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801111837', '0', 37, '20187030042201801', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801111418', '0', 18, '20187030042201801', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801111805', '0', 5, '20187030042201801', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201801111907', '0', 7, '20187030042201801', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201801111626', '0', 26, '20187060009201801', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201801111910', '0', 10, '20187060009201801', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201801110113', '0', 13, '20187070010201801', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201801111831', '0', 31, '20187070010201801', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201801111303', '0', 3, '20187080011201801', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201801110230', '0', 30, '20187080011201801', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201801110839', '0', 39, '20187090012201801', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201801110632', '0', 32, '20187090012201801', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100013201801210135', '0', 35, '20187100013201801', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110014201801111128', '0', 28, '20187110014201801', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120015201801131008', '0', 8, '20187120015201801', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802112025', '0', 25, '20187010049201802', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802110838', '0', 38, '20187010049201802', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802111912', '0', 12, '20187010049201802', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802111816', '0', 16, '20187010049201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802111823', '0', 23, '20187010049201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802110437', '0', 37, '20187010049201802', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802111822', '0', 22, '20187010049201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802110310', '0', 10, '20187010049201802', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201802110521', '0', 21, '20187010049201802', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802110439', '0', 39, '20187020005201802', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802111627', '0', 27, '20187020005201802', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802110436', '0', 36, '20187020005201802', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802111403', '0', 3, '20187020005201802', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802112028', '0', 28, '20187020005201802', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802111835', '0', 35, '20187020005201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802111306', '0', 6, '20187020005201802', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802110107', '0', 7, '20187020005201802', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802110115', '0', 15, '20187020005201802', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201802111918', '0', 18, '20187020005201802', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802111820', '0', 20, '20187030006201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802111926', '0', 26, '20187030006201802', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802111314', '0', 14, '20187030006201802', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802111834', '0', 34, '20187030006201802', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110319', '0', 19, '20187030006201802', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110413', '0', 13, '20187030006201802', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110711', '0', 11, '20187030006201802', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110202', '0', 2, '20187030006201802', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110724', '0', 24, '20187030006201802', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201802110832', '0', 32, '20187030006201802', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201802111429', '0', 29, '20187060060201802', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201802112008', '0', 8, '20187060060201802', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201802110405', '0', 5, '20187070061201802', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201802110104', '0', 4, '20187070061201802', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201802110333', '0', 33, '20187080062201802', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201802111901', '0', 1, '20187080062201802', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201802110130', '0', 30, '20187090063201802', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201802111409', '0', 9, '20187090063201802', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100064201802210140', '0', 40, '20187100064201802', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110065201802111117', '0', 17, '20187110065201802', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120066201802131031', '0', 31, '20187120066201802', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803110705', '0', 5, '20187010049201803', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803112006', '0', 6, '20187010049201803', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803111609', '0', 9, '20187010049201803', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803111330', '0', 30, '20187010049201803', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803111307', '0', 7, '20187010049201803', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803111415', '0', 15, '20187010049201803', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803110708', '0', 8, '20187010049201803', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803111334', '0', 34, '20187010049201803', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201803110704', '0', 4, '20187010049201803', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803111424', '0', 24, '20187020050201803', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803111935', '0', 35, '20187020050201803', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803111326', '0', 26, '20187020050201803', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110237', '0', 37, '20187020050201803', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110422', '0', 22, '20187020050201803', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110616', '0', 16, '20187020050201803', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110603', '0', 3, '20187020050201803', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803111619', '0', 19, '20187020050201803', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110802', '0', 2, '20187020050201803', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201803110201', '0', 1, '20187020050201803', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110420', '0', 20, '20187030042201803', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110710', '0', 10, '20187030042201803', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110238', '0', 38, '20187030042201803', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803111421', '0', 21, '20187030042201803', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110532', '0', 32, '20187030042201803', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110211', '0', 11, '20187030042201803', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110428', '0', 28, '20187030042201803', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803112013', '0', 13, '20187030042201803', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110331', '0', 31, '20187030042201803', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201803110523', '0', 23, '20187030042201803', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201803110217', '0', 17, '20187060009201803', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201803110525', '0', 25, '20187060009201803', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201803112012', '0', 12, '20187070010201803', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201803111439', '0', 39, '20187070010201803', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201803110829', '0', 29, '20187080011201803', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201803110827', '0', 27, '20187080011201803', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201803111836', '0', 36, '20187090012201803', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201803111814', '0', 14, '20187090012201803', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100013201803210118', '0', 18, '20187100013201803', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110014201803111133', '0', 33, '20187110014201803', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120015201803131140', '0', 40, '20187120015201803', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110835', '0', 35, '20187010040201804', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110505', '0', 5, '20187010040201804', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110602', '0', 2, '20187010040201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804111922', '0', 22, '20187010040201804', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110412', '0', 12, '20187010040201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804111903', '0', 3, '20187010040201804', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110634', '0', 34, '20187010040201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804110407', '0', 7, '20187010040201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201804112031', '0', 31, '20187010040201804', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110739', '0', 39, '20187020041201804', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110337', '0', 37, '20187020041201804', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110613', '0', 13, '20187020041201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804111920', '0', 20, '20187020041201804', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110601', '0', 1, '20187020041201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804111333', '0', 33, '20187020041201804', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110416', '0', 16, '20187020041201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110821', '0', 21, '20187020041201804', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110406', '0', 6, '20187020041201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201804110108', '0', 8, '20187020041201804', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110410', '0', 10, '20187030051201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110727', '0', 27, '20187030051201804', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804111628', '0', 28, '20187030051201804', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804111936', '0', 36, '20187030051201804', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110404', '0', 4, '20187030051201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110514', '0', 14, '20187030051201804', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804112018', '0', 18, '20187030051201804', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110224', '0', 24, '20187030051201804', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110232', '0', 32, '20187030051201804', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201804110623', '0', 23, '20187030051201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201804110709', '0', 9, '20187060060201804', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201804110619', '0', 19, '20187060060201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201804110338', '0', 38, '20187070061201804', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201804110640', '0', 40, '20187070061201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201804111930', '0', 30, '20187080062201804', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201804110425', '0', 25, '20187080062201804', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201804110626', '0', 26, '20187090063201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201804110611', '0', 11, '20187090063201804', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100064201804210129', '0', 29, '20187100064201804', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110065201804111115', '0', 15, '20187110065201804', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120066201804131017', '0', 17, '20187120066201804', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805111323', '0', 23, '20187010004201805', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805111432', '0', 32, '20187010004201805', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805111331', '0', 31, '20187010004201805', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805111401', '0', 1, '20187010004201805', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805110435', '0', 35, '20187010004201805', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805110433', '0', 33, '20187010004201805', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805110208', '0', 8, '20187010004201805', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805110805', '0', 5, '20187010004201805', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201805112024', '0', 24, '20187010004201805', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805111428', '0', 28, '20187020050201805', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110213', '0', 13, '20187020050201805', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110720', '0', 20, '20187020050201805', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110534', '0', 34, '20187020050201805', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805111630', '0', 30, '20187020050201805', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805111327', '0', 27, '20187020050201805', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110706', '0', 6, '20187020050201805', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110721', '0', 21, '20187020050201805', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805111625', '0', 25, '20187020050201805', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020050201805110218', '0', 18, '20187020050201805', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805112015', '0', 15, '20187030051201805', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805112009', '0', 9, '20187030051201805', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110729', '0', 29, '20187030051201805', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110307', '0', 7, '20187030051201805', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805111811', '0', 11, '20187030051201805', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110226', '0', 26, '20187030051201805', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805111902', '0', 2, '20187030051201805', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110517', '0', 17, '20187030051201805', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110612', '0', 12, '20187030051201805', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030051201805110538', '0', 38, '20187030051201805', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201805111916', '0', 16, '20187060009201805', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201805111640', '0', 40, '20187060009201805', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201805112010', '0', 10, '20187070010201805', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201805110703', '0', 3, '20187070010201805', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201805111937', '0', 37, '20187080011201805', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201805110122', '0', 22, '20187080011201805', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201805111304', '0', 4, '20187090012201805', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201805110219', '0', 19, '20187090012201805', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100013201805210136', '0', 36, '20187100013201805', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110014201805111239', '0', 39, '20187110014201805', '1112');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120015201805131114', '0', 14, '20187120015201805', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806111313', '0', 13, '20187010040201806', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806110701', '0', 1, '20187010040201806', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806110311', '0', 11, '20187010040201806', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806111917', '0', 17, '20187010040201806', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806112040', '0', 40, '20187010040201806', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806112029', '0', 29, '20187010040201806', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806110630', '0', 30, '20187010040201806', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806110138', '0', 38, '20187010040201806', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010040201806111809', '0', 9, '20187010040201806', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111931', '0', 31, '20187020041201806', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806110618', '0', 18, '20187020041201806', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806110823', '0', 23, '20187020041201806', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806110124', '0', 24, '20187020041201806', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806110205', '0', 5, '20187020041201806', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111328', '0', 28, '20187020041201806', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111603', '0', 3, '20187020041201806', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111425', '0', 25, '20187020041201806', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111310', '0', 10, '20187020041201806', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201806111607', '0', 7, '20187020041201806', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806111806', '0', 6, '20187030006201806', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110537', '0', 37, '20187030006201806', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110635', '0', 35, '20187030006201806', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110508', '0', 8, '20187030006201806', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110127', '0', 27, '20187030006201806', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806111412', '0', 12, '20187030006201806', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806111322', '0', 22, '20187030006201806', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110833', '0', 33, '20187030006201806', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806110504', '0', 4, '20187030006201806', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201806111921', '0', 21, '20187030006201806', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201806110215', '0', 15, '20187060060201806', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201806110332', '0', 32, '20187060060201806', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201806110302', '0', 2, '20187070061201806', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201806111839', '0', 39, '20187070061201806', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201806110316', '0', 16, '20187080062201806', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201806110714', '0', 14, '20187080062201806', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201806110536', '0', 36, '20187090063201806', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201806110520', '0', 20, '20187090063201806', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100064201806210126', '0', 26, '20187100064201806', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110065201806121219', '0', 19, '20187110065201806', '1212');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120066201806131134', '0', 34, '20187120066201806', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807110125', '0', 25, '20187010004201807', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807111317', '0', 17, '20187010004201807', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807110828', '0', 28, '20187010004201807', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807111339', '0', 39, '20187010004201807', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807110114', '0', 14, '20187010004201807', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807111838', '0', 38, '20187010004201807', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807110340', '0', 40, '20187010004201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807111321', '0', 21, '20187010004201807', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010004201807111329', '0', 29, '20187010004201807', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110402', '0', 2, '20187020005201807', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807111309', '0', 9, '20187020005201807', '1113');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110732', '0', 32, '20187020005201807', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807111812', '0', 12, '20187020005201807', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110430', '0', 30, '20187020005201807', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807111819', '0', 19, '20187020005201807', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110801', '0', 1, '20187020005201807', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807112033', '0', 33, '20187020005201807', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110411', '0', 11, '20187020005201807', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020005201807110326', '0', 26, '20187020005201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807110335', '0', 35, '20187030042201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807110315', '0', 15, '20187030042201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111934', '0', 34, '20187030042201807', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807110816', '0', 16, '20187030042201807', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111608', '0', 8, '20187030042201807', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111422', '0', 22, '20187030042201807', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807110303', '0', 3, '20187030042201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111604', '0', 4, '20187030042201807', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111624', '0', 24, '20187030042201807', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030042201807111927', '0', 27, '20187030042201807', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201807111631', '0', 31, '20187060009201807', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060009201807110305', '0', 5, '20187060009201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201807110837', '0', 37, '20187070010201807', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070010201807110207', '0', 7, '20187070010201807', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201807110210', '0', 10, '20187080011201807', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080011201807111923', '0', 23, '20187080011201807', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201807110318', '0', 18, '20187090012201807', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090012201807111906', '0', 6, '20187090012201807', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100013201807210120', '0', 20, '20187100013201807', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110014201807121136', '0', 36, '20187110014201807', '1211');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120015201807131013', '0', 13, '20187120015201807', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808111832', '0', 32, '20187010049201808', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110320', '0', 20, '20187010049201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110314', '0', 14, '20187010049201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110819', '0', 19, '20187010049201808', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110228', '0', 28, '20187010049201808', '1102');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110103', '0', 3, '20187010049201808', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808111913', '0', 13, '20187010049201808', '1119');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110429', '0', 29, '20187010049201808', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187010049201808110826', '0', 26, '20187010049201808', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808111617', '0', 17, '20187020041201808', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110811', '0', 11, '20187020041201808', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110327', '0', 27, '20187020041201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808112030', '0', 30, '20187020041201808', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110109', '0', 9, '20187020041201808', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808111615', '0', 15, '20187020041201808', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110336', '0', 36, '20187020041201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808111402', '0', 2, '20187020041201808', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110312', '0', 12, '20187020041201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187020041201808110140', '0', 40, '20187020041201808', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808110539', '0', 39, '20187030006201808', '1105');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808112005', '0', 5, '20187030006201808', '1120');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808111807', '0', 7, '20187030006201808', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808110723', '0', 23, '20187030006201808', '1107');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808110325', '0', 25, '20187030006201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808110818', '0', 18, '20187030006201808', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808111616', '0', 16, '20187030006201808', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808110110', '0', 10, '20187030006201808', '1101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808111638', '0', 38, '20187030006201808', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187030006201808111431', '0', 31, '20187030006201808', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201808110321', '0', 21, '20187060060201808', '1103');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187060060201808111833', '0', 33, '20187060060201808', '1118');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201808111437', '0', 37, '20187070061201808', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187070061201808111634', '0', 34, '20187070061201808', '1116');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201808111435', '0', 35, '20187080062201808', '1114');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187080062201808110804', '0', 4, '20187080062201808', '1108');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201808110401', '0', 1, '20187090063201808', '1104');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187090063201808110622', '0', 22, '20187090063201808', '1106');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187100064201808210106', '0', 6, '20187100064201808', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187110065201808121208', '0', 8, '20187110065201808', '1212');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20187120066201808131124', '0', 24, '20187120066201808', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701121940', '0', 40, '20188010016201701', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701122009', '0', 9, '20188010016201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701122002', '0', 2, '20188010016201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701120423', '0', 23, '20188010016201701', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701121812', '0', 12, '20188010016201701', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701120728', '0', 28, '20188010016201701', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701121738', '0', 38, '20188010016201701', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201701120701', '0', 1, '20188010016201701', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121526', '0', 26, '20188020017201701', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701120527', '0', 27, '20188020017201701', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121934', '0', 34, '20188020017201701', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121910', '0', 10, '20188020017201701', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701122035', '0', 35, '20188020017201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121708', '0', 8, '20188020017201701', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701120706', '0', 6, '20188020017201701', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121417', '0', 17, '20188020017201701', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701121324', '0', 24, '20188020017201701', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201701120111', '0', 11, '20188020017201701', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701120504', '0', 4, '20188030018201701', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701121433', '0', 33, '20188030018201701', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701120407', '0', 7, '20188030018201701', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701121503', '0', 3, '20188030018201701', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701121931', '0', 31, '20188030018201701', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701121405', '0', 5, '20188030018201701', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701122014', '0', 14, '20188030018201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201701122025', '0', 25, '20188030018201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201701121316', '0', 16, '20188040019201701', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201701120618', '0', 18, '20188040019201701', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201701121321', '0', 21, '20188040019201701', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201701121919', '0', 19, '20188060021201701', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201701121430', '0', 30, '20188060021201701', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201701121629', '0', 29, '20188070022201701', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201701121720', '0', 20, '20188070022201701', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201701122039', '0', 39, '20188080023201701', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201701120515', '0', 15, '20188080023201701', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201701121822', '0', 22, '20188090024201701', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201701120336', '0', 36, '20188090024201701', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100025201701210113', '0', 13, '20188100025201701', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110026201701111232', '0', 32, '20188110026201701', '1112');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120027201701131037', '0', 37, '20188120027201701', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702122013', '0', 13, '20188010052201702', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702121539', '0', 39, '20188010052201702', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702120721', '0', 21, '20188010052201702', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702121431', '0', 31, '20188010052201702', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702120609', '0', 9, '20188010052201702', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702120115', '0', 15, '20188010052201702', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702120822', '0', 22, '20188010052201702', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201702121407', '0', 7, '20188010052201702', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120708', '0', 8, '20188020053201702', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702121937', '0', 37, '20188020053201702', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120229', '0', 29, '20188020053201702', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702121736', '0', 36, '20188020053201702', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120610', '0', 10, '20188020053201702', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120738', '0', 38, '20188020053201702', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702121820', '0', 20, '20188020053201702', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120711', '0', 11, '20188020053201702', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702120433', '0', 33, '20188020053201702', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201702122016', '0', 16, '20188020053201702', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702121519', '0', 19, '20188030054201702', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702121406', '0', 6, '20188030054201702', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702121603', '0', 3, '20188030054201702', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702120135', '0', 35, '20188030054201702', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702121702', '0', 2, '20188030054201702', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702120804', '0', 4, '20188030054201702', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702120824', '0', 24, '20188030054201702', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201702120827', '0', 27, '20188030054201702', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201702120714', '0', 14, '20188040067201702', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201702120330', '0', 30, '20188040067201702', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201702121440', '0', 40, '20188040067201702', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201702120528', '0', 28, '20188060069201702', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201702121612', '0', 12, '20188060069201702', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201702121423', '0', 23, '20188070070201702', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201702120426', '0', 26, '20188070070201702', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201702121525', '0', 25, '20188080071201702', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201702120101', '0', 1, '20188080071201702', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201702122017', '0', 17, '20188090072201702', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201702120432', '0', 32, '20188090072201702', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100073201702210105', '0', 5, '20188100073201702', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110074201702111134', '0', 34, '20188110074201702', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120075201702131118', '0', 18, '20188120075201702', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120210', '0', 10, '20188010043201703', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120440', '0', 40, '20188010043201703', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703121609', '0', 9, '20188010043201703', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120335', '0', 35, '20188010043201703', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703121733', '0', 33, '20188010043201703', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120816', '0', 16, '20188010043201703', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120129', '0', 29, '20188010043201703', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201703120530', '0', 30, '20188010043201703', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703120834', '0', 34, '20188020044201703', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703121302', '0', 2, '20188020044201703', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703120604', '0', 4, '20188020044201703', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703122031', '0', 31, '20188020044201703', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703121307', '0', 7, '20188020044201703', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703120722', '0', 22, '20188020044201703', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703120720', '0', 20, '20188020044201703', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703121512', '0', 12, '20188020044201703', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703121705', '0', 5, '20188020044201703', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201703121811', '0', 11, '20188020044201703', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703121719', '0', 19, '20188030045201703', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703120414', '0', 14, '20188030045201703', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703121723', '0', 23, '20188030045201703', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703120737', '0', 37, '20188030045201703', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703121424', '0', 24, '20188030045201703', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703121601', '0', 1, '20188030045201703', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703120513', '0', 13, '20188030045201703', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201703121838', '0', 38, '20188030045201703', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201703121626', '0', 26, '20188040019201703', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201703120803', '0', 3, '20188040019201703', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201703122015', '0', 15, '20188040019201703', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201703120228', '0', 28, '20188060021201703', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201703120536', '0', 36, '20188060021201703', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201703120106', '0', 6, '20188070022201703', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201703121317', '0', 17, '20188070022201703', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201703120825', '0', 25, '20188080023201703', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201703121427', '0', 27, '20188080023201703', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201703120118', '0', 18, '20188090024201703', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201703121721', '0', 21, '20188090024201703', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100025201703210139', '0', 39, '20188100025201703', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110026201703121108', '0', 8, '20188110026201703', '1211');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120027201703131132', '0', 32, '20188120027201703', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704121532', '0', 32, '20188010016201704', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704121710', '0', 10, '20188010016201704', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704121903', '0', 3, '20188010016201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704121924', '0', 24, '20188010016201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704120607', '0', 7, '20188010016201704', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704120704', '0', 4, '20188010016201704', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704121734', '0', 34, '20188010016201704', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201704120105', '0', 5, '20188010016201704', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120113', '0', 13, '20188020017201704', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704121518', '0', 18, '20188020017201704', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704121914', '0', 14, '20188020017201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704121602', '0', 2, '20188020017201704', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704121536', '0', 36, '20188020017201704', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120123', '0', 23, '20188020017201704', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120628', '0', 28, '20188020017201704', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120731', '0', 31, '20188020017201704', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120615', '0', 15, '20188020017201704', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201704120637', '0', 37, '20188020017201704', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704121916', '0', 16, '20188030018201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704120539', '0', 39, '20188030018201704', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704120212', '0', 12, '20188030018201704', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704121335', '0', 35, '20188030018201704', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704121322', '0', 22, '20188030018201704', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704121630', '0', 30, '20188030018201704', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704121340', '0', 40, '20188030018201704', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201704120221', '0', 21, '20188030018201704', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201704121420', '0', 20, '20188040067201704', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201704121909', '0', 9, '20188040067201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201704121833', '0', 33, '20188040067201704', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201704121726', '0', 26, '20188060069201704', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201704120108', '0', 8, '20188060069201704', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201704121327', '0', 27, '20188070070201704', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201704120817', '0', 17, '20188070070201704', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201704120306', '0', 6, '20188080071201704', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201704120338', '0', 38, '20188080071201704', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201704122019', '0', 19, '20188090072201704', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201704121925', '0', 25, '20188090072201704', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100073201704210101', '0', 1, '20188100073201704', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110074201704111111', '0', 11, '20188110074201704', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120075201704131129', '0', 29, '20188120075201704', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705122036', '0', 36, '20188010016201705', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705121622', '0', 22, '20188010016201705', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705120511', '0', 11, '20188010016201705', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705120625', '0', 25, '20188010016201705', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705120614', '0', 14, '20188010016201705', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705120316', '0', 16, '20188010016201705', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705122020', '0', 20, '20188010016201705', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010016201705120717', '0', 17, '20188010016201705', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121319', '0', 19, '20188020017201705', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121330', '0', 30, '20188020017201705', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121607', '0', 7, '20188020017201705', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121939', '0', 39, '20188020017201705', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705120204', '0', 4, '20188020017201705', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705120405', '0', 5, '20188020017201705', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705120109', '0', 9, '20188020017201705', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121401', '0', 1, '20188020017201705', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705120332', '0', 32, '20188020017201705', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020017201705121921', '0', 21, '20188020017201705', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705121727', '0', 27, '20188030018201705', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705120829', '0', 29, '20188030018201705', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705120302', '0', 2, '20188030018201705', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705121315', '0', 15, '20188030018201705', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705121826', '0', 26, '20188030018201705', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705121638', '0', 38, '20188030018201705', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705121908', '0', 8, '20188030018201705', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030018201705120437', '0', 37, '20188030018201705', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201705120540', '0', 40, '20188040019201705', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201705120333', '0', 33, '20188040019201705', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201705122010', '0', 10, '20188040019201705', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201705120124', '0', 24, '20188060021201705', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201705121331', '0', 31, '20188060021201705', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201705122028', '0', 28, '20188070022201705', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201705120435', '0', 35, '20188070022201705', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201705121513', '0', 13, '20188080023201705', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201705120818', '0', 18, '20188080023201705', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201705120323', '0', 23, '20188090024201705', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201705122003', '0', 3, '20188090024201705', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100025201705210106', '0', 6, '20188100025201705', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110026201705121234', '0', 34, '20188110026201705', '1212');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120027201705131012', '0', 12, '20188120027201705', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706120730', '0', 30, '20188010052201706', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706120238', '0', 38, '20188010052201706', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706121808', '0', 8, '20188010052201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706121510', '0', 10, '20188010052201706', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706122029', '0', 29, '20188010052201706', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706121827', '0', 27, '20188010052201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706121620', '0', 20, '20188010052201706', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010052201706120826', '0', 26, '20188010052201706', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121534', '0', 34, '20188020053201706', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706122040', '0', 40, '20188020053201706', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706120624', '0', 24, '20188020053201706', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121707', '0', 7, '20188020053201706', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121902', '0', 2, '20188020053201706', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706120835', '0', 35, '20188020053201706', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706120809', '0', 9, '20188020053201706', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121825', '0', 25, '20188020053201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121614', '0', 14, '20188020053201706', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020053201706121901', '0', 1, '20188020053201706', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706122037', '0', 37, '20188030054201706', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706121718', '0', 18, '20188030054201706', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706120415', '0', 15, '20188030054201706', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706120131', '0', 31, '20188030054201706', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706120413', '0', 13, '20188030054201706', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706120417', '0', 17, '20188030054201706', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706121911', '0', 11, '20188030054201706', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030054201706121836', '0', 36, '20188030054201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201706121439', '0', 39, '20188040067201706', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201706121803', '0', 3, '20188040067201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201706121828', '0', 28, '20188040067201706', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201706121505', '0', 5, '20188060069201706', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201706120116', '0', 16, '20188060069201706', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201706120506', '0', 6, '20188070070201706', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201706120233', '0', 33, '20188070070201706', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201706121304', '0', 4, '20188080071201706', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201706120319', '0', 19, '20188080071201706', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201706120223', '0', 23, '20188090072201706', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201706121412', '0', 12, '20188090072201706', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100073201706210122', '0', 22, '20188100073201706', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110074201706111121', '0', 21, '20188110074201706', '1111');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120075201706131032', '0', 32, '20188120075201706', '1310');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707122038', '0', 38, '20188010043201707', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707120119', '0', 19, '20188010043201707', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707120425', '0', 25, '20188010043201707', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707121713', '0', 13, '20188010043201707', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707120214', '0', 14, '20188010043201707', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707121737', '0', 37, '20188010043201707', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707120439', '0', 39, '20188010043201707', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201707120317', '0', 17, '20188010043201707', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707121523', '0', 23, '20188020044201707', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707120126', '0', 26, '20188020044201707', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707120810', '0', 10, '20188020044201707', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707120303', '0', 3, '20188020044201707', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707121524', '0', 24, '20188020044201707', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707120733', '0', 33, '20188020044201707', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707121728', '0', 28, '20188020044201707', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707121408', '0', 8, '20188020044201707', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707121840', '0', 40, '20188020044201707', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201707122018', '0', 18, '20188020044201707', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707121515', '0', 15, '20188030045201707', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707121529', '0', 29, '20188030045201707', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707121716', '0', 16, '20188030045201707', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707121807', '0', 7, '20188030045201707', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707120734', '0', 34, '20188030045201707', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707120535', '0', 35, '20188030045201707', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707120320', '0', 20, '20188030045201707', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201707121805', '0', 5, '20188030045201707', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201707120611', '0', 11, '20188040019201707', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201707120732', '0', 32, '20188040019201707', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040019201707121731', '0', 31, '20188040019201707', '1217');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201707120122', '0', 22, '20188060021201707', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060021201707120404', '0', 4, '20188060021201707', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201707120209', '0', 9, '20188070022201707', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070022201707120202', '0', 2, '20188070022201707', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201707120806', '0', 6, '20188080023201707', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080023201707121530', '0', 30, '20188080023201707', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201707120612', '0', 12, '20188090024201707', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090024201707122027', '0', 27, '20188090024201707', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100025201707210121', '0', 21, '20188100025201707', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110026201707111236', '0', 36, '20188110026201707', '1112');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120027201707131101', '0', 1, '20188120027201707', '1311');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120520', '0', 20, '20188010043201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120715', '0', 15, '20188010043201708', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120127', '0', 27, '20188010043201708', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120428', '0', 28, '20188010043201708', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120402', '0', 2, '20188010043201708', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708121618', '0', 18, '20188010043201708', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120326', '0', 26, '20188010043201708', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188010043201708120522', '0', 22, '20188010043201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708120438', '0', 38, '20188020044201708', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708120801', '0', 1, '20188020044201708', '1208');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708121930', '0', 30, '20188020044201708', '1219');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708120339', '0', 39, '20188020044201708', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708122021', '0', 21, '20188020044201708', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708121813', '0', 13, '20188020044201708', '1218');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708121514', '0', 14, '20188020044201708', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708120517', '0', 17, '20188020044201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708120232', '0', 32, '20188020044201708', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188020044201708121537', '0', 37, '20188020044201708', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708120412', '0', 12, '20188030045201708', '1204');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708121333', '0', 33, '20188030045201708', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708121411', '0', 11, '20188030045201708', '1214');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708120509', '0', 9, '20188030045201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708121325', '0', 25, '20188030045201708', '1213');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708120631', '0', 31, '20188030045201708', '1206');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708120310', '0', 10, '20188030045201708', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188030045201708120308', '0', 8, '20188030045201708', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201708120219', '0', 19, '20188040067201708', '1202');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201708120524', '0', 24, '20188040067201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188040067201708120516', '0', 16, '20188040067201708', '1205');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201708121604', '0', 4, '20188060069201708', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188060069201708120103', '0', 3, '20188060069201708', '1201');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201708121634', '0', 34, '20188070070201708', '1216');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188070070201708121507', '0', 7, '20188070070201708', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201708122023', '0', 23, '20188080071201708', '1220');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188080071201708120329', '0', 29, '20188080071201708', '1203');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201708121535', '0', 35, '20188090072201708', '1215');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188090072201708120705', '0', 5, '20188090072201708', '1207');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188100073201708210106', '0', 6, '20188100073201708', '2101');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188110074201708121240', '0', 40, '20188110074201708', '1212');
INSERT INTO pke_timetable (timetableNo, status, time, teachNo, roomNo) VALUES ('20188120075201708131036', '0', 36, '20188120075201708', '1310');


GRANT SELECT, UPDATE, INSERT ON eduManagement.pke_teach TO 'pke'@'%';
GRANT SELECT, UPDATE, INSERT ON pke_timetable TO 'pke'@'%';
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

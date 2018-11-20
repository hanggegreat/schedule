package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.domain.Timetable;

import java.util.List;
import java.util.Map;

public interface TimetableService {
    /**
     * 学生查询自己指定学年的全部课表信息
     *
     * @param sno  学生编号
     * @param year 学年编号
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> listStudentTable(String sno, String year);

    /**
     * 任课教师查询自己指定学年的全部课表信息
     * 班主任，年级组长，教务员，学科组长，教务主任查询权限内的指定教师的全部课表信息
     *
     * @param teacherNo 教师编号
     * @param year      学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listTeacherTable(String teacherNo, String year);

    /**
     * 班主任查询自己所在班级指定学年的全部课表信息
     *
     * @param teacher 班主任
     * @param year    学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByClassTeacher(Teacher teacher, String year);

    /**
     * 学科组长查询课表前的查询操作，包含以下操作：
     * <li>查询出学科组长的学科信息</li>
     * <li>查询出学科组长所在年级的所有班级信息</li>
     *
     * @param teacher 学科组长
     * @return 以"Map<String, Object>"集合的形式返回全部数据，包含如下内容：
     * <li>key = subNo, value = teacher.getSubject().getSubNo()</li>
     * <li>key = allClasses, value = ClassRepository.findAllByGradeNo()</li>
     */
    Map<String, Object> preListTableBySubLeader(Teacher teacher);

    /**
     * 学科组长查询该学年所在年级指定班级的该学科的全部课程信息
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @param subNo   学科编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByClassNoAndSubNo(String classNo, String year, String subNo);

    /**
     * 年级组长查询课表前查询所在年级的全部班级信息
     *
     * @param teacher 年级组长
     * @return 返回查询出的全部班级信息
     */
    List<Class> preListTableByGradeLeader(Teacher teacher);

    /**
     * 年级组长查询该学年所在年级指定班级的全部课程信息
     * 领导根据学年查询指定班级的课表的操作
     *
     * @param classNo 班级号
     * @param year    学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByClassNo(String classNo, String year);

    /**
     * 领导根据学年查询指定教师的课表的操作
     *
     * @param teacherNo 教师编号
     * @param year      学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByTeacherNo(String teacherNo, String year);

    /**
     * 领导根据学年查询指定教室的全部课表信息
     *
     * @param room 教室信息
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByRoom(Room room);

    /**
     * 教务员查询当前学年(包含已发布，未发布，待审核，未通过审核)的全部课表信息
     *
     * @param year 学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> list(String year);

    /**
     * 教务员查看指定学年的已发布(status = 0)，未发布(status = 1)，待审核(status = 2)，未通过审核(status = 3)的全部课表信息
     * 教务主任查看指定学年的已发布(status = 0)，待审核(status = 2)，未通过审核(status = 3)的全部课表信息
     *
     * @param year   学年编号
     * @param status 发布状态编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByStatus(String year, String status);

    /**
     * 教务主任当前学年某年级的已发布(status = 0)，待审核(status = 2)，未通过审核(status = 3)的全部课表信息
     * 教务员查询当前学年的指定年级的全部已发布(status = 0)，未发布(status = 1)，待审核(status = 2)，未通过审核(status = 3)课表信息
     *
     * @param gno    班级号
     * @param year   学年号
     * @param status 发布状态号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByGnoAndStatus(String gno, String year, String status);

    /**
     * 教务员查询当前学年，指定上课时间，教室的课程信息
     *
     * @param room 教室信息
     * @param time 上课时间
     * @return 以List集合的形式返回全部查询出的数据
     */
    Timetable showByRoomAndTime(Room room, Short time);
}
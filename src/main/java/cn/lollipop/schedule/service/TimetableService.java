package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Timetable;

import java.util.List;

public interface TimetableService {

    /**
     * 交换两节课前的查询操作
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @param time    上课时间
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> preExchange(String classNo, String year, Short time);

    /**
     * 为指定学年指定班级制定课表
     *
     * @param year    学年编号
     * @param classNo 班级编号
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> make(String year, String classNo);

    /**
     * 查询指定学年指定班级的课表
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> listByClassNoAndYear(String classNo, String year);

    /**
     * 批量修改指定学年指定年级的全部课表发布状态的操作
     *
     * @param year       学年编号
     * @param enrollYear 注册学年
     * @param status     要修改的状态编号
     * @return true
     */
    boolean changeStatus(String year, String enrollYear, String status);

    /**
     * 查询指定学年指定班级指定发布状态的课表
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @param status  发布状态
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> listByClassNoAndYearAndStatus(String classNo, String year, String status);

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
     * 学科组长查询该学年所在年级指定班级的该学科的全部课程信息
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @param subNo   学科编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByClassNoAndSubNo(String classNo, String year, String subNo);

    /**
     * 领导根据学年查询指定教师的课表的操作
     *
     * @param teacherNo 教师编号
     * @param year      学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> listByTeacherNo(String teacherNo, String year);

    /**
     * 教务员查询当前学年(包含已发布，未发布，待审核，未通过审核)的全部课表信息
     *
     * @param year 学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Timetable> list(String year);

    /**
     * 查询指定学年指定班级指定上课时间的课程信息
     *
     * @param year    学年编号
     * @param classNo 班级编号
     * @param time    上课时间
     * @return 返回课程信息
     */
    Timetable showByYearAndClassNoAndTime(String year, String classNo, Short time);

    /**
     * 交换两节课的上课时间
     *
     * @param a 课程a
     * @param b 课程b
     */
    boolean exchangeTowTimetables(Timetable a, Timetable b);
}

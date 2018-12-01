package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Class;

import java.util.List;

public interface ClassService {
    /**
     * 根据年级号和学年编号查询出该年级的全部班级信息
     *
     * @param gradeNo 年级号
     * @param year    学年编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByGradeNoAndYear(String gradeNo, String year);

    /**
     * 年级主任查询所在年级全部班级的操作
     *
     * @param teacherNo 年级主任编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByGradeTeacher(String teacherNo);

    /**
     * 查询指定届全部班级信息
     *
     * @param enrollYear 年级编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByEnrollYear(String enrollYear);

    /**
     * 查询指定班级的具体信息
     *
     * @param classNo 班级编号
     * @return 返回班级对象
     */
    Class show(String classNo);
}

package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Class;

import java.util.List;

public interface ClassService {
    /**
     * 根据年级号查询出该年级的全部班级信息
     *
     * @param gno 年级号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByGno(String gno);

    /**
     * 年级主任查询所在年级全部班级的操作
     *
     * @param teacherNo 年级主任编号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByGradeTeacher(String teacherNo);
}

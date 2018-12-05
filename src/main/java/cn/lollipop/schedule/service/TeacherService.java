package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Teacher;

import java.util.List;

public interface TeacherService {
    /**
     * 根据教师编号查询教师信息的操作
     *
     * @param teacherNo 教师编号
     * @return 返回教师信息
     */
    Teacher show(String teacherNo);


    /**
     * 根据年级号和学科编号查询出该年级该学科的全部教师信息
     * 用于领导查询教师课表前查询教师的操作
     *
     * @param gno   年级号
     * @param subNo 学科编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teacher> listByGnoAndSubNo(String gno, String subNo);
}

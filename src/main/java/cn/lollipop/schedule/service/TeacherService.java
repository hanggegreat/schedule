package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Teacher;

import java.util.List;

public interface TeacherService {
    /**
     * 根据年级查询出该年级的全部教师信息
     * 用于领导查询教师课表前查询教师的操作
     *
     * @param gno 年级号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teacher> listByGno(String gno);

    /**
     * 根据学科编号查询出该学科的全部教师信息
     * 用于领导查询教师课表前查询教师的操作
     *
     * @param subNo 学科编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teacher> listBySubNo(String subNo);

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

package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teach;

import java.util.List;

public interface TeachService {
    /**
     * 查询指定培养方案对应的全部任教信息
     *
     * @param program 培养方案
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teach> listByProgram(Program program);

    /**
     * 查询当前学年指定教师的全部任教信息
     *
     * @param teacherNo 教师编号
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teach> listByTeacherNo(String teacherNo, String year);
}

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
     * @param year      学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teach> listByTeacherNo(String teacherNo, String year);

    /**
     * 学科组长分配单个任课信息
     *
     * @param teach 任课信息
     * @return 返回插入成功后的任课信息
     */
    Teach insert(Teach teach);

    /**
     * 学科组长批量分配任课信息
     *
     * @param teaches 任课信息
     * @return 返回插入成功后的任课信息
     */
    List<Teach> insertInBatch(List<Teach> teaches);

    /**
     * 学科组长修改单个任课信息
     *
     * @param teach 任课信息
     * @return teach
     */
    Teach update(Teach teach);

    /**
     * 学科组长修改分配任课信息
     *
     * @param teaches 任课信息
     * @return teaches
     */
    List<Teach> updateInBatch(List<Teach> teaches);
}

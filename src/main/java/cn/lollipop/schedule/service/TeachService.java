package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.domain.Teacher;

import java.util.List;

public interface TeachService {
    /**
     * 学科组长根据年级编号，学年编号，以及自己的学科编号查询全部任教信息
     *
     * @param gradeNo 年级号
     * @param subNo   学科编号
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Teach> subjectLeaderList(String gradeNo, String subNo, String year);

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
     * 查看单个任教信息，用于更新前的查询操作
     *
     * @param id 任教Id
     * @return 返回任教对象
     */
    Teach show(Long id);

    /**
     * 学科组长分配单个任教信息
     *
     * @param teach 任教信息
     * @return 返回插入成功后的任教信息
     */
    Teach insert(Teach teach);

    /**
     * 学科组长修改单个任教信息
     *
     * @param teach 任教信息
     * @return teach
     */
    Teach update(Teach teach);

    /**
     * 删除指定任教信息
     *
     * @param id 任教id
     * @return true
     */
    boolean remove(Long id);
}

package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teacher;

import java.util.List;
import java.util.Set;

public interface ProgramService {

    /**
     * 学生查询自己的培养方案信息
     *
     * @param sno 学生编号
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listStudentProgram(String sno);

    /**
     * 班主任查询所在班级的培养方案信息
     *
     * @param teacherNo 班主任编号
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listByClassTeacher(String teacherNo);

    /**
     * 教务员查询当前学年指定年级的培养方案信息
     *
     * @param gno 年级号
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listByGno(String gno);

    /**
     * 教务员根据注册年份查询该届学生的全部培养方案信息
     *
     * @param enrollYear 注册年份
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listByGrade(String enrollYear);

    /**
     * 根据发布状态查询指定届全部培养方案
     * @param status 发布状态
     * @param enrollYear 注册年份
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listByStatusAndEnrollYear(String status, String enrollYear);

    /**
     * 教务员制定培养方案
     *
     * @param program 培养方案
     * @return 返回插入后的新数据
     */
    Program insert(Program program);

    /**
     * 教务员制定培养方案
     *
     * @param programs 培养方案
     * @return 以List集合的形式返回插入后的新数据
     */
    List<Program> insertInBatch(List<Program> programs);

    /**
     * 教务员批量修改培养方案
     *
     * @param programs 培养方案
     * @return 返回原集合数据
     */
    List<Program> updateInBatch(List<Program> programs);

    /**
     * 教务员修改培养方案信息
     *
     * @param program 培养方案
     * @return program
     */
    Program update(Program program);

    /**
     * 批量删除培养方案信息
     *
     * @param programs 要删除的培养方案
     */
    void removeInBatch(List<Program> programs);

    /**
     * 驳回培养方案
     *
     * @param programs 培养方案
     * @return 返回驳回后的培养方案信息
     */
    Program refuse(Program programs);

    /**
     * 批量驳回培养方案
     *
     * @param programs 培养方案
     * @return 返回驳回后的培养方案信息
     */
    List<Program> refuseInBatch(List<Program> programs);

    /**
     * 通过培养方案
     *
     * @param programs 培养方案
     * @return 返回通过审核后的培养方案信息
     */
    Program pass(Program programs);

    /**
     * 批量通过培养方案
     *
     * @param programs 培养方案
     * @return 返回通过审核后的培养方案信息
     */
    List<Program> passInBatch(List<Program> programs);
}

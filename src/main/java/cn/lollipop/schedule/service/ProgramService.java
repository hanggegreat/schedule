package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Program;

import java.util.List;

public interface ProgramService {
    /**
     * 教务员，教学主任，校长，班主任等查询指定班级的培养方案信息
     *
     * @param classNo 班级编号
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listByClassNo(String classNo);

    /**
     * 学生查询自己的培养方案信息
     * @param sno 学生编号
     * @return 以List集合的形式返回全部的数据
     */
    List<Program> listStudentProgram(String sno);
}

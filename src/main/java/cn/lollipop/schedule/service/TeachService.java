package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teach;

import java.util.List;

public interface TeachService {
    /**
     * 学科组长根据培养方案查询出该培养方案的全部任课信息，用于分配教师时
     * @param program
     * @return
     */
    List<Teach> listByProgram(Program program);
}

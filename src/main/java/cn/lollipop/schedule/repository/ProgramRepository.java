package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProgramRepository extends JpaRepository<Program, String> {

    /**
     * 根据注册学年以及发布状态查询该届学生的全部培养方案信息
     *
     * @param grade  年级
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Program> findAllByGradeAndStatus(Grade grade, String status);


    /**
     * 根据年级号以及发布状态查询出该年级学生的全部培养方案信息
     *
     * @param gradeNo 年级号
     * @param year    学年编号
     * @param status  发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Program> findAllByGradeNoAndYearAndStatus(String gradeNo, String year, String status);
}

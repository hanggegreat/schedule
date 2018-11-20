package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProgramRepository extends JpaRepository<Program, String> {

//    /**
//     * 根据编号和发布状态查询出全部的培养方案信息
//     *
//     * @param id     编号
//     * @param status 发布状态
//     * @return 以List集合的形式返回查询出的全部数据
//     */
//    List<Program> findAllByIdAndStatus(String id, String status);
//
//    /**
//     * 根据学年以及发布状态查询全部的培养方案信息
//     *
//     * @param year   学年号
//     * @param status 发布状态
//     * @return 以List集合的形式返回查询出的全部数据
//     */
//    List<Program> findAllByYearAndStatus(String year, String status);
//
//    /**
//     * 根据名称和发布状态查询培养方案信息
//     *
//     * @param name   培养方案名称
//     * @param status 发布状态
//     * @return 以对象的形式返回全部数据
//     */
//    Program findByNameAndStatus(String name, String status);
//
    /**
     * 根据注册学年以及发布状态查询该届学生的全部培养方案信息
     *
     * @param grade  年级
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Program> findAllByGradeAndStatus(Grade grade, String status);
//
//    /**
//     * 根据年级号以及发布状态查询出该年级学生的全部培养方案信息
//     *
//     * @param gradeNo 年级号
//     * @param status  发布状态
//     * @return 以List集合的形式返回查询出的全部数据
//     */
//    List<Program> findAllByGradeNoAndStatus(String gradeNo, String status);
//
//    /**
//     * 根据学科以及发布状态查询出该学科的全部培养方案信息
//     *
//     * @param subject 学科
//     * @param status  发布状态
//     * @return 以List集合的形式返回查询出的全部数据
//     */
//    List<Program> findAllBySubjectAndStatus(Subject subject, String status);
}

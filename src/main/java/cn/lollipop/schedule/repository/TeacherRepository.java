package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, String> {
    /**
     * 根据年级查询出该年级的全部教师
     *
     * @param teacherGrade 年级号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Teacher> findAllByTeacherGrade(String teacherGrade);

    /**
     * 根据学科查询出所有该学科的教师
     *
     * @param subject 学科
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Teacher> findAllBySubject(Subject subject);

    /**
     * 根据教师所在年级和学科查询出全部教师信息
     *
     * @param teacherGrade 年级号
     * @param subject      学科
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Teacher> findAllByTeacherGradeAndSubject(String teacherGrade, Subject subject);

    /**
     * 根据教师编号查询出该教师的全部信息
     *
     * @param teacherNo 教师编号
     * @return 返回教师信息
     */
    Teacher findByTeacherNo(String teacherNo);
}
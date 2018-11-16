package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TeacherRepository extends JpaRepository<Teacher, String> {
    /**
     * 根据年级和教师状态查询出所有符合的教师
     * @param teacherGrade 年级
     * @param state 状态
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Teacher> findAllByTeacherGradeAndState(String teacherGrade, State state);

    /**
     * 根据学科和教师状态查询出所有符合的教师
     * @param subject 学科
     * @param state 状态
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Teacher> findAllBySubjectAndState(Subject subject, State state);

    /**
     * 根据学科编号和年级号查询出该年级该学科的学科组长编号
     * @param subNo 学科编号
     * @param gradeNo 年级编号
     * @return 返回年级组长编号
     */
    @Query(nativeQuery = true, value = "SELECT TeacherNo, TeacherName, TeacherSex, TeacherGrade, TeacherState, teacherSub, TeacherKey FROM js0_teacher WHERE TeacherNo = (SELECT teacherNo FROM `js3.1_xue_ke_zu_zhang` WHERE SubNo = ?1 AND GradeNo=?2)")
    Teacher findSubjectLeaderNo(String subNo, String gradeNo);

    /**
     * 根据教师编号和密码查询出该教师的全部信息
     * @param teacherNo 教师编号
     * @param teacherKey 登录密码
     * @return 返回教师信息
     */
    Teacher findByTeacherNoAndTeacherKey(String teacherNo, String teacherKey);
}
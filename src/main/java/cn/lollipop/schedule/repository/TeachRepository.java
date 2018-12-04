package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TeachRepository extends JpaRepository<Teach, Long> {
    /**
     * 根据培养方案查询全部属于该培养方案的任课信息
     *
     * @param program 培养方案
     * @return 以List集合的形式返回全部的任课信息
     */
    List<Teach> findAllByProgram(Program program);

    /**
     * 根据班级编号和学年查询该班级的全部任课信息
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @return 以List集合的形式返回全部的查询结果
     */
    @Query(nativeQuery = true, value = "SELECT id, teachNo, teacherNo, classNo, programId FROM pke_teach WHERE classNo = ?1 AND teachNo LIKE CONCAT(?2, '%')")
    List<Teach> findAllByClassNoAndYear(String classNo, String year);

    /**
     * 根据教师编号和学年查询该班级的全部任课信息
     *
     * @param teacherNo 教师编号
     * @param year      学年编号
     * @return 以List集合的形式返回全部的查询结果
     */
    @Query(nativeQuery = true, value = "SELECT id, teachNo, teacherNo, classNo, programId FROM pke_teach WHERE teacherNo = ?1 AND teachNo LIKE CONCAT(?2, '%')")
    List<Teach> findAllByTeacherNoAndYear(String teacherNo, String year);

    /**
     * 根据学科编号，年级号，学年编号查询出全部的任教信息
     *
     * @param subNo   学科编号
     * @param gradeNo 年级号
     * @param year    学年编号
     * @return 以List集合的形式返回全部的查询结果
     */
    @Query(nativeQuery = true, value = "SELECT id, teachNo, teacherNo, classNo, programId FROM pke_teach WHERE teachNo LIKE CONCAT(?3, ?2, ?1, '%')")
    List<Teach> findAllBySubNoAndGradeNoAndYear(String subNo, String gradeNo, String year);
}

package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Class;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface ClassRepository extends JpaRepository<Class, String> {
    /**
     * 查询班主任所带的班级信息
     *
     * @param teacherNo 班主任编号
     * @return 返回班级对象
     */
    @Query(nativeQuery = true, value = "SELECT ClassNo, ClassName, GradeNo, TeacherNo FROM XJ_Class WHERE TeacherNo = ?1 AND ClassNo LIKE CONCAT((?2 + 1 - GradeNo), '%')")
    Class findByTeacherNoAndYear(String teacherNo, String year);

    /**
     * 根据年级号查询出该年级的全部班级信息
     *
     * @param gradeNo 年级号
     * @return 以List集合的形式返回全部数据
     */
    @Query(nativeQuery = true, value = "SELECT ClassNo, ClassName, GradeNo, TeacherNo FROM XJ_Class WHERE TeacherNo = ?1 AND ClassNo LIKE CONCAT((?2 + 1 - GradeNo), '%')")
    List<Class> findAllByGradeNo(String gradeNo);
}
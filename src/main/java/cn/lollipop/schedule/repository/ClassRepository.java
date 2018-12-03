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
    @Query(nativeQuery = true, value = "SELECT ClassNo, ClassName, ClassNum, GradeNo, TeacherNo FROM XJ_Class WHERE TeacherNo = ?1 AND ClassNo LIKE CONCAT((?2 + 1 - GradeNo), '%')")
    Class findByTeacherNoAndYear(String teacherNo, String year);

    /**
     * 根据年级号和学年查询出该年级的全部班级信息
     *
     * @param gradeNo 年级号
     * @param year    学年编号
     * @return 以List集合的形式返回全部数据
     */
    @Query(nativeQuery = true, value = "SELECT ClassNo, ClassName, ClassNum, GradeNo, TeacherNo FROM XJ_Class WHERE ClassNo LIKE CONCAT((?2 + 7 - ?1), '%')")
    List<Class> findAllByGradeNoAndYear(String gradeNo, String year);

    /**
     * 根据注册年份查询全部班级信息
     *
     * @param enrollYear 注册年份
     * @return 以List集合的形式返回全部数据
     */
    @Query(nativeQuery = true, value = "SELECT ClassNo, ClassName, ClassNum, GradeNo, TeacherNo FROM XJ_Class WHERE ClassNo LIKE CONCAT(?1, '%')")
    List<Class> findAllByEnrollYear(String enrollYear);
}
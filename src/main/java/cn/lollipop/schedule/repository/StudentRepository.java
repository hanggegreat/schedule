package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Status;
import cn.lollipop.schedule.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, String> {
    /**
     * 根据学号以及密码查询出该学生信息
     *
     * @param sno      学号
     * @param password 密码
     * @return 查询成功返回Student对象，否则返回null
     */
    Student findBySnoAndPassword(String sno, String password);

    /**
     * 根据班级查询出该班级的全部学生
     *
     * @param stuClass 班级
     * @return 以List集合的形式返回查询出的全部学生数据
     */
    List<Student> findAllByStuClass(Class stuClass);

    /**
     * 根据班级以及状态查询出该班级的全部学生
     *
     * @param stuClass 班级
     * @param status 状态
     * @return 以List集合的形式返回查询出的全部学生数据
     */
    List<Student> findAllByStuClassAndStatus(Class stuClass, Status status);
}

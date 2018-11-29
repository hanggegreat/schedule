package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;


public interface StudentRepository extends JpaRepository<Student, String> {
    /**
     * 根据学号查询出该学生信息
     *
     * @param sno 学号
     * @return 查询成功返回Student对象，否则返回null
     */
    Student findBySno(String sno);
}

package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, String> {
}

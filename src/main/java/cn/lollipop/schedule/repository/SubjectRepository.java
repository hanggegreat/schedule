package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubjectRepository extends JpaRepository<Subject, String> {
}

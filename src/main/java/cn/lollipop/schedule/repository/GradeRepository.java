package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GradeRepository extends JpaRepository<Grade, String> {
}
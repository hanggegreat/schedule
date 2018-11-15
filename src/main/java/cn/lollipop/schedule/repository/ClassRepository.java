package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Class;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClassRepository extends JpaRepository<Class, String> {
}
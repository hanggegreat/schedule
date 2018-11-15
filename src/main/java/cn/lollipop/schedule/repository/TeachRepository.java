package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Teach;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeachRepository extends JpaRepository<Teach, String> {
}

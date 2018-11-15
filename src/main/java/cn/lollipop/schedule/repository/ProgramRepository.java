package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Program;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProgramRepository extends JpaRepository<Program, String> {
}

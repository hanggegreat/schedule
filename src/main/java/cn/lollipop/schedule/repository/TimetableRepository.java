package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TimetableRepository extends JpaRepository<Timetable, String> {
}

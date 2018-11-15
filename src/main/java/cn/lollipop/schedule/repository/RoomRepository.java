package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, String> {
}

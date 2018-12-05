package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.repository.RoomRepository;
import cn.lollipop.schedule.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {
    private final RoomRepository roomRepository;

    @Autowired
    public RoomServiceImpl(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @Override
    public List<Room> list() {
        return this.roomRepository.findAllByRoomStateNo("0");
    }
}

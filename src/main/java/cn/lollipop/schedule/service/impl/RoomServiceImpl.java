package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Block;
import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.RoomFunction;
import cn.lollipop.schedule.repository.BlockRepository;
import cn.lollipop.schedule.repository.RoomFunctionRepository;
import cn.lollipop.schedule.repository.RoomRepository;
import cn.lollipop.schedule.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {
    private final RoomRepository roomRepository;
    private final RoomFunctionRepository roomFunctionRepository;
    private final BlockRepository blockRepository;

    @Autowired
    public RoomServiceImpl(RoomRepository roomRepository, RoomFunctionRepository roomFunctionRepository, BlockRepository blockRepository) {
        this.roomRepository = roomRepository;
        this.roomFunctionRepository = roomFunctionRepository;
        this.blockRepository = blockRepository;
    }

    @Override
    public List<Room> list() {
        return this.roomRepository.findAllByRoomStateNo("0");
    }

    @Override
    public List<Room> listByRoomFunctionNo(String roomFunctionNo) {
        RoomFunction roomFunction = this.roomFunctionRepository.getOne(roomFunctionNo);
        return this.roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
    }

    @Override
    public List<Room> listByCapacityGreaterThanEqual(Short capacity) {
        return this.roomRepository.findAllByRoomCapacityGreaterThanEqualAndRoomStateNo(capacity, "0");
    }

    @Override
    public List<Room> listByBlockNo(String blockNo) {
        Block block = this.blockRepository.getOne(blockNo);
        return this.roomRepository.findAllByBlockAndRoomStateNo(block, "0");
    }

    @Override
    public List<Room> listByBlockNoAndCapacityGreaterThanEqual(String blockNo, Short capacity) {
        Block block = this.blockRepository.getOne(blockNo);
        return this.roomRepository.findAllByBlockAndRoomCapacityGreaterThanEqualAndRoomStateNo(block, capacity, "0");
    }

    @Override
    public List<Room> listByBlockNoAndRoomFunctionNo(String blockNo, String roomFunctionNo) {
        Block block = this.blockRepository.getOne(blockNo);
        RoomFunction roomFunction = this.roomFunctionRepository.getOne(roomFunctionNo);
        return this.roomRepository.findAllByBlockAndRoomFunctionAndRoomStateNo(block, roomFunction, "0");
    }

    @Override
    public List<Room> listByBlockNoAndCapacityGreaterThanEqualAndRoomFunctionNo(String blockNo, Short capacity, String roomFunctionNo) {
        Block block = this.blockRepository.getOne(blockNo);
        RoomFunction roomFunction = this.roomFunctionRepository.getOne(roomFunctionNo);
        return this.roomRepository.findAllByBlockAndRoomCapacityGreaterThanEqualAndRoomFunctionAndRoomStateNo(block, capacity, roomFunction, "0");
    }
}

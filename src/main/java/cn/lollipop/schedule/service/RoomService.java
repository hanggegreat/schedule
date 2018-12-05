package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Room;

import java.util.List;

public interface RoomService {
    /**
     * 查询出全部的空教室
     *
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> list();
}

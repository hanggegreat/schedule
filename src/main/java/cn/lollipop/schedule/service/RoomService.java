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

    /**
     * 根据教室功能查询出全部空教室信息
     *
     * @param roomFunctionNo 教室编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByRoomFunctionNo(String roomFunctionNo);

    /**
     * 查询出全部指定最小容量的空教室
     *
     * @param capacity 最小容量
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByCapacityGreaterThanEqual(Short capacity);

    /**
     * 根据教学楼编号查询出该栋楼的全部空教室
     *
     * @param blockNo 教学楼编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByBlockNo(String blockNo);

    /**
     * 根据教学楼编号，最小容量查询出该栋楼的全部空教室
     *
     * @param blockNo  教学楼编号
     * @param capacity 最小容量
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByBlockNoAndCapacityGreaterThanEqual(String blockNo, Short capacity);

    /**
     * 根据教学楼编号，房间功能查询出该栋楼的全部空教室
     *
     * @param blockNo        教学楼编号
     * @param roomFunctionNo 房间功能编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByBlockNoAndRoomFunctionNo(String blockNo, String roomFunctionNo);

    /**
     * 根据教学楼编号，最小容量，房间功能查询出该栋楼的全部空教室
     *
     * @param blockNo        教学楼编号
     * @param capacity       最小容量
     * @param roomFunctionNo 房间功能编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Room> listByBlockNoAndCapacityGreaterThanEqualAndRoomFunctionNo(String blockNo, Short capacity, String roomFunctionNo);
}

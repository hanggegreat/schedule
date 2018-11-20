package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Block;
import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.RoomFunction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoomRepository extends JpaRepository<Room, String> {
    /**
     * 根据教室状态查询出全部的教室信息
     *
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByRoomStateNo(String roomStateNo);

    /**
     * 根据教室状态及最小容量查询出全部教室信息
     *
     * @param capacity    最小容量
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByRoomCapacityGreaterThanEqualAndRoomStateNo(Short capacity, String roomStateNo);

    /**
     * 根据教室功能以及教室状态查询出全部教室信息
     *
     * @param roomFunction 教室功能
     * @param roomStateNo  教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByRoomFunctionAndRoomStateNo(RoomFunction roomFunction, String roomStateNo);

    /**
     * 根据教室所在楼以及教室状态查询出全部教室信息
     *
     * @param block       教室所在楼
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByBlockAndRoomStateNo(Block block, String roomStateNo);


    /**
     * 根据教室所在楼，最小容量以及教室状态查询出全部教室信息
     *
     * @param block       教室所在楼
     * @param capacity    最小容量
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByBlockAndRoomCapacityGreaterThanEqualAndRoomStateNo(Block block, Short capacity, String roomStateNo);

    /**
     * 根据教室所在楼，房间功能以及教室状态查询出全部教室信息
     *
     * @param block       教室所在楼
     * @param roomFunction    房间功能
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByBlockAndRoomFunctionAndRoomStateNo(Block block, RoomFunction roomFunction, String roomStateNo);

    /**
     * 根据教室所在楼，最小容量，房间功能以及教室状态查询出全部教室信息
     *
     * @param block       教室所在楼
     * @param capacity    最小容量
     * @param roomFunction    房间功能
     * @param roomStateNo 教室状态编号
     * @return 以List集合的形式返回全部查询出的教室数据
     */
    List<Room> findAllByBlockAndRoomCapacityGreaterThanEqualAndRoomFunctionAndRoomStateNo(Block block, Short capacity,RoomFunction roomFunction, String roomStateNo);
}
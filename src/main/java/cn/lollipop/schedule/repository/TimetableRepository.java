package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.domain.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TimetableRepository extends JpaRepository<Timetable, String> {
    /**
     * 根据发布状态查询全部的课程信息
     *
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Timetable> findAllByStatus(String status);

    /**
     * 根据任课信息和发布状态查询其对应的全部课程信息
     *
     * @param teach  任课信息
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Timetable> findAllByTeachAndStatus(Teach teach, String status);

    /**
     * 查询指定发布状态和上课时间的教室的课程信息
     *
     * @param room   教室
     * @param time   上课时间
     * @param status 发布状态
     * @return 返回Timetable对象
     */
    Timetable findByRoomAndTimeAndStatus(Room room, Short time, String status);

    /**
     * 查询指定发布状态的教室的全部课程信息
     *
     * @param room   教室
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Timetable> findAllByRoomAndStatus(Room room, String status);

    /**
     * 根据班级编号和发布状态查询全部的课程信息
     *
     * @param classNo 班级编号
     * @param status  发布状态
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT('___________', ?1, '%', '____', ?3) AND status = ?2")
    List<Timetable> findAllByClassNoAndStatusAndYear(String classNo, String status, String year);

    /**
     * 根据教师编号和学年号以及发布状态查询全部的课程信息
     *
     * @param teacherNo 教师编号
     * @param year      学年号
     * @param status    发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?2, '___', ?1, '%') AND status = ?3")
    List<Timetable> findAllByTeacherNoAndYearAndStatus(String teacherNo, String year, String status);
}

package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TimetableRepository extends JpaRepository<Timetable, Long> {

    /**
     * 查询指定时间指定教室的全部任课信息
     *
     * @param room 房间
     * @param time 时间
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Timetable> findAllByRoomAndTime(Room room, Short time);

    /**
     * 查询指定学年指定班级的课表信息
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?2, '_______', ?1, '%')")
    List<Timetable> findAllByClassNoAndYear(String classNo, String year);


    /**
     * 根据班级编号和发布状态查询全部的课表信息
     *
     * @param classNo 班级编号
     * @param status  发布状态
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?3, '_______', ?1, '%') AND status = ?2")
    List<Timetable> findAllByClassNoAndStatusAndYear(String classNo, String status, String year);

    /**
     * 查询指定学年指定时间指定教师的课程信息
     *
     * @param year      学年编号
     * @param time      上课时间
     * @param teacherNo 教师编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE teachNo LIKE CONCAT(?1, '%') AND time = ?2 AND SUBSTR(teachNo, 8, 4) = ?3")
    Timetable findByYearAndTimeAndTeacherNo(String year, Short time, String teacherNo);

    /**
     * 根据教师编号和学年编号以及发布状态查询全部的课表信息
     *
     * @param teacherNo 教师编号
     * @param year      学年编号
     * @param status    发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?2, '___', ?1, '%') AND status = ?3")
    List<Timetable> findAllByTeacherNoAndYearAndStatus(String teacherNo, String year, String status);

    /**
     * 根据班级编号，学年编号，学科编号，发布状态查询出全部的课表信息
     *
     * @param classNo 班级编号
     * @param year    学年编号
     * @param subNo   学科编号
     * @param status  发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?2, '_', ?3, '____', ?1, '%') AND status = ?4")
    List<Timetable> findAllByClassNoAndYearAndSubNoAndStatus(String classNo, String year, String subNo, String status);

    /**
     * 查询指定教室的指定发布状态的全部课表信息
     *
     * @param room   教室
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Timetable> findAllByRoomAndStatus(Room room, String status);

    /**
     * 查询指定学年的全部课程信息
     *
     * @param year 学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?1, '%')")
    List<Timetable> findAllByYear(String year);

    /**
     * 根据发布状态查询指定学年的全部课程信息
     *
     * @param status 发布状态
     * @param year   学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE status = ?1 AND timetableNo LIKE CONCAT(?2, '%')")
    List<Timetable> findAllByStatusAndYear(String status, String year);

    /**
     * 根据发布状态查询指定年级，学年的全部课程信息
     *
     * @param gno    年级号
     * @param year   学年编号
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    @Query(nativeQuery = true, value = "SELECT id, timetableNo, status, `time`, teachNo, roomNo FROM pke_timetable WHERE timetableNo LIKE CONCAT(?2, ?1, '%') AND status = ?3")
    List<Timetable> findAllByGnoAndYearAndStatus(String gno, String year, String status);

    /**
     * 根据发布状态查询指定上课时间，教室的课程信息
     *
     * @param room   教室
     * @param time   上课时间
     * @param status 发布状态
     * @return 返回Timetable对象
     */
    Timetable findByRoomAndTimeAndStatus(Room room, Short time, String status);
}

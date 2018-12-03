package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.*;
import cn.lollipop.schedule.repository.*;
import cn.lollipop.schedule.service.TimetableService;
import cn.lollipop.schedule.util.NumToString;
import cn.lollipop.schedule.util.RandomUtil;
import cn.lollipop.schedule.util.YearUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TimetableServiceImpl implements TimetableService {
    private final TimetableRepository timetableRepository;
    private final StudentRepository studentRepository;
    private final ClassRepository classRepository;
    private final TeachRepository teachRepository;
    private final RoomRepository roomRepository;

    @Autowired
    public TimetableServiceImpl(TimetableRepository timetableRepository, StudentRepository studentRepository, ClassRepository classRepository, TeachRepository teachRepository, RoomRepository roomRepository) {
        this.timetableRepository = timetableRepository;
        this.studentRepository = studentRepository;
        this.classRepository = classRepository;
        this.teachRepository = teachRepository;
        this.roomRepository = roomRepository;
    }

    @Override
    public List<Timetable> make(String year, String classNo) {
        List<Timetable> result = new ArrayList<>(40);
        List<Teach> teaches = teachRepository.findAllByClassNoAndYear(classNo, year);
        RoomFunction roomFunction = new RoomFunction();
        roomFunction.setRoomFunctionNo("01"); //普通教室
        List<Room> commonRooms = roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
        roomFunction.setRoomFunctionNo("03"); //音乐教室
        List<Room> musicRooms = roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
        roomFunction.setRoomFunctionNo("04"); //美术教室
        List<Room> artRooms = roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
        roomFunction.setRoomFunctionNo("05"); //机房
        List<Room> computerRooms = roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
        roomFunction.setRoomFunctionNo("06"); //体育馆
        List<Room> peRooms = roomRepository.findAllByRoomFunctionAndRoomStateNo(roomFunction, "0");
        RandomUtil randomUtil = new RandomUtil(40);

        for (Teach teach : teaches) {
            short amount = teach.getProgram().getAmount(); //课时
            String subNo = teach.getTeachNo().substring(5, 7); //学科编号
            if ("10".equals(subNo)) {// 体育
                while (amount-- > 0) {
                    makePeRoom(peRooms, randomUtil, teach, result);
                }
            } else if ("11".equals(subNo)) {// 艺术
                ArrayList<Room> rooms = new ArrayList<>(musicRooms);
                rooms.addAll(artRooms);
                while (amount-- > 0) {
                    make(rooms, randomUtil, teach, result);
                }
            } else if ("12".equals(subNo)) {// 信息科技
                while (amount-- > 0) {
                    make(computerRooms, randomUtil, teach, result);
                }
            } else { // 语文、数学、英语、物理、化学、生物、历史、政治、地理
                while (amount-- > 0) {
                    make(commonRooms, randomUtil, teach, result);
                }
            }
        }
        return timetableRepository.saveAll(result);
    }

    @Override
    public List<Timetable> listByClassNoAndYear(String classNo, String year) {
        return timetableRepository.findAllByClassNoAndYear(classNo, year);
    }

    @Override
    public List<Timetable> listByClassNoAndYearAndStatus(String classNo, String year, String status) {
        return timetableRepository.findAllByClassNoAndStatusAndYear(classNo, status, year);
    }

    @Override
    public List<Timetable> listStudentTable(String sno, String year) {
        Student student = this.studentRepository.getOne(sno);
        String classNo = student.getStuClass().getClassNo();
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, "1", year);
    }

    @Override
    public List<Timetable> listTeacherTable(String teacherNo, String year) {
        return this.timetableRepository.findAllByTeacherNoAndYearAndStatus(teacherNo, year, "1");
    }

    @Override
    public List<Timetable> listByClassTeacher(Teacher teacher, String year) {
        Class myClass = this.classRepository.findByTeacherNoAndYear(teacher.getTeacherNo(), year);
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(myClass.getClassNo(), "1", year);
    }

    @Override
    public List<Timetable> listByClassNoAndSubNo(String classNo, String year, String subNo) {
        return this.timetableRepository.findAllByClassNoAndYearAndSubNoAndStatus(classNo, year, subNo, "1");
    }

    @Override
    public List<Timetable> listByClassNo(String classNo, String year) {
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, "1", year);
    }

    @Override
    public List<Timetable> listByTeacherNo(String teacherNo, String year) {
        return this.timetableRepository.findAllByTeacherNoAndYearAndStatus(teacherNo, year, "1");
    }

    @Override
    public List<Timetable> listByClassNoAndStatus(String classNo, String status) {
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, status, YearUtil.getCurrentYear());
    }

    @Override
    public List<Timetable> listByRoom(Room room) {
        return this.timetableRepository.findAllByRoomAndStatus(room, "1");
    }

    @Override
    public List<Timetable> list(String year) {
        return this.timetableRepository.findAllByYear(year);
    }

    @Override
    public List<Timetable> listByStatus(String year, String status) {
        return this.timetableRepository.findAllByStatusAndYear(status, year);
    }

    @Override
    public List<Timetable> listByGnoAndStatus(String gno, String year, String status) {
        return this.timetableRepository.findAllByGnoAndYearAndStatus(gno, year, status);
    }

    @Override
    public Timetable showByRoomAndTime(Room room, Short time) {
        return this.timetableRepository.findByRoomAndTimeAndStatus(room, time, "1");
    }

    @Override
    public void exchangeTowTimetables(Timetable a, Timetable b) {
        Short timeA = a.getTime();
        a.setTime(b.getTime());
        b.setTime(timeA);
        this.timetableRepository.save(a);
        this.timetableRepository.save(b);
    }

    @Override
    public List<Timetable> passInBatch(List<Timetable> timetables) {
        for (Timetable timetable : timetables) {
            timetable.setStatus("1");
        }
        return this.timetableRepository.saveAll(timetables);
    }

    @Override
    public List<Timetable> refuseInBatch(List<Timetable> timetables) {
        for (Timetable timetable : timetables) {
            timetable.setStatus("3");
        }
        return this.timetableRepository.saveAll(timetables);
    }

    private void makePeRoom(List<Room> peRooms, RandomUtil randomUtil, Teach teach, List<Timetable> result) {
        //随机取一个体育馆
        Room peRoom = peRooms.get((int) (peRooms.size() * Math.random()));
        //随机取得一个上课时间
        short time = (short) (randomUtil.getRandomInt() + 1);
        //查询出该时间该任课老师的课程信息
        Timetable temp = timetableRepository.findByYearAndTimeAndTeacherNo(teach.getTeachNo().substring(0, 4), time, teach.getTeachNo().substring(7, 11));
        //查询出该时间该体育馆的全部课程信息
        List<Timetable> timetables = timetableRepository.findAllByRoomAndTime(peRoom, time);

        //保存当前体育馆人数
        int current = 0;
        for (Timetable timetable : timetables) {
            current += Integer.parseInt(timetable.getTeach().gettClass().getClassNum());
        }

        if (temp == null && current + Integer.parseInt(teach.gettClass().getClassNum()) <= peRoom.getRoomCapacity()) {
            String timetableNo = teach.getTeachNo() + peRoom.getRoomNo() + NumToString.convert(time);
            Timetable timetable = new Timetable();
            timetable.setStatus("0");
            timetable.setTime(time);
            timetable.setRoom(peRoom);
            timetable.setTeach(teach);
            timetable.setTimetableNo(timetableNo);
            result.add(timetable);
            randomUtil.remove();
        } else {
            makePeRoom(peRooms, randomUtil, teach, result);
        }
    }

    // 用于其他教室
    private void make(List<Room> rooms, RandomUtil randomUtil, Teach teach, List<Timetable> result) {
        //随机取一个教室
        Room room = rooms.get((int) (rooms.size() * Math.random()));
        //随机取得一个上课时间
        short time = (short) (randomUtil.getRandomInt() + 1);
        //查询出该时间该教室的全部课程信息
        List<Timetable> timetables = timetableRepository.findAllByRoomAndTime(room, time);
        //查询出该时间该任课老师的课程信息
        Timetable temp = timetableRepository.findByYearAndTimeAndTeacherNo(teach.getTeachNo().substring(0, 4), time, teach.getTeachNo().substring(7, 11));

        if (timetables.size() == 0 && temp == null) {
            Timetable timetable = new Timetable();
            String timetableNo = teach.getTeachNo() + room.getRoomNo() + NumToString.convert(time);
            timetable.setRoom(room);
            timetable.setTime(time);
            timetable.setTeach(teach);
            timetable.setStatus("0");
            timetable.setTimetableNo(timetableNo);
            result.add(timetable);
            randomUtil.remove();
        } else {
            makePeRoom(rooms, randomUtil, teach, result);
        }
    }
}

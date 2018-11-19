package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Room;
import cn.lollipop.schedule.domain.Student;
import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.domain.Timetable;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.repository.TimetableRepository;
import cn.lollipop.schedule.service.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimetableServiceImpl implements TimetableService {
    private final TimetableRepository timetableRepository;
    private final StudentRepository studentRepository;

    @Autowired
    public TimetableServiceImpl(TimetableRepository timetableRepository, StudentRepository studentRepository) {
        this.timetableRepository = timetableRepository;
        this.studentRepository = studentRepository;
    }

    @Override
    public List<Timetable> listStudentTable(String sno, String year) {
        Student student = this.studentRepository.getOne(sno);
        String classNo = student.getStuClass().getClassNo();
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, "1", year);
    }

    @Override
    public List<Timetable> listClassTable(String classNo, String year) {
        return this.timetableRepository.findAllByTeacherNoAndYearAndStatus(classNo, year, "1");
    }

    @Override
    public List<Timetable> listTeacherTable(String teacherNo, String year) {
        return this.timetableRepository.findAllByTeacherNoAndYearAndStatus(teacherNo, year, "1");
    }

    @Override
    public List<Timetable> listByStatus(String year, String status) {
        return this.timetableRepository.findAllByStatusAndYear(status, year);
    }

    @Override
    public List<Timetable> list(String year) {
        return this.timetableRepository.findAllByYear(year);
    }

    @Override
    public List<Timetable> listByGno(String gno, String year) {
        return this.timetableRepository.findAllByGnoAndYear(gno, year);
    }

    @Override
    public List<Timetable> listByGnoAndStatus(String gno, String year, String status) {
        return this.timetableRepository.findAllByGnoAndYearAndStatus(gno, year, status);
    }


    @Override
    public List<Timetable> listByClassNoAndStatus(String classNo, String year, String status) {
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, year, status);
    }

    @Override
    public List<Timetable> listByClassNoAndSubNo(String classNo, String year, String subNo) {
        return this.timetableRepository.findAllByClassNoAndYearAndSubNoAndStatus(classNo, year, subNo, "1");
    }

    @Override
    public List<Timetable> listByTeach(Teach teach) {
        return this.timetableRepository.findAllByTeachAndStatus(teach, "1");
    }

    @Override
    public List<Timetable> listRoomTable(Room room) {
        return this.timetableRepository.findAllByRoomAndStatus(room, "1");
    }

    @Override
    public Timetable showByRoomAndTime(Room room, Short time) {
        return this.timetableRepository.findByRoomAndTimeAndStatus(room, time, "1");
    }
}

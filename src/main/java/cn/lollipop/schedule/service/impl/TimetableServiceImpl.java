package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.*;
import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.repository.TimetableRepository;
import cn.lollipop.schedule.service.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TimetableServiceImpl implements TimetableService {
    private final TimetableRepository timetableRepository;
    private final StudentRepository studentRepository;
    private final ClassRepository classRepository;

    @Autowired
    public TimetableServiceImpl(TimetableRepository timetableRepository, StudentRepository studentRepository, ClassRepository classRepository) {
        this.timetableRepository = timetableRepository;
        this.studentRepository = studentRepository;
        this.classRepository = classRepository;
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
        Class myClass = this.classRepository.findByTeacher(teacher);
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(myClass.getClassNo(), "1", year);
    }

    @Override
    public Map<String, Object> preListTableBySubLeader(Teacher teacher) {
        Map<String, Object> map = new HashMap<>();
        map.put("subNo", teacher.getSubject().getSubNo());
        map.put("allClasses", this.classRepository.findAllByGradeNo(teacher.getTeacherGrade()));
        return map;
    }

    @Override
    public List<Timetable> listByClassNoAndSubNo(String classNo, String year, String subNo) {
        return this.timetableRepository.findAllByClassNoAndYearAndSubNoAndStatus(classNo, year, subNo, "1");
    }

    @Override
    public List<Class> preListTableByGradeLeader(Teacher teacher) {
        return this.classRepository.findAllByGradeNo(teacher.getTeacherGrade());
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
}

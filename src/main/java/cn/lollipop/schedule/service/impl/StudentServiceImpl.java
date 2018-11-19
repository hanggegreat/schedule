package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Student;
import cn.lollipop.schedule.domain.Timetable;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.repository.TimetableRepository;
import cn.lollipop.schedule.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    private final TimetableRepository timetableRepository;
    private final StudentRepository studentRepository;

    @Autowired
    public StudentServiceImpl(TimetableRepository timetableRepository, StudentRepository studentRepository) {
        this.timetableRepository = timetableRepository;
        this.studentRepository = studentRepository;
    }

    @Override
    public List<Timetable> findAllTimetablesByYear(String sno, String year) {
        Student student = this.studentRepository.getOne(sno);
        String classNo = student.getStuClass().getClassNo();
        return this.timetableRepository.findAllByClassNoAndStatusAndYear(classNo, "1", year);
    }
}

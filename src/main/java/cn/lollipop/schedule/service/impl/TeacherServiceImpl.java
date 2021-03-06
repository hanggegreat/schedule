package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Subject;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.SubjectRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import cn.lollipop.schedule.service.TeacherService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    private final TeacherRepository teacherRepository;
    private final SubjectRepository subjectRepository;

    public TeacherServiceImpl(TeacherRepository teacherRepository, SubjectRepository subjectRepository) {
        this.teacherRepository = teacherRepository;
        this.subjectRepository = subjectRepository;
    }

    @Override
    public Teacher show(String teacherNo) {
        return this.teacherRepository.findByTeacherNo(teacherNo);
    }

    @Override
    public List<Teacher> listByGnoAndSubNo(String gno, String subNo) {
        gno = String.valueOf(Integer.valueOf(gno) - 6);
        Subject subject = this.subjectRepository.getOne(subNo);
        return this.teacherRepository.findAllByTeacherGradeAndSubject(gno, subject);
    }
}

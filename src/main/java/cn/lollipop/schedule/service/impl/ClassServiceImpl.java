package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import cn.lollipop.schedule.service.ClassService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {
    private final ClassRepository classRepository;
    private final TeacherRepository teacherRepository;

    public ClassServiceImpl(ClassRepository classRepository, TeacherRepository teacherRepository) {
        this.classRepository = classRepository;
        this.teacherRepository = teacherRepository;
    }

    @Override
    public List<Class> listByGno(String gno) {
        return this.classRepository.findAllByGradeNo(gno);
    }

    @Override
    public List<Class> listByGradeTeacher(String teacherNo) {
        Teacher teacher = this.teacherRepository.getOne(teacherNo);
        return this.classRepository.findAllByGradeNo(teacher.getTeacherGrade());
    }
}

package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import cn.lollipop.schedule.service.ClassService;
import cn.lollipop.schedule.util.YearUtil;
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
    public List<Class> listByGradeNoAndYear(String gradeNo, String year) {
        return this.classRepository.findAllByGradeNoAndYear(gradeNo, year);
    }

    @Override
    public List<Class> listByGradeTeacher(String teacherNo) {
        Teacher teacher = this.teacherRepository.getOne(teacherNo);
        return this.classRepository.findAllByGradeNoAndYear(teacher.getTeacherGrade(), YearUtil.getCurrentYear());
    }

    @Override
    public List<Class> listByEnrollYear(String enrollYear) {
        return classRepository.findAllByEnrollYear(enrollYear);
    }

    @Override
    public Class show(String classNo) {
        return classRepository.getOne(classNo);
    }
}

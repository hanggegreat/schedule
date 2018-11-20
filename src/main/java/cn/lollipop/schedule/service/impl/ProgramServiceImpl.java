package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.repository.ProgramRepository;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.service.ProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgramServiceImpl implements ProgramService {
    private final ProgramRepository programRepository;
    private final ClassRepository classRepository;
    private final GradeRepository gradeRepository;
    private final StudentRepository studentRepository;

    @Autowired
    public ProgramServiceImpl(ProgramRepository programRepository, ClassRepository classRepository, GradeRepository gradeRepository, StudentRepository studentRepository) {
        this.programRepository = programRepository;
        this.classRepository = classRepository;
        this.gradeRepository = gradeRepository;
        this.studentRepository = studentRepository;
    }

    @Override
    public List<Program> listByClassNo(String classNo) {
        Class myClass = this.classRepository.getOne(classNo);
        Grade grade = this.gradeRepository.findByGradeNo(myClass.getGradeNo());
        return this.programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listStudentProgram(String sno) {
        Class myClass = this.studentRepository.getOne(sno).getStuClass();
        Grade grade = this.gradeRepository.findByGradeNo(myClass.getGradeNo());
        return this.programRepository.findAllByGradeAndStatus(grade, "1");
    }
}

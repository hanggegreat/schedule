package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.repository.ProgramRepository;
import cn.lollipop.schedule.service.ProgramService;
import cn.lollipop.schedule.util.YearUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class ProgramServiceImpl implements ProgramService {
    private final ProgramRepository programRepository;
    private final ClassRepository classRepository;
    private final GradeRepository gradeRepository;

    @Autowired
    public ProgramServiceImpl(ProgramRepository programRepository, ClassRepository classRepository, GradeRepository gradeRepository) {
        this.programRepository = programRepository;
        this.classRepository = classRepository;
        this.gradeRepository = gradeRepository;
    }

    @Override
    public List<Program> listStudentProgram(String sno) {
        String enrollYear = sno.substring(0, 4);
        Grade grade = gradeRepository.getOne(enrollYear);
        return programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listByClassTeacher(String teacherNo) {
        Class myClass = classRepository.findByTeacherNoAndYear(teacherNo, YearUtil.getCurrentYear());
        System.out.println(myClass);
        Grade grade = gradeRepository.findByGradeNo(myClass.getGradeNo());
        System.out.println(grade);
        return programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listByGnoAndYear(String gno, String year) {
        return programRepository.findAllByGradeNoAndYear(gno, year);
    }

    @Override
    public List<Program> listByGrade(String enrollYear) {
        Grade grade = gradeRepository.getOne(enrollYear);
        return programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listByStatusAndEnrollYear(String status, String enrollYear) {
        return programRepository.findAllByGradeAndStatus(gradeRepository.getOne(enrollYear), status);
    }

    @Override
    public Program insert(Program program) {
        return programRepository.save(program);
    }

    @Override
    public Program update(Program program) {
        return programRepository.save(program);
    }

    @Override
    public void remove(String id) {
        programRepository.deleteById(id);
    }

    @Override
    public Program show(String id) {
        return programRepository.getOne(id);
    }

    @Override
    public int refuseInBatch(Set<String> ids) {
        return programRepository.updateStatusByIdsAndStatus(ids, "3");
    }

    @Override
    public int publishInBatch(Set<String> ids) {
        return programRepository.updateStatusByIdsAndStatus(ids, "2");
    }

    @Override
    public int passInBatch(Set<String> ids) {
        return programRepository.updateStatusByIdsAndStatus(ids, "1");
    }
}

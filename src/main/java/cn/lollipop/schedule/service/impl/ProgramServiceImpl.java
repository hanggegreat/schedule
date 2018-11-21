package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.repository.ProgramRepository;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.service.ProgramService;
import cn.lollipop.schedule.util.YearUtil;
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
    public List<Program> listStudentProgram(String sno) {
        Class myClass = this.studentRepository.getOne(sno).getStuClass();
        Grade grade = this.gradeRepository.findByGradeNo(myClass.getGradeNo());
        return this.programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listByClassTeacher(String teacherNo) {
        Class myClass = this.classRepository.findByTeacherNoAndYear(teacherNo, YearUtil.getCurrentYear());
        Grade grade = this.gradeRepository.findByGradeNo(myClass.getGradeNo());
        return this.programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> listByGno(String gno) {
        return this.programRepository.findAllByGradeNoAndYearAndStatus(gno, YearUtil.getCurrentYear(), "1");
    }

    @Override
    public List<Program> listByGrade(String enrollYear) {
        Grade grade = this.gradeRepository.getOne(enrollYear);
        return this.programRepository.findAllByGradeAndStatus(grade, "1");
    }

    @Override
    public List<Program> insertInBatch(List<Program> programs) {
        return this.programRepository.saveAll(programs);
    }

    @Override
    public List<Program> updateInBatch(List<Program> programs) {
        return this.programRepository.saveAll(programs);
    }

    @Override
    public Program update(Program program) {
        return this.programRepository.save(program);
    }

    @Override
    public void removeInBatch(List<Program> programs) {
        this.programRepository.deleteInBatch(programs);
    }

    @Override
    public Program refuse(Program programs) {
        programs.setStatus("3");
        return this.programRepository.save(programs);
    }

    @Override
    public List<Program> refuseInBatch(List<Program> programs) {
        for (Program program : programs) {
            program.setStatus("3");
        }
        return this.programRepository.saveAll(programs);
    }

    @Override
    public Program pass(Program programs) {
        programs.setStatus("1");
        return this.programRepository.save(programs);
    }

    @Override
    public List<Program> passInBatch(List<Program> programs) {
        for (Program program : programs) {
            program.setStatus("1");
        }
        return this.programRepository.saveAll(programs);
    }
}

package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.service.ProgramService;
import cn.lollipop.schedule.service.SubjectService;
import cn.lollipop.schedule.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 16:55
 */
@Controller
public class ProgramController {
    private final ProgramService programService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final SubjectService subjectService;

    @Autowired
    public ProgramController(ProgramService programService, TeacherService teacherService, GradeRepository gradeRepository, SubjectService subjectService) {
        this.programService = programService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.subjectService = subjectService;
    }

    @RequestMapping("/student/program/list")
    public String studentList(Model model, Authentication authentication) {
        model.addAttribute("programs", programService.listStudentProgram(authentication.getName()));
        return "sub-view/program/list";
    }

    @RequestMapping("/teacher/adviser/program/list")
    public String adviserList(Model model, Authentication authentication) {
        model.addAttribute("programs", programService.listByClassTeacher(authentication.getName()));
        return "sub-view/program/list";
    }

    @RequestMapping("/teacher/gradeLeader/program/list")
    public String gradeLeaderList(Model model, Authentication authentication) {
        Teacher gradeLeader = teacherService.show(authentication.getName());
        Grade grade = gradeRepository.findByGradeNo(String.valueOf(Integer.parseInt(gradeLeader.getTeacherGrade()) + 6));
        model.addAttribute("programs", programService.listByGrade(grade.getEnrollYear()));
        return "sub-view/program/list";
    }

    @RequestMapping("/teacher/academic/program/listByGrade")
    public String preListByGrade(Model model) {
        model.addAttribute("grades", gradeRepository.findAll());
        return "sub-view/program/list_by_grade";
    }

    @RequestMapping("/teacher/academic/program/listByGrade/{enrollYear}")
    public List<Program> listByGrade(@PathVariable String enrollYear) {
        return programService.listByGrade(enrollYear);
    }

    @RequestMapping({"/teacher/academic/program/list/{status}"})
    public String preList(Authentication authentication, Model model, @PathVariable String status) {
        model.addAttribute("status", status);
        model.addAttribute("isAcademic", authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ACADEMIC")));
        model.addAttribute("grades", gradeRepository.findAll());
        return "sub-view/program/list_by_status_and_grade.html";
    }

    @RequestMapping({"/teacher/academic/program/list/{status}/{enrollYear}"})
    @ResponseBody
    public List<Program> list(@PathVariable String status, @PathVariable String enrollYear) {
        if ("0" .equals(status)) {
            List<Program> result = programService.listByStatusAndEnrollYear("0", enrollYear);
            result.addAll(programService.listByStatusAndEnrollYear("3", enrollYear));
            return result;
        }
        return programService.listByStatusAndEnrollYear(status, enrollYear);
    }

    @GetMapping("/teacher/academic/program/make")
    public String preMake(Model model) {
        model.addAttribute("grades", gradeRepository.findAll());
        model.addAttribute("subjects", subjectService.list());
        return "sub-view/program/make";
    }

    @PostMapping("/teacher/academic/program/make")
    @ResponseBody
    public Program make(@Valid Program program) {
        program.setStatus("0");
        program.setYear(String.valueOf(Integer.parseInt(program.getGrade().getEnrollYear()) + Integer.parseInt(program.getGradeNo()) - 7));
        program.setId(program.getYear() + program.getGradeNo() + program.getSubject().getSubNo());
        return programService.insert(program);
    }

    @RequestMapping("teacher/academic/program/show/{id}")
    @ResponseBody
    public Program show(@PathVariable String id) {
        return programService.show(id);
    }

    @RequestMapping("/teacher/academic/program/remove/{id}")
    @ResponseBody
    public boolean remove(@PathVariable String id) {
        programService.remove(id);
        return true;
    }

    @PostMapping("/teacher/academic/program/update")
    @ResponseBody
    public boolean update(String id, String name, short amount, String exam) {
        Program program = programService.show(id);
        program.setName(name);
        program.setAmount(amount);
        program.setExam(exam);
        return programService.update(program) != null;
    }

    @PostMapping("/teacher/academic/program/changeStatus/{status}")
    @ResponseBody
    public boolean changeStatus(@PathVariable String status, @RequestBody Set<String> ids) {
        if ("1" .equals(status)) {
            return this.programService.passInBatch(ids) > 0;
        }
        if ("2" .equals(status)) {
            return this.programService.publishInBatch(ids) > 0;
        }
        if ("3" .equals(status)) {
            return this.programService.refuseInBatch(ids) > 0;
        }
        return false;
    }

    @RequestMapping("/teacher/registrar/program/check")
    public String check(Authentication authentication, Model model) {
        model.addAttribute("status", "2");
        model.addAttribute("isAcademic", !authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_REGISTRAR")));
        model.addAttribute("grades", gradeRepository.findAll());
        return "sub-view/program/list_by_status_and_grade.html";
    }

    @RequestMapping("/teacher/subLeader/program/listByGnoAndYear/{gradeNo}/{year}")
    @ResponseBody
    public List<Program> listByGnoAndYear(@PathVariable String gradeNo, @PathVariable String year) {
        return programService.listByGnoAndYear(gradeNo, year);
    }
}
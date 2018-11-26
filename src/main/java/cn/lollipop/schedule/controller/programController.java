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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 16:55
 */
@Controller
@RequestMapping
public class programController {
    private final ProgramService programService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final SubjectService subjectService;

    @Autowired
    public programController(ProgramService programService, TeacherService teacherService, GradeRepository gradeRepository, SubjectService subjectService) {
        this.programService = programService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.subjectService = subjectService;
    }

    @RequestMapping("/student/program/list")
    public String studentList(Model model, Authentication authentication) {
        model.addAttribute("programs", this.programService.listStudentProgram(authentication.getName()));
        return "sub-view/show_program";
    }

    @GetMapping("/teacher/academic/program/make")
    public String preMake(Model model) {
        model.addAttribute("grades", this.gradeRepository.findAll());
        model.addAttribute("subjects", this.subjectService.list());
        return "sub-view/make_program";
    }

    @PostMapping("/teacher/academic/program/make")
    @ResponseBody
    public boolean make(Program program) {
        return programService.insert(program) != null;
    }

    @RequestMapping("/teacher/adviser/program/list")
    public String adviserList(Model model, Authentication authentication) {
        model.addAttribute("programs", this.programService.listByClassTeacher(authentication.getName()));
        return "sub-view/show_program";
    }

    @RequestMapping("/teacher/gradeLeader/program/list")
    public String gradeLeaderList(Model model, Authentication authentication) {
        Teacher gradeLeader = this.teacherService.show(authentication.getName());
        Grade grade = this.gradeRepository.findByGradeNo(String.valueOf(Integer.parseInt(gradeLeader.getTeacherGrade()) + 6));
        model.addAttribute("programs", this.programService.listByGrade(grade.getEnrollYear()));
        return "sub-view/show_program";
    }

    @RequestMapping({"/teacher/academic/program/listByGrade/{enrollYear}", "/teacher/academic/program/listByGrade"})
    public String listByGrade(Model model, @PathVariable(required = false) String enrollYear) {
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("programs", this.programService.listByGrade(enrollYear));
            model.addAttribute("enrollYear", enrollYear);
        }
        return "sub-view/show_program_by_grade";
    }

    @RequestMapping({"/teacher/academic/program/listUnpublished/{enrollYear}", "/teacher/academic/program/listUnpublished"})
    public String listUnpublished(Model model, @PathVariable(required = false) String enrollYear) {
        model.addAttribute("status", "0");
        model.addAttribute("url", "listUnpublished");
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("programs", this.programService.listByStatusAndEnrollYear("0", enrollYear));
            model.addAttribute("enrollYear", enrollYear);
        }
        return "sub-view/show_program_by_status_and_grade.html";
    }

    @RequestMapping({"/teacher/academic/program/check/{enrollYear}", "/teacher/academic/program/check"})
    public String check(Model model, @PathVariable(required = false) String enrollYear) {
        model.addAttribute("status", "2");
        model.addAttribute("url", "check");
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("programs", this.programService.listByStatusAndEnrollYear("2", enrollYear));
            model.addAttribute("enrollYear", enrollYear);
        }
        return "sub-view/show_program_by_status_and_grade.html";
    }

    @RequestMapping({"/teacher/academic/program/listPublished/{enrollYear}", "/teacher/academic/program/listPublished"})
    public String listPublished(Model model, @PathVariable(required = false) String enrollYear) {
        model.addAttribute("status", "1");
        model.addAttribute("url", "listPublished");
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("programs", this.programService.listByStatusAndEnrollYear("1", enrollYear));
            model.addAttribute("enrollYear", enrollYear);
        }
        return "sub-view/show_program_by_status_and_grade.html";
    }

    @RequestMapping({"/teacher/academic/program/review/{enrollYear}", "/teacher/academic/program/review"})
    public String review(Model model, @PathVariable(required = false) String enrollYear) {
        model.addAttribute("status", "2");
        model.addAttribute("url", "review");
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("enrollYear", enrollYear);
            model.addAttribute("programs", this.programService.listByStatusAndEnrollYear("2", enrollYear));
        }
        return "sub-view/show_program_by_status_and_grade.html";
    }

    @RequestMapping({"/teacher/academic/program/listFail/{enrollYear}", "/teacher/academic/program/listFail"})
    public String listFail(Model model, @PathVariable(required = false) String enrollYear) {
        model.addAttribute("status", "3");
        model.addAttribute("url", "listFail");
        if (enrollYear != null && !enrollYear.isEmpty()) {
            model.addAttribute("enrollYear", enrollYear);
            model.addAttribute("programs", this.programService.listByStatusAndEnrollYear("3", enrollYear));
        }
        return "sub-view/show_program_by_status_and_grade.html";
    }
}
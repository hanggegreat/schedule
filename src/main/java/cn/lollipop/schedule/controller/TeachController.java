package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.service.ClassService;
import cn.lollipop.schedule.service.ProgramService;
import cn.lollipop.schedule.service.TeachService;
import cn.lollipop.schedule.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/30 17:57
 */
@Controller
public class TeachController {
    private final ProgramService programService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final TeachService teachService;
    private final ClassService classService;

    @Autowired
    public TeachController(ProgramService programService, TeacherService teacherService, GradeRepository gradeRepository, TeachService teachService, ClassService classService) {
        this.programService = programService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.teachService = teachService;
        this.classService = classService;
    }

    @GetMapping("/teacher/subLeader/teach/list/{year}")
    public String subLeaderList(@PathVariable String year, Model model, Authentication authentication) {
        Teacher subjectLeader = teacherService.show(authentication.getName());
        model.addAttribute("subject", subjectLeader.getSubject());
        model.addAttribute("gradeNo", String.valueOf(Integer.parseInt(subjectLeader.getTeacherGrade()) + 6));
        model.addAttribute("year", Integer.parseInt(year));
        model.addAttribute("teaches", teachService.subjectLeaderList(String.valueOf(Integer.parseInt(subjectLeader.getTeacherGrade()) + 6), subjectLeader.getSubject().getSubNo(), year));
        return "sub-view/teach/list";
    }


    @RequestMapping("/teacher/subLeader/teach/make/{year}")
    public String make(Model model, @PathVariable String year, Authentication authentication) {
        Teacher subjectLeader = teacherService.show(authentication.getName());
        String gradeNo = String.valueOf(Integer.parseInt(subjectLeader.getTeacherGrade()) + 6);
        model.addAttribute("year", Integer.parseInt(year));
        model.addAttribute("gradeNo", gradeNo);
        model.addAttribute("subject", subjectLeader.getSubject());
        model.addAttribute("teaches", teachService.subjectLeaderList(gradeNo, subjectLeader.getSubject().getSubNo(), year));
        model.addAttribute("classes", classService.listByGradeNoAndYear(gradeNo, year));
        model.addAttribute("teachers", teacherService.listByGnoAndSubNo(gradeNo, subjectLeader.getSubject().getSubNo()));
        return "sub-view/teach/make";
    }

    @PostMapping("/teacher/subLeader/teach/make")
    @ResponseBody
    public Teach make(String classNo, Integer year, String teacherNo, Authentication authentication) {
        Teach teach = new Teach();

        String subNo = teacherService.show(authentication.getName()).getSubject().getSubNo();
        String enrollYear = classNo.substring(0, 4);
        String programId = year + (year - Integer.parseInt(enrollYear) + 7 + subNo);

        teach.setTeacher(teacherService.show(teacherNo));
        teach.settClass(classService.show(classNo));
        teach.setProgram(programService.show(programId));
        teach.setTeachNo(programId + teacherNo + classNo);
        return teachService.insert(teach);
    }

    @RequestMapping("/teacher/subLeader/teach/show/{id}")
    @ResponseBody
    public Teach show(@PathVariable Long id) {
        return teachService.show(id);
    }

    @RequestMapping("/teacher/subLeader/teach/remove/{id}")
    @ResponseBody
    public boolean remove(@PathVariable Long id) {
        return teachService.remove(id);
    }

    @RequestMapping("/teacher/subLeader/teach/update")
    @ResponseBody
    public Teach update(Long id, String teacherNo) {
        Teach teach = teachService.show(id);
        teach.setTeacher(teacherService.show(teacherNo));
        String oldTeachNo = teach.getTeachNo();
        String newTeachNo = oldTeachNo.substring(0, 7) + teacherNo + oldTeachNo.substring(11);
        teach.setTeachNo(newTeachNo);
        return teachService.update(teach);
    }
}
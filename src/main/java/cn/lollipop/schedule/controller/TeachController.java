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

import java.util.List;


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

    @GetMapping("/teacher/subLeader/teach/list")
    public String subjectLeaderPreList(Model model, Authentication authentication) {
        Teacher subjectLeader = teacherService.show(authentication.getName());
        model.addAttribute("subject", subjectLeader.getSubject());
        return "sub-view/teach/list";
    }

    @RequestMapping("/teacher/subLeader/teach/list/{enrollYear}/{year}")
    @ResponseBody
    public List<Teach> subjectLeaderList(@PathVariable String enrollYear, @PathVariable String year, Authentication authentication) {
        Teacher subjectLeader = teacherService.show(authentication.getName());
        return teachService.subjectLeaderList(gradeRepository.getOne(enrollYear).getGradeNo(), subjectLeader.getSubject().getSubNo(), year);
    }

    @RequestMapping("/teacher/subLeader/teach/make/{year}")
    public String preMake(Model model, @PathVariable String year, Authentication authentication) {
        Teacher subjectLeader = teacherService.show(authentication.getName());
        model.addAttribute("subject", subjectLeader.getSubject());
        model.addAttribute("year", Integer.parseInt(year));
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
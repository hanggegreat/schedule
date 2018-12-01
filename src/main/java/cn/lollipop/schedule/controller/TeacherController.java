package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.service.TeachService;
import cn.lollipop.schedule.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 15:05
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    private final TeacherService teacherService;
    private final TeachService teachService;

    @Autowired
    public TeacherController(TeacherService teacherService, TeachService teachService) {
        this.teacherService = teacherService;
        this.teachService = teachService;
    }

    @RequestMapping("/info")
    public String info(Model model, Authentication authentication) {
        model.addAttribute("teacher", teacherService.show(authentication.getName()));
        return "sub-view/basic_information.html";
    }

    @RequestMapping("/list/{gradeNo}/{subNo}")
    @ResponseBody
    public List<Teacher> listBySubNoAndGradeNo(@PathVariable String gradeNo, @PathVariable String subNo){
        return teacherService.listByGnoAndSubNo(gradeNo, subNo);
    }
}

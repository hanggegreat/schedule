package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 15:05
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    private final TeacherService teacherService;

    @Autowired
    public TeacherController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping("/info")
    public String info(Model model, Authentication authentication) {
        model.addAttribute("teacher", teacherService.show(authentication.getName()));
        return "sub-view/basic_information.html";
    }
}

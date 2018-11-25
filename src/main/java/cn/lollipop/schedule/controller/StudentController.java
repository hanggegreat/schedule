package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 14:54
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    private final StudentRepository studentRepository;

    @Autowired
    public StudentController(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @RequestMapping("/info")
    public String info(Model model, Authentication authentication) {
        model.addAttribute("student", studentRepository.getOne(authentication.getName()));
        return "sub-view/basic_information.html";
    }
}

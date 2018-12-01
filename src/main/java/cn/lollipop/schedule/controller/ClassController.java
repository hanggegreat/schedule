package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/30 17:57
 */
@Controller
public class ClassController {
    private final ClassService classService;

    @Autowired
    public ClassController(ClassService classService) {
        this.classService = classService;
    }

    @RequestMapping("/class/listByYearAndGradeNo/{year}/{gradeNo}")
    @ResponseBody
    public List<Class> listByYearAndGradeNo(@PathVariable String year, @PathVariable String gradeNo) {
        return this.classService.listByGradeNoAndYear(gradeNo, year);
    }

    @RequestMapping("/class/listByEnrollYear/{enrollYear}")
    @ResponseBody
    public List<Class> listByEnrollYear(@PathVariable String enrollYear) {
        return this.classService.listByEnrollYear(enrollYear);
    }
}

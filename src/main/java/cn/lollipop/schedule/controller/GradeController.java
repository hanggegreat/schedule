package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.repository.GradeRepository;
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
public class GradeController {
    private final GradeRepository gradeRepository;

    @Autowired
    public GradeController(GradeRepository gradeRepository) {
        this.gradeRepository = gradeRepository;
    }

    @RequestMapping("/grade/listByYear/{year}")
    @ResponseBody
    public List<Grade> listByYear(@PathVariable String year) {
        return this.gradeRepository.findAllByYear(year);
    }

    @RequestMapping("/grade/listByYearAndSubNo/{year}/{subNo}")
    @ResponseBody
    public List<Grade> listInProgramByYearAndSubNo(@PathVariable String year, @PathVariable String subNo) {
        return this.gradeRepository.findAllByYearAndSubNo(year, subNo);
    }
}

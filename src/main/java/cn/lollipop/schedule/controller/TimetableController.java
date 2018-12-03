package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Timetable;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.service.SubjectService;
import cn.lollipop.schedule.service.TeachService;
import cn.lollipop.schedule.service.TeacherService;
import cn.lollipop.schedule.service.TimetableService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/12/2 10:19
 */
@Controller
@RequestMapping
public class TimetableController {
    private final TimetableService timetableService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final SubjectService subjectService;
    private final TeachService teachService;

    @Autowired
    public TimetableController(TimetableService timetableService, TeacherService teacherService, GradeRepository gradeRepository, SubjectService subjectService, TeachService teachService) {
        this.timetableService = timetableService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.subjectService = subjectService;
        this.teachService = teachService;
    }

    @RequestMapping("/teacher/academic/timetable/make/{year}")
    public String make(Model model, @PathVariable String year) {
        model.addAttribute("grades", gradeRepository.findAllByYear(year));
        model.addAttribute("year", year);
        return "sub-view/timetable/make";
    }

    @RequestMapping("/teacher/academic/timetable/make/{year}/{classNo}")
    @ResponseBody
    public List<Timetable> make(@PathVariable String year, @PathVariable String classNo) {
        return timetableService.make(year, classNo);
    }

    @RequestMapping("/teacher/academic/timetable/listInMake/{classNo}/{year}")
    @ResponseBody
    public JSONObject listInMake(@PathVariable String year, @PathVariable String classNo) {
        List<Timetable> timetables = timetableService.listByClassNoAndYear(classNo, year);
        JSONObject result = new JSONObject();
        if (timetables.size() != 0) {
            result.put("type", "timetables");
            result.put("info", timetables);
        } else {
            result.put("type", "teaches");
            result.put("info", teachService.listByClassNoAndYear(classNo, year));
        }
        return result;
    }
}
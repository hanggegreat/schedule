package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.domain.Timetable;
import cn.lollipop.schedule.repository.ClassRepository;
import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.service.SubjectService;
import cn.lollipop.schedule.service.TeachService;
import cn.lollipop.schedule.service.TeacherService;
import cn.lollipop.schedule.service.TimetableService;
import com.alibaba.fastjson.JSONObject;
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
 * @date 2018/12/2 10:19
 */
@Controller
@RequestMapping
public class TimetableController {
    private final TimetableService timetableService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final ClassRepository classRepository;
    private final TeachService teachService;
    private final SubjectService subjectService;

    @Autowired
    public TimetableController(TimetableService timetableService, TeacherService teacherService, GradeRepository gradeRepository, ClassRepository classRepository, TeachService teachService, SubjectService subjectService) {
        this.timetableService = timetableService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.classRepository = classRepository;
        this.teachService = teachService;
        this.subjectService = subjectService;
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

    @RequestMapping("/teacher/academic/timetable/preExchange/{classNo}/{year}/{time}")
    @ResponseBody
    public List<Timetable> preExchange(@PathVariable String classNo, @PathVariable String year, @PathVariable Short time) {
        return timetableService.preExchange(classNo, year, time);
    }

    @RequestMapping("/teacher/academic/timetable/exchange/{year}/{classNo}/{first}/{second}")
    @ResponseBody
    public boolean exchange(@PathVariable String classNo, @PathVariable String year, @PathVariable Short first, @PathVariable Short second) {
        Timetable firstTimetable = timetableService.showByYearAndClassNoAndTime(year, classNo, first);
        Timetable secondTimetable = timetableService.showByYearAndClassNoAndTime(year, classNo, second);
        return timetableService.exchangeTowTimetables(firstTimetable, secondTimetable);
    }

    @RequestMapping("/teacher/academic/timetable/list/{year}/{status}")
    public String list(Model model, @PathVariable String year, @PathVariable String status) {
        model.addAttribute("grades", gradeRepository.findAllByYear(year));
        model.addAttribute("year", year);
        model.addAttribute("status", status);
        return "sub-view/timetable/list_by_class_and_status";
    }

    @RequestMapping("/teacher/academic/timetable/list/{classNo}/{year}/{status}")
    @ResponseBody
    public List<Timetable> list(@PathVariable String classNo, @PathVariable String year, @PathVariable String status) {
        return timetableService.listByClassNoAndYearAndStatus(classNo, year, status);
    }

    @RequestMapping("/teacher/academic/timetable/changeStatus/{year}/{enrollYear}/{status}")
    @ResponseBody
    public boolean changeStatus(@PathVariable String year, @PathVariable String enrollYear, @PathVariable String status) {
        return timetableService.changeStatus(year, enrollYear, status);
    }

    @RequestMapping("/teacher/timetable/teacherList")
    public String teacherList(Model model) {
        model.addAttribute("type", "teacherList");
        return "sub-view/timetable/list";
    }

    @RequestMapping("/teacher/timetable/teacherList/{year}")
    @ResponseBody
    public List<Timetable> teacherList(@PathVariable String year, Authentication authentication) {
        return timetableService.listTeacherTable(authentication.getName(), year);
    }


    @RequestMapping("/timetable/studentList")
    public String studentList(Model model) {
        model.addAttribute("type", "studentList");
        return "sub-view/timetable/list";
    }

    @RequestMapping("/timetable/studentList/{year}")
    @ResponseBody
    public List<Timetable> studentList(@PathVariable String year, Authentication authentication) {
        return timetableService.listStudentTable(authentication.getName(), year);
    }

    @RequestMapping("/teacher/adviser/timetable/adviserList")
    public String adviserList(Model model) {
        model.addAttribute("type", "adviserList");
        return "sub-view/timetable/list";
    }

    @RequestMapping("/teacher/adviser/timetable/adviserList/{year}")
    @ResponseBody
    public List<Timetable> adviserList(@PathVariable String year, Authentication authentication) {
        return timetableService.listByClassNoAndYearAndStatus(classRepository.findByTeacherNoAndYear(authentication.getName(), year).getClassNo(), year, "1");
    }

    @RequestMapping("/teacher/subLeader/timetable/subLeaderList/{year}")
    public String subLeaderList(Model model, @PathVariable String year, Authentication authentication) {
        model.addAttribute("type", "subLeaderList");
        model.addAttribute("year", year);
        model.addAttribute("classes", classRepository.findAllByEnrollYear(gradeRepository.findByGradeNo(String.valueOf(Integer.parseInt(teacherService.show(authentication.getName()).getTeacherGrade()) + 6)).getEnrollYear()));
        return "sub-view/timetable/list_by_class";
    }

    @RequestMapping("/teacher/subLeader/timetable/subLeaderList/{year}/{classNo}")
    @ResponseBody
    public List<Timetable> subLeaderList(@PathVariable String year, @PathVariable String classNo, Authentication authentication) {
        String subNo = teacherService.show(authentication.getName()).getSubject().getSubNo();
        return timetableService.listByClassNoAndSubNo(classNo, year, subNo);
    }

    @RequestMapping("/teacher/gradeLeader/timetable/gradeLeaderList/{year}")
    public String gradeLeaderList(Model model, @PathVariable String year, Authentication authentication) {
        model.addAttribute("type", "gradeLeaderList");
        model.addAttribute("classes", classRepository.findAllByEnrollYear(gradeRepository.findByGradeNo(String.valueOf(Integer.parseInt(teacherService.show(authentication.getName()).getTeacherGrade()) + 6)).getEnrollYear()));
        model.addAttribute("year", year);
        return "sub-view/timetable/list_by_class";
    }

    @RequestMapping("/teacher/gradeLeader/timetable/gradeLeaderList/{year}/{classNo}")
    @ResponseBody
    public List<Timetable> gradeLeaderList(@PathVariable String year, @PathVariable String classNo) {
        return timetableService.listByClassNoAndYearAndStatus(classNo, year, "1");
    }

    @RequestMapping("/teacher/academic/timetable/listByClass")
    public String listByClass() {
        return "sub-view/timetable/list_by_class_details";
    }

    @RequestMapping("/teacher/academic/timetable/listByTeacher")
    public String listByTeacher(Model model) {
        model.addAttribute("subjects", subjectService.list());
        return "sub-view/timetable/list_by_teacher_details";
    }

    @RequestMapping("/teacher/academic/timetable/listByTeacher/{year}/{teacherNo}")
    @ResponseBody
    public List<Timetable> listByTeacher(@PathVariable String year, @PathVariable String teacherNo) {
        return timetableService.listByTeacherNo(teacherNo, year);
    }
}
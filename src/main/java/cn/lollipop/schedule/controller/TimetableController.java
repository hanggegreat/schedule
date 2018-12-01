package cn.lollipop.schedule.controller;

import cn.lollipop.schedule.repository.GradeRepository;
import cn.lollipop.schedule.service.SubjectService;
import cn.lollipop.schedule.service.TeacherService;
import cn.lollipop.schedule.service.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * @author lollipop
 * @email nhuy@qq.com
 * @date 2018/11/25 16:55
 */
@Controller
@RequestMapping
public class TimetableController {
    private final TimetableService timetableService;
    private final TeacherService teacherService;
    private final GradeRepository gradeRepository;
    private final SubjectService subjectService;

    @Autowired
    public TimetableController(TimetableService timetableService, TeacherService teacherService, GradeRepository gradeRepository, SubjectService subjectService) {
        this.timetableService=timetableService;
        this.teacherService = teacherService;
        this.gradeRepository = gradeRepository;
        this.subjectService = subjectService;
    }
}
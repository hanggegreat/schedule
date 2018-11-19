package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Timetable;

import java.util.List;

public interface StudentService {
    /**
     * * 学生根据学年查询该学年自己的课表信息
     *
     * @param sno 学生编号
     * @param year 学年编号
     * @return 以List集合的形式返回全部数据
     */
    List<Timetable> findAllTimetablesByYear(String sno, String year);
}
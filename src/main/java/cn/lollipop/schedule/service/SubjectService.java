package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Subject;

import java.util.List;

public interface SubjectService {
    /**
     * 查询全部学科信息
     *
     * @return 以List集合的形式返回全部数据
     */
    List<Subject> list();
}

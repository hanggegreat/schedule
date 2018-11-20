package cn.lollipop.schedule.service;

import cn.lollipop.schedule.domain.Class;

import java.util.List;

public interface ClassService {
    /**
     * 根据年级号查询出该年级的全部班级信息
     *
     * @param gno 年级号
     * @return 以List集合的形式返回全部查询出的数据
     */
    List<Class> listByGno(String gno);
}

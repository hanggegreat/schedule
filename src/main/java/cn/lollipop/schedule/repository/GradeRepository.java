package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GradeRepository extends JpaRepository<Grade, String> {
    /**
     * 根据年级号查询出该年级的信息
     * @param gradeNo 年级号
     * @return
     */
    Grade findByGradeNo(String gradeNo);
}
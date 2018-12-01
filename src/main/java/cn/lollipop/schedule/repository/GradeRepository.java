package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GradeRepository extends JpaRepository<Grade, String> {
    /**
     * 根据年级号查询出该年级的信息
     *
     * @param gradeNo 年级号
     * @return 返回年级对象
     */
    Grade findByGradeNo(String gradeNo);

    /**
     * 查询出指定学年在校的年级
     *
     * @param year 学年编号
     * @return 以List集合的形式返回全部数据
     */
    @Query(nativeQuery = true, value = "SELECT enrollYear, gradeNo FROM XJ_Grade WHERE ?1 BETWEEN enrollYear AND enrollYear + 2 ORDER BY gradeNo ASC")
    List<Grade> findAllByYear(String year);

    /**
     * 查询指定学年开设指定学科的年级
     *
     * @param year  学年编号
     * @param subNo 学科编号
     * @return 以List集合的形式返回全部数据
     */
    @Query(nativeQuery = true, value = "SELECT g.enrollYear, g.gradeNo FROM XJ_Grade g JOIN pke_program p ON g.enrollYear = p.enrollYear AND g.GradeNo = p.gradeNo WHERE ?1 BETWEEN g.enrollYear AND g.enrollYear + 2 AND ?2 = p.subNo ORDER BY g.gradeNo ASC")
    List<Grade> findAllByYearAndSubNo(String year, String subNo);
}
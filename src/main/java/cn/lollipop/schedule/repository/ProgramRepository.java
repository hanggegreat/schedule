package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Grade;
import cn.lollipop.schedule.domain.Program;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

public interface ProgramRepository extends JpaRepository<Program, String> {
    /**
     * 根据注册学年以及发布状态查询该届学生的全部培养方案信息
     *
     * @param grade  年级
     * @param status 发布状态
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Program> findAllByGradeAndStatus(Grade grade, String status);

    /**
     * 根据年级号以及发布状态查询出该年级学生该学年的全部培养方案信息
     *
     * @param gradeNo 年级号
     * @param year    学年编号
     * @return 以List集合的形式返回查询出的全部数据
     */
    List<Program> findAllByGradeNoAndYear(String gradeNo, String year);

    /**
     * 批量修改培养方案状态
     *
     * @param ids    培养方案编号
     * @param status 要修改为的状态
     * @return 返回修改行数
     */
    @Modifying
    @Transactional
    @Query(nativeQuery = true, value = "UPDATE pke_program SET status = ?2 WHERE id in ?1")
    int updateStatusByIdsAndStatus(Set<String> ids, String status);
}

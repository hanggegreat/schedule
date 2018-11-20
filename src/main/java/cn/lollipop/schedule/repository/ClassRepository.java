package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Class;
import cn.lollipop.schedule.domain.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ClassRepository extends JpaRepository<Class, String> {
    /**
     * 查询班主任所带的班级信息
     * @param teacher 班主任
     * @return 返回班级对象
     */
    Class findByTeacher(Teacher teacher);

    /**
     * 根据年级号查询出该年级的全部班级信息
     * @param gradeNo 年级号
     * @return 以List集合的形式返回全部数据
     */
    List<Class> findAllByGradeNo(String gradeNo);
}
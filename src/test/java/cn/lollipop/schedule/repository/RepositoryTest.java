package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.domain.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RepositoryTest {
    @Autowired
    private ClassRepository classRepository;
    @Autowired
    private TeacherRepository teacherRepository;
    @Autowired
    private TeachRepository teachRepository;

    @Test
    public void testClassRepository() {
        Teacher teacher = new Teacher();
        teacher.setTeacherNo("0006");
        System.out.println(this.classRepository.findByTeacher(teacher));
    }

    @Test
    public void testTeacherRepository() {
        Teacher teacher = this.teacherRepository.findSubjectLeaderNo("01", "1");
        System.out.println(teacher);
    }

    @Test
    public void testTeachRepository(){
        List<Teach> teaches = this.teachRepository.findAllByClassNoAndYear("20160301", "2017");
//        List<Teach> teaches = this.teachRepository.findAll();
        System.out.println(teaches);
    }
}

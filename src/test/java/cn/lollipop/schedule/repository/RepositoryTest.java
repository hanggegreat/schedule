package cn.lollipop.schedule.repository;

import cn.lollipop.schedule.domain.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RepositoryTest {
    @Autowired
    private ClassRepository classRepository;

    @Test
    public void testClassRepository() {
        Teacher teacher = new Teacher();
        teacher.setTeacherNo("1234");
        System.out.println(this.classRepository.findByTeacher(teacher));
    }
}

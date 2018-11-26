package cn.lollipop.schedule;

import cn.lollipop.schedule.repository.RoomRepository;
import cn.lollipop.schedule.repository.SubjectRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RepositoryTests {
    @Autowired
    private SubjectRepository subjectRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private TeacherRepository teacherRepository;

    @Test
    public void testSubjectRepository() {
        System.out.println(subjectRepository.findAll());
    }

    @Test
    public void testRoomRepository() {
        System.out.println(roomRepository.findAll());
    }

    @Test
    public void testTeacherRepository() {
        System.out.println(teacherRepository.findAll());
    }
}

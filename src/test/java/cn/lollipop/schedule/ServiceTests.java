package cn.lollipop.schedule;

import cn.lollipop.schedule.service.TimetableService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ServiceTests {
    @Autowired
    private TimetableService timetableService;

    @Test
    public void testTeacherRepository() {
        timetableService.make("2018", "201703");
    }
}

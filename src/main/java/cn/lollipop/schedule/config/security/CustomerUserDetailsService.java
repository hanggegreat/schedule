package cn.lollipop.schedule.config.security;

import cn.lollipop.schedule.domain.Job;
import cn.lollipop.schedule.domain.Student;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.*;

@Service
public class CustomerUserDetailsService implements UserDetailsService {
    private final StudentRepository studentRepository;
    private final TeacherRepository teacherRepository;
    private final HttpSession session;

    @Autowired
    public CustomerUserDetailsService(StudentRepository studentRepository, TeacherRepository teacherRepository, HttpSession session) {
        this.studentRepository = studentRepository;
        this.teacherRepository = teacherRepository;
        this.session = session;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username == null) {
            throw new UsernameNotFoundException("UserName can not be null!");
        }

        List<GrantedAuthority> authorities = new ArrayList<>();
        if (username.length() == 4) {// 教师编号
            Teacher teacher = this.teacherRepository.findByTeacherNo(username);
            System.out.println(teacher);
            if (teacher != null) {
                Set<Job> jobs = teacher.getJobs();
                Set<String> jobNos = new HashSet<>();
                for (Job job : jobs) {
                    jobNos.add(job.getJobNo());
                }
                authorities.add(new SimpleGrantedAuthority("ROLE_TEACHER"));
                if (jobNos.contains("00")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_ADVISER"));
                }
                if (jobNos.contains("21")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_SUBLEADER"));
                }
                if (jobNos.contains("22")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_GRADELEADER"));
                }
                if (jobNos.contains("23")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_ACADEMIC"));
                }
                if (jobNos.contains("24")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_REGISTRAR"));
                }
                if (jobNos.contains("25")) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_PRINCIPAL"));
                }
                session.setAttribute("username", teacher.getTeacherName());
                session.setAttribute("type", "teacher");
                return new User(username, teacher.getTeacherKey(), authorities);
            }
        } else if (username.length() == 8) {// 学生编号
            Student student = this.studentRepository.findBySno(username);
            if (student != null) {
                authorities.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
                session.setAttribute("username", student.getSname());
                session.setAttribute("type", "student");
                return new User(username, student.getPassword(), authorities);
            }
        }

        throw new UsernameNotFoundException("User " + username + " not found!");
    }
}
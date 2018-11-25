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
        List<GrantedAuthority> authorities = new ArrayList<>();
        Optional<Teacher> teacherOptional = this.teacherRepository.findById(username);
        if (teacherOptional.isPresent()) {
            Set<Job> jobs = teacherOptional.get().getJobs();
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
            session.setAttribute("username", teacherOptional.get().getTeacherName());
            session.setAttribute("type", "teacher");
            return new User(username, teacherOptional.get().getTeacherKey(), authorities);
        } else {
            Optional<Student> studentOptional = this.studentRepository.findById(username);
            if (studentOptional.isPresent()) {
                authorities.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
                session.setAttribute("username", studentOptional.get().getSname());
                session.setAttribute("type", "student");
                return new User(username, studentOptional.get().getPassword(), authorities);
            }
        }
        throw new UsernameNotFoundException("User " + username + " not found!");
    }
}
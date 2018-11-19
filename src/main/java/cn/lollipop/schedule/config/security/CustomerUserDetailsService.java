package cn.lollipop.schedule.config.security;

import cn.lollipop.schedule.domain.Job;
import cn.lollipop.schedule.domain.Student;
import cn.lollipop.schedule.domain.Teacher;
import cn.lollipop.schedule.repository.StudentRepository;
import cn.lollipop.schedule.repository.TeacherRepository;
import cn.lollipop.schedule.util.NumToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class CustomerUserDetailsService implements UserDetailsService {
    private final StudentRepository studentRepository;
    private final TeacherRepository teacherRepository;

    @Autowired
    public CustomerUserDetailsService(StudentRepository studentRepository, TeacherRepository teacherRepository) {
        this.studentRepository = studentRepository;
        this.teacherRepository = teacherRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Teacher teacher = this.teacherRepository.getOne(username);
        Student student = this.studentRepository.getOne(username);
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (teacher != null) {
            Set<Job> jobs = teacher.getJobs();
            Set<String> jobNos = new HashSet<>();
            for (Job job : jobs) {
                jobNos.add(job.getJobNo());
            }
            if (jobNos.contains("00")) {
                authorities.add(new SimpleGrantedAuthority("ROLE_ADVISER"));
            }
            for (int i = 1; i <= 13; i++) {
                if (jobNos.contains(NumToString.convert(i))) {
                    authorities.add(new SimpleGrantedAuthority("ROLE_TEACHER"));
                }
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
            return new User(username, teacher.getTeacherKey(), authorities);
        } else if (student != null) {
            authorities.add(new SimpleGrantedAuthority("ROLE_STUDENT"));
            return new User(username, student.getPassword(), authorities);
        }
        throw new UsernameNotFoundException("User " + username + " not found!");
    }
}
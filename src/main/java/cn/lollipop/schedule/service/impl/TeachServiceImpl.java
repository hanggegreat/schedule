package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Program;
import cn.lollipop.schedule.domain.Teach;
import cn.lollipop.schedule.repository.TeachRepository;
import cn.lollipop.schedule.service.TeachService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeachServiceImpl implements TeachService {
    private final TeachRepository teachRepository;

    public TeachServiceImpl(TeachRepository teachRepository) {
        this.teachRepository = teachRepository;
    }

    @Override
    public List<Teach> listByProgram(Program program) {
        return this.teachRepository.findAllByProgram(program);
    }

    @Override
    public List<Teach> listByTeacherNo(String teacherNo, String year) {
        return this.teachRepository.findAllByTeacherNoAndYear(teacherNo, year);
    }
}

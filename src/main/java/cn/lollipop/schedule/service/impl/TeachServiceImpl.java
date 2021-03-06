package cn.lollipop.schedule.service.impl;

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
    public List<Teach> subjectLeaderList(String gradeNo, String subNo, String year) {
        return teachRepository.findAllBySubNoAndGradeNoAndYear(subNo, gradeNo, year);
    }

    @Override
    public Teach show(Long id) {
        return teachRepository.getOne(id);
    }

    @Override
    public Teach insert(Teach teach) {
        return teachRepository.save(teach);
    }

    @Override
    public Teach update(Teach teach) {
        return teachRepository.save(teach);
    }

    @Override
    public boolean remove(Long id) {
        teachRepository.deleteById(id);
        return true;
    }

    @Override
    public List<Teach> listByClassNoAndYear(String classNo, String year) {
        return teachRepository.findAllByClassNoAndYear(classNo, year);
    }
}

package cn.lollipop.schedule.service.impl;

import cn.lollipop.schedule.domain.Subject;
import cn.lollipop.schedule.repository.SubjectRepository;
import cn.lollipop.schedule.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {
    private final SubjectRepository subjectRepository;

    @Autowired
    public SubjectServiceImpl(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    @Override
    public List<Subject> list() {
        return this.subjectRepository.findAll();
    }

    @Override
    public Subject show(String subNo) {
        return this.subjectRepository.getOne(subNo);
    }
}

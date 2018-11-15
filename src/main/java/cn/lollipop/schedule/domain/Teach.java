package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "pke_teach")
public class Teach implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;//主键

    @Column(length = 19, columnDefinition = "char(19)")
    @Size(min = 19, max = 19)
    private String teachNo;//任课编号

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "programId")
    private Program program;//培养方案

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherNo")
    private Teacher teacher;//教师编号

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "classNo")
    private Class tClass;//班级

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTeachNo() {
        return teachNo;
    }

    public void setTeachNo(String teachNo) {
        this.teachNo = teachNo;
    }

    public Program getProgram() {
        return program;
    }

    public void setProgram(Program program) {
        this.program = program;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Class gettClass() {
        return tClass;
    }

    public void settClass(Class tClass) {
        this.tClass = tClass;
    }
}

package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "pke_teach")
public class Teach implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;//主键

    @Column(length = 17, columnDefinition = "char(19)")
    @Size(min = 17, max = 17)
    private String teachNo;//任课编号

    @ManyToOne
    @JoinColumn(name = "programId", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Program program;//培养方案

    @ManyToOne
    @JoinColumn(name = "teacherNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Teacher teacher;//教师

    @OneToOne
    @JoinColumn(name = "classNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
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

    @Override
    public String toString() {
        return "Teach{" +
                "id=" + id +
                ", teachNo='" + teachNo + '\'' +
                ", program=" + program +
                ", teacher=" + teacher +
                ", tClass=" + tClass +
                '}';
    }
}

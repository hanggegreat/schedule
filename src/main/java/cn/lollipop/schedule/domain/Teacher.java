package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "`js0_teacher`")
public class Teacher implements Serializable {
    @Id
    @Column(length = 4, columnDefinition = "char(4)")
    @Size(min = 4, max = 4)
    private String teacherNo;//教师编号

    @Column(length = 10)
    @Size(max = 10)
    private String teacherName;//教师姓名

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String teacherSex;//教师性别

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherGrade", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Grade grade;//教师年级

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherState", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private State state;//教师状态

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "teacherSub", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Subject subject;//教师学科

    @Column(length = 15)
    @Size(max = 15)
    private String teacherKey;//教师登录密码

    public String getTeacherNo() {
        return teacherNo;
    }

    public void setTeacherNo(String teacherNo) {
        this.teacherNo = teacherNo;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(String teacherSex) {
        this.teacherSex = teacherSex;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public String getTeacherKey() {
        return teacherKey;
    }

    public void setTeacherKey(String teacherKey) {
        this.teacherKey = teacherKey;
    }
}
package cn.lollipop.schedule.domain;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Set;

@Entity(name = "js_teacher")
@Proxy(lazy = false)
public class Teacher implements Serializable {
    @Id
    @Column(length = 5, columnDefinition = "char(5)")
    @Size(min = 5, max = 5)
    private String id;

    @Column(length = 4, columnDefinition = "char(4)")
    @Size(min = 4, max = 4)
    private String teacherNo;//教师编号

    @Column(length = 10)
    @Size(max = 10)
    private String teacherName;//教师姓名

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String teacherSex;//教师性别

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String teacherGrade;//年级号

    @ManyToOne
    @JoinColumn(name = "teacherState", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    @NotFound(action= NotFoundAction.IGNORE)
    private State state;//教师状态

    @ManyToOne
    @JoinColumn(name = "teacherSub", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    @NotFound(action= NotFoundAction.IGNORE)
    private Subject subject;//教师学科

    @Column(length = 15)
    @Size(max = 15)
    private String teacherKey;//教师登录密码


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "`js_jiao_shi_zhi_wei`",
            joinColumns = {@JoinColumn(name = "teacherNo", referencedColumnName = "teacherNo",
                    foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))},
            inverseJoinColumns = {@JoinColumn(name = "teacherJob", referencedColumnName = "jobNo",
                    foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))}
    )
    @NotFound(action= NotFoundAction.IGNORE)
    private Set<Job> jobs;//教师职位

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public String getTeacherGrade() {
        return teacherGrade;
    }

    public void setTeacherGrade(String teacherGrade) {
        this.teacherGrade = teacherGrade;
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

    public Set<Job> getJobs() {
        return jobs;
    }

    public void setJobs(Set<Job> jobs) {
        this.jobs = jobs;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id='" + id + '\'' +
                ", teacherNo='" + teacherNo + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", teacherSex='" + teacherSex + '\'' +
                ", teacherGrade='" + teacherGrade + '\'' +
                ", state=" + state +
                ", subject=" + subject +
                ", teacherKey='" + teacherKey + '\'' +
                ", jobs=" + jobs +
                '}';
    }
}
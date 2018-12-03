package cn.lollipop.schedule.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "XJ_Class")
@Proxy(lazy = false)
public class Class implements Serializable {
    @Id
    @Column(length = 6, columnDefinition = "char(6)")
    @Size(min = 6, max = 6)
    private String classNo;//班级编号

    @Column(length = 6, columnDefinition = "char(6)")
    @Size(min = 6, max = 6)
    private String className;//班级名称

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String gradeNo;//年级号

    @Column(length = 3, columnDefinition = "char(3)")
    @Size(max = 3)
    private String classNum;//人数

    @ManyToOne
    @JoinColumn(name = "teacherNo", referencedColumnName = "teacherNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Teacher teacher;//班主任

    public String getClassNo() {
        return classNo;
    }

    public void setClassNo(String classNo) {
        this.classNo = classNo;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getGradeNo() {
        return gradeNo;
    }

    public void setGradeNo(String gradeNo) {
        this.gradeNo = gradeNo;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    @Override
    public String toString() {
        return "Class{" +
                "classNo='" + classNo + '\'' +
                ", className='" + className + '\'' +
                ", gradeNo='" + gradeNo + '\'' +
                ", teacher=" + teacher +
                ", classNum=" + classNum +
                '}';
    }
}

package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "XJ_Student")
public class Student implements Serializable {
    @Id
    @Column(length = 8, columnDefinition = "char(8)")
    @Size(min = 8, max = 8)
    private String sno;//学生编号

    @Column(length = 20)
    @Size(max = 20)
    private String sname;//学生姓名

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String gender;//性别

    @ManyToOne
    @JoinColumn(name = "classNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Class stuClass;//班级

    @ManyToOne
    @JoinColumn(name = "sStatus", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Status status;//状态

    @Column(length = 32)
    @Size(max = 32)
    private String password;//登录密码

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Class getStuClass() {
        return stuClass;
    }

    public void setStuClass(Class stuClass) {
        this.stuClass = stuClass;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno='" + sno + '\'' +
                ", sname='" + sname + '\'' +
                ", gender='" + gender + '\'' +
                ", stuClass=" + stuClass +
                ", status=" + status +
                ", password='" + password + '\'' +
                '}';
    }
}

package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "pke_program")
public class Program implements Serializable {
    @Id
    @Column(length = 7, columnDefinition = "char(7)")
    @Size(min = 7, max = 7)
    private String id;//编号

    @Column(length = 4, columnDefinition = "char(4)")
    @Size(min = 4, max = 4)
    private String year;//学年号

    @ManyToOne
    @JoinColumn(name = "enrollYear", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Grade grade;//注册学年

    @Column(length = 20)
    @Size(max = 20)
    private String name;//名称

    @Column
    private Short amount;//课时数

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String exam;//考查方式

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String status;//发布状态

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String gradeNo;//年级号

    @ManyToOne
    @JoinColumn(name = "subNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Subject subject;//学科


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Short getAmount() {
        return amount;
    }

    public void setAmount(Short amount) {
        this.amount = amount;
    }

    public String getExam() {
        return exam;
    }

    public void setExam(String exam) {
        this.exam = exam;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGradeNo() {
        return gradeNo;
    }

    public void setGradeNo(String gradeNo) {
        this.gradeNo = gradeNo;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Program{" +
                "id='" + id + '\'' +
                ", year='" + year + '\'' +
                ", grade=" + grade +
                ", name='" + name + '\'' +
                ", amount=" + amount +
                ", exam='" + exam + '\'' +
                ", status='" + status + '\'' +
                ", gradeNo='" + gradeNo + '\'' +
                ", subject=" + subject +
                '}';
    }
}
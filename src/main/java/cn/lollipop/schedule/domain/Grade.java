package cn.lollipop.schedule.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "XJ_Grade")
public class Grade implements Serializable {
    @Id
    @Column(length = 4, columnDefinition = "char(4)")
    @Size(min = 4, max = 4)
    private String enrollYear;//注册年份

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String gradeNo;//年级号

    public String getEnrollYear() {
        return enrollYear;
    }

    public void setEnrollYear(String enrollYear) {
        this.enrollYear = enrollYear;
    }

    public String getGradeNo() {
        return gradeNo;
    }

    public void setGradeNo(String gradeNo) {
        this.gradeNo = gradeNo;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "enrollYear='" + enrollYear + '\'' +
                ", gradeNo='" + gradeNo + '\'' +
                '}';
    }
}

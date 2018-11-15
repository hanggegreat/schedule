package cn.lollipop.schedule.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity(name = "XJ_StudentStaNo")
public class Status {
    @Id
    @Column(length = 2, columnDefinition = "char(2)")
    @Size(min = 2, max = 2)
    private String stuStaNo;

    @Column(length = 4)
    @Size(max = 4)
    private String stuStaName;

    public String getStuStaNo() {
        return stuStaNo;
    }

    public void setStuStaNo(String stuStaNo) {
        this.stuStaNo = stuStaNo;
    }

    public String getStuStaName() {
        return stuStaName;
    }

    public void setStuStaName(String stuStaName) {
        this.stuStaName = stuStaName;
    }
}

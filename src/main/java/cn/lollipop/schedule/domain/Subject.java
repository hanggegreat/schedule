package cn.lollipop.schedule.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "js_xue_ke")
@Proxy(lazy = false)
public class Subject implements Serializable {
    @Id
    @Column(length = 2, columnDefinition = "char(1)")
    @Size(min = 2, max = 2)
    private String subNo;//学科编号

    @Column(length = 5)
    @Size(max = 5)
    private String subName;//学科名称

    public String getSubNo() {
        return subNo;
    }

    public void setSubNo(String subNo) {
        this.subNo = subNo;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "subNo='" + subNo + '\'' +
                ", subName='" + subName + '\'' +
                '}';
    }
}
package cn.lollipop.schedule.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity(name = "`js1.2_zhuang_tai`")
@Proxy(lazy = false)
public class State {
    @Id
    @Column(length = 2, columnDefinition = "char(2)")
    @Size(min = 2, max = 2)
    private String stateNo;//状态编号

    @Column(length = 2, columnDefinition = "char(2)")
    @Size(min = 2, max = 2)
    private String stateName;//状态名称

    public String getStateNo() {
        return stateNo;
    }

    public void setStateNo(String stateNo) {
        this.stateNo = stateNo;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
    }

    @Override
    public String toString() {
        return "State{" +
                "stateNo='" + stateNo + '\'' +
                ", stateName='" + stateName + '\'' +
                '}';
    }
}

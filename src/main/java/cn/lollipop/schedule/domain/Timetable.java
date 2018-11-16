package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "pke_timetable")
public class Timetable implements Serializable {
    @Id
    @Column(length = 25, columnDefinition = "char(25)")
    @Size(min = 25, max = 25)
    private String id;//课程编号

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String status;//课程发布状态

    @Column
    private Short time;//上课时间

    @Column(length = 19, columnDefinition = "char(19)")
    @Size(min = 19, max = 19)
    private String teachNo;//任教编号

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "roomNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Room room;//教室编号

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Short getTime() {
        return time;
    }

    public void setTime(Short time) {
        this.time = time;
    }

    public String getTeachNo() {
        return teachNo;
    }

    public void setTeachNo(String teachNo) {
        this.teachNo = teachNo;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}

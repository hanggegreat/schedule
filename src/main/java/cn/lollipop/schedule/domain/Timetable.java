package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "pke_timetable")
public class Timetable implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;//id

    @Column(length = 25, columnDefinition = "char(25)")
    @Size(min = 25, max = 25)
    private String timetableNo;//课程编号

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String status;//课程发布状态

    @Column
    private Short time;//上课时间

    @ManyToOne
    @JoinColumn(name = "teachNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Teach teach;//任课信息

    @ManyToOne
    @JoinColumn(name = "roomNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Room room;//教室

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTimetableNo() {
        return timetableNo;
    }

    public void setTimetableNo(String timetableNo) {
        this.timetableNo = timetableNo;
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

    public Teach getTeach() {
        return teach;
    }

    public void setTeach(Teach teach) {
        this.teach = teach;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    @Override
    public String toString() {
        return "Timetable{" +
                "id=" + id +
                ", timetableNo='" + timetableNo + '\'' +
                ", status='" + status + '\'' +
                ", time=" + time +
                ", teach=" + teach +
                ", room=" + room +
                '}';
    }
}

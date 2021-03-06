package cn.lollipop.schedule.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity(name = "js_fang_jian")
@Proxy(lazy = false)
public class Room implements Serializable {
    @Id
    @Column(length = 4, columnDefinition = "char(4)")
    @Size(min = 4, max = 4)
    private String roomNo;//教室编号

    @OneToOne
    @JoinColumn(name = "roomFunctionNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private RoomFunction roomFunction;//教室功能

    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String roomStateNo;//教室状态号

    @Column
    private Short roomNowPeople;//当前已容纳人数

    @Column
    private Short roomCapacity;//教室容量

    @ManyToOne
    @JoinColumn(name = "roomBlockNo", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    private Block block;//楼

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public RoomFunction getRoomFunction() {
        return roomFunction;
    }

    public void setRoomFunction(RoomFunction roomFunction) {
        this.roomFunction = roomFunction;
    }

    public String getRoomStateNo() {
        return roomStateNo;
    }

    public void setRoomStateNo(String roomStateNo) {
        this.roomStateNo = roomStateNo;
    }

    public Short getRoomNowPeople() {
        return roomNowPeople;
    }

    public void setRoomNowPeople(Short roomNowPeople) {
        this.roomNowPeople = roomNowPeople;
    }

    public Short getRoomCapacity() {
        return roomCapacity;
    }

    public void setRoomCapacity(Short roomCapacity) {
        this.roomCapacity = roomCapacity;
    }

    public Block getBlock() {
        return block;
    }

    public void setBlock(Block block) {
        this.block = block;
    }

    @Override
    public String toString() {
        return "Room{" +
                "roomNo='" + roomNo + '\'' +
                ", roomFunction=" + roomFunction +
                ", roomStateNo='" + roomStateNo + '\'' +
                ", roomNowPeople=" + roomNowPeople +
                ", roomCapacity=" + roomCapacity +
                ", block=" + block +
                '}';
    }
}

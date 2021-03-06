package cn.lollipop.schedule.domain;

import org.hibernate.annotations.Proxy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity(name = "js_fang_jian_gong_neng")
@Proxy(lazy = false)
public class RoomFunction {
    @Id
    @Column(length = 2, columnDefinition = "char(2)")
    @Size(min = 2, max = 2)
    private String roomFunctionNo;

    @Column(length = 10)
    @Size(max = 10)
    private String roomFunctionContent;

    public String getRoomFunctionNo() {
        return roomFunctionNo;
    }

    public void setRoomFunctionNo(String roomFunctionNo) {
        this.roomFunctionNo = roomFunctionNo;
    }

    public String getRoomFunctionContent() {
        return roomFunctionContent;
    }

    public void setRoomFunctionContent(String roomFunctionContent) {
        this.roomFunctionContent = roomFunctionContent;
    }

    @Override
    public String toString() {
        return "RoomFunction{" +
                "roomFunctionNo='" + roomFunctionNo + '\'' +
                ", roomFunctionContent='" + roomFunctionContent + '\'' +
                '}';
    }
}

package cn.lollipop.schedule.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Size;

@Entity(name = "js6.3_lou")
public class Block {
    @Id
    @Column(length = 1, columnDefinition = "char(1)")
    @Size(min = 1, max = 1)
    private String blockNo;//编号

    @Column(length = 3, columnDefinition = "char(3)")
    @Size(min = 3, max = 3)
    private String blockName;//名称

    public String getBlockNo() {
        return blockNo;
    }

    public void setBlockNo(String blockNo) {
        this.blockNo = blockNo;
    }

    public String getBlockName() {
        return blockName;
    }

    public void setBlockName(String blockName) {
        this.blockName = blockName;
    }
}

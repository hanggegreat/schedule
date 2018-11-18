package cn.lollipop.schedule.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity(name = "`js1.0_zhi_wei`")
public class Job {
    @Id
    @Column(length = 2, columnDefinition = "char(2)")
    @Size(min = 2, max = 2)
    private String jobNo;

    @Column(length = 6)
    @Size(max = 6)
    private String jobName;

    public String getJobNo() {
        return jobNo;
    }

    public void setJobNo(String jobNo) {
        this.jobNo = jobNo;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    @Override
    public String toString() {
        return "Job{" +
                "jobNo='" + jobNo + '\'' +
                ", jobName='" + jobName + '\'' +
                '}';
    }
}

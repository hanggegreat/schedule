## 教务系统·排课系统
### 此次开发基于SpringBoot框架2.1.0版本，数据层采用SpringData JPA技术。
### 由于视图会带来开发的不便，本项目将不再建立视图，而是统一将Java实体与数据表进行关联。
---
## 该系统为八个不同角色提供使用，具体角色及权限信息如下：
### 角色——权限

<table>
    <thead>
      <tr>
        <th width="110px">角色</th>
        <th>权限</th>
      </tr>
    </thead>
  <tbody>
    <tr>
      <td>1.学生</td>
      <td>1.查询自己的培养方案(全部)。√<br>2.根据学年查询自己课表。</td>
    </tr>
    <tr>
      <td>2.任课教师</td>
      <td>1.根据学年查询自己的任课表。</td>
    </tr>
    <tr>
      <td>3.班主任</td>
      <td>1.查询所在班级的培养方案(全部)。√<br>2.根据学年查询所在班级的课表。</td>
    </tr>
    <tr>
      <td>4.学科组长</td>
      <td>1.查看当前学年所在年级的所有班级的该学科的课表。<br>2.查询指定年级该学科的全部教师。√<br>3.给所有班级分配(增加，修改，删除)该学科的教师。√</td>
    </tr>
    <tr>
      <td>5.年级组长</td>
      <td>1.查询所在年级的培养方案(全部)。√<br>2.根据学年查看所在年级所有班级的课表。</td>
    </tr>
    <tr>
      <td>6.教务员</td>
      <td>1.查询全部的学科信息。√<br>2.根据学科给指定届学生制定、修改、查询和删除培养方案。√<br>3.根据注册年份查询该届学生的所有培养方案。√<br>4.查询该学年指定时间指定教室的课程表信息。<br>5.查询出指定班级指定学年的任教信息，点击一键生成课表后根据任教信息即可生成未发布课表。√<br>6.微调课表(交换一个班级的某学年的两节课时间)。√<br>7.根据年级批量发布该年级所有班级当前学年课表。√<br>8.根据不同发布状态查看该学年指定年级所有班级的所有课程表（包含未发布0，已发布1，待审核2，未通过审核3）。√<br>9.根据学年查询指定班级的课表。<br>10.根据学年查询指定教师的课表。<br>11.根据学年查询指定教室的课表。</td>
    </tr>
    <tr>
      <td>7.教务主任</td>
      <td>1.批量审核培养方案（包含未通过审、已发布）。√<br>2.查询指定学年，指定年级的培养方案信息。√<br>3.根据年级查看所有班级的已发布，待审核，未通过审核的所有课程表。√<br>4.批量修改指定年级所有班级当前学年课程发布状态（包含未通过审核、已发布）。√<br>5.根据学年查询指定年级指定班级的课表。<br>6.根据学年查询指定教师的课表。<br>7.根据学年查询指定教室的课表。</td>
    </tr>
    <tr>
      <td>8.校长</td>
      <td>1.根据学年查询指定班级的课表。<br>2.根据学年查询指定教师的课表。<br>3.根据学年查询指定教室的课表。</td>
    </tr>
  </tbody>
</table>

---
###### 特别感谢爱人李醒对我生活上的帮助和工作上的支持

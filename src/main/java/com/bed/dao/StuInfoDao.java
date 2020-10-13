package com.bed.dao;

import com.bed.entity.StudentInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName StuInfoDao
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 19:50
 * @Version 1.0
 **/
@Repository
public interface StuInfoDao {
    //获取所有学生的信息
    @Select("select * from bed_stu")
    List<StudentInfo> allListStuInfo();
    //通过寝室号获取本寝室所有学生信息
    @Select("select * from bed_stu where bed_id=#{bed_id}")
    List<StudentInfo> listStuInfo(int bed_id);
    //修改一个学生个人信息
    @Update("update bed_stu set stu_id=#{stu_id},stu_name=#{stu_name},stu_gender=#{stu_gender},stu_admDate=#{stu_admDate},stu_major=#{stu_major} where stu_id=#{stu_id}")
    void changeStuInfo(StudentInfo studentInfo);
    //通过学号获取学生寝室号
    @Select("select bed_id from bed_stu where stu_id=#{stu_id}")
    Integer getBedId(String stu_id);
    //通过学号获取学生个人信息
    @Select("select * from bed_stu where stu_id=#{stu_id}")
    StudentInfo getStuInfo(String stu_id);
    //通过学号删除一个学生信息
    @Delete("delete from bed_stu where stu_id=#{stu_id}")
    void deleteStuInfo(String stu_id);
    //通过学号取消对一个学生的寝室分配
    @Update("update bed_stu set bed_id=null where stu_id=#{stu_id}")
    void unAssignStuInfo(String stu_id);
    //通过学号对学生寝室号进行修改更新
    @Update("update bed_stu set bed_id=#{bed_id} where stu_id=#{stu_id}")
    void changeBedroomId(@Param("stu_id") String stu_id,@Param("bed_id") Integer bed_id);
    //添加一个学生信息
    @Insert("insert into bed_stu values(#{stu_id},#{stu_name},#{stu_gender},#{stu_admDate},#{stu_major},null)")
    void addStuInfo(StudentInfo studentInfo);
    //获取所有学生的学号
    @Select("select stu_id from bed_stu")
    List<String> getAllStuId();
}

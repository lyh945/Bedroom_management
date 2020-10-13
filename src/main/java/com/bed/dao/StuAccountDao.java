package com.bed.dao;

import com.bed.entity.StudentAcc;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @ClassName StuLoginDao
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 16:30
 * @Version 1.0
 **/
@Repository
public interface StuAccountDao {
    //通过学号获取所有学生账户信息
    @Select("select * from stu_account where stu_id=#{stu_id}")
    StudentAcc getStudent(String stu_id);
    //通过学号修改密码
    @Update("update stu_account set stu_password=#{stu_password} where stu_id=#{stu_id}")
    StudentAcc changePassword(String stu_id);
    //删除学生账户
    @Delete("delete from stu_account where stu_id=#{stu_id}")
    void deleteStuAcc(String stu_id);
}

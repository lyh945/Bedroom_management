package com.bed.dao;

import com.bed.entity.Bedroom;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName BedroomDao
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/20 16:27
 * @Version 1.0
 **/
@Repository
public interface BedroomDao {
    //通过寝室号获取一个寝室的信息
    @Select("select * from bed_room where bed_id=#{bed_id}")
    Bedroom getBedroom(int bed_id);
    //获取所有寝室的信息
    @Select("select bed_id from bed_room")
    List<Integer> getAllBedId();
    //获取寝室总数
    @Select("select count(*) from bed_room")
    int getTotal();
    //分页显示寝室信息
    @Select("select * from bed_room order by bed_id limit #{start},#{count}")
    List<Bedroom> bed_List(@Param("start") int start, @Param("count") int count);
    //添加一个寝室
    @Insert("insert into bed_room values(#{bed_id},0,#{water_bill},#{ele_bill},#{bed_info})")
    void addBedroom(Bedroom bedroom);
    //删除一个寝室
    @Delete("delete from bed_room where bed_id=#{bed_id}")
    void deleteBedroom(int bed_id);
    //对一个寝室的信息进行修改
    @Update("update bed_room set bed_id=#{bed_id},water_bill=#{water_bill},ele_bill=#{ele_bill},bed_info=#{bed_info} where bed_id=#{bed_id}")
    void editBedroom(Bedroom bedroom);
    //获取寝室人数
    @Select("select stu_num from bed_room where bed_id=#{bed_id}")
    Integer getStuNum(Integer bed_id);
    //寝室人数加1
    @Update("update bed_room set stu_num=#{stu_num}+1 where bed_id=#{bed_id}")
    void incStuNum(@Param("stu_num") int stu_num,@Param("bed_id") Integer bed_id);
    //寝室人数减1
    @Update("update bed_room set stu_num=#{stu_num}-1 where bed_id=#{bed_id}")
    void decStuNum(@Param("stu_num") int stu_num,@Param("bed_id") Integer bed_id);
}

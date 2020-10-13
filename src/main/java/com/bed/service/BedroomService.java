package com.bed.service;

import com.bed.entity.Bedroom;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

/**
 * @ClassName BedroomService
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/20 16:40
 * @Version 1.0
 **/
public interface BedroomService {
    Bedroom getBedroom(int bed_id);

    List<Integer> getAllBedId();

    int getTotal();

    List<Bedroom> bed_List(@ModelAttribute int start, @ModelAttribute int count);

    void addBedroom(Bedroom bedroom);

    void deleteBedroom(int bed_id);

    void editBedroom(Bedroom bedroom);

    Integer getStuNum(Integer bed_id);

    void incStuNum(int stu_num,Integer bed_id);

    void decStuNum(int stu_num,Integer bed_id);
}

package com.bed.service;

import com.bed.entity.StudentInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @ClassName StuInforService
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 20:24
 * @Version 1.0
 **/
public interface StuInfoService {
    List<StudentInfo> allListStuInfo();

    List<StudentInfo> listStuInfo(int bed_id);

    Integer getBedId(String stu_id);

    StudentInfo getStuInfo(String stu_id);

    void changeStuInfo(StudentInfo studentInfo);

    void deleteStuInfo(String stu_id);

    void changeBedroomId(String stu_id,Integer bed_id);

    void addStuInfo(StudentInfo studentInfo);

    List<String> getAllStuId();
}

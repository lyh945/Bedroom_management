package com.bed.service;

import com.bed.entity.StudentAcc;

/**
 * @ClassName StuAccountService
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 16:49
 * @Version 1.0
 **/
public interface StuAccountService {

    StudentAcc getStudent(String stu_id);

    StudentAcc changeStudent(String stu_id);

    void deleteStuAcc(String stu_id);
}

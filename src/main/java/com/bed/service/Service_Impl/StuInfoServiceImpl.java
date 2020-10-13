package com.bed.service.Service_Impl;

import com.bed.dao.StuInfoDao;
import com.bed.entity.StudentInfo;
import com.bed.service.StuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName StuInfoServiceImpl
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 20:26
 * @Version 1.0
 **/
@Service
public class StuInfoServiceImpl implements StuInfoService {

    private final StuInfoDao stuInfoDao;

    @Autowired
    public StuInfoServiceImpl(StuInfoDao stuInfoDao) {
        this.stuInfoDao = stuInfoDao;
    }

    @Override
    public List<StudentInfo> allListStuInfo() {
        return stuInfoDao.allListStuInfo();
    }

    @Override
    public List<StudentInfo> listStuInfo(int bed_id) {
        return stuInfoDao.listStuInfo(bed_id);
    }

    @Override
    public Integer getBedId(String stu_id) {
        return stuInfoDao.getBedId(stu_id);
    }

    @Override
    public StudentInfo getStuInfo(String stu_id) {
        return stuInfoDao.getStuInfo(stu_id);
    }

    @Override
    public void changeStuInfo(StudentInfo studentInfo) {
        stuInfoDao.changeStuInfo(studentInfo);
    }

    @Override
    public void deleteStuInfo(String stu_id) {
        stuInfoDao.deleteStuInfo(stu_id);
    }

    @Override
    public void changeBedroomId(String stu_id,Integer bed_id) {
        stuInfoDao.changeBedroomId(stu_id,bed_id);
    }

    @Override
    public void addStuInfo(StudentInfo studentInfo) {
        stuInfoDao.addStuInfo(studentInfo);
    }

    @Override
    public List<String> getAllStuId() {
        return stuInfoDao.getAllStuId();
    }
}

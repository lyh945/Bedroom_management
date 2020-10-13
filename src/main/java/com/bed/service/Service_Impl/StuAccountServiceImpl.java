package com.bed.service.Service_Impl;

import com.bed.dao.StuAccountDao;
import com.bed.entity.StudentAcc;
import com.bed.service.StuAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName StuAccountServiceImpl
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 16:51
 * @Version 1.0
 **/
@Service
public class StuAccountServiceImpl implements StuAccountService {

    private final StuAccountDao stuAccountDao;

    @Autowired
    public StuAccountServiceImpl(StuAccountDao stuAccountDao) {
        this.stuAccountDao = stuAccountDao;
    }

    @Override
    public StudentAcc getStudent(String stu_id) {
        return stuAccountDao.getStudent(stu_id);
    }

    @Override
    public StudentAcc changeStudent(String stu_id) {
        return stuAccountDao.changePassword(stu_id);
    }

    @Override
    public void deleteStuAcc(String stu_id) {
        stuAccountDao.deleteStuAcc(stu_id);
    }
}

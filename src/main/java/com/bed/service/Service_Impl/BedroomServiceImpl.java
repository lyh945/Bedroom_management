package com.bed.service.Service_Impl;

import com.bed.dao.BedroomDao;
import com.bed.entity.Bedroom;
import com.bed.service.BedroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName BedroomServiceImp
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/20 16:44
 * @Version 1.0
 **/

@Service
public class BedroomServiceImpl implements BedroomService {

    private final BedroomDao bedroomDao;

    @Autowired
    public BedroomServiceImpl(BedroomDao bedroomDao) {
        this.bedroomDao = bedroomDao;
    }


    @Override
    public Bedroom getBedroom(int bed_id) {
        return bedroomDao.getBedroom(bed_id);
    }

    @Override
    public List<Integer> getAllBedId() {
        return bedroomDao.getAllBedId();
    }

    @Override
    public int getTotal() {
        return bedroomDao.getTotal();
    }

    @Override
    public List<Bedroom> bed_List(int start, int count) {
        return bedroomDao.bed_List(start,count);
    }

    @Override
    public void addBedroom(Bedroom bedroom) {
        bedroomDao.addBedroom(bedroom);
    }

    @Override
    public void deleteBedroom(int bed_id) {
        bedroomDao.deleteBedroom(bed_id);
    }

    @Override
    public void editBedroom(Bedroom bedroom) {
        bedroomDao.editBedroom(bedroom);
    }

    @Override
    public Integer getStuNum(Integer bed_id) {
        return bedroomDao.getStuNum(bed_id);
    }

    @Override
    public void incStuNum(int stu_num,Integer bed_id) {
        bedroomDao.incStuNum(stu_num,bed_id);
    }

    @Override
    public void decStuNum(int stu_num,Integer bed_id) {
        bedroomDao.decStuNum(stu_num,bed_id);
    }
}

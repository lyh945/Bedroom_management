package com.bed.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName StudentInfo
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 19:46
 * @Version 1.0
 **/
public class StudentInfo {
    private String stu_id;
    private String stu_name;
    private char stu_gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date stu_admDate;
    private String stu_major;
    private Integer bed_id;

    public StudentInfo() {
    }

    public StudentInfo(String stu_id, String stu_name, char stu_gender, Date stu_admDate, String stu_major, Integer bed_id) {
        this.stu_id = stu_id;
        this.stu_name = stu_name;
        this.stu_gender = stu_gender;
        this.stu_admDate = stu_admDate;
        this.stu_major = stu_major;
        this.bed_id = bed_id;
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public char getStu_gender() {
        return stu_gender;
    }

    public void setStu_gender(char stu_gender) {
        this.stu_gender = stu_gender;
    }

    public Date getStu_admDate() {
        return stu_admDate;
    }

    public void setStu_admDate(Date stu_admDate) {
        this.stu_admDate = stu_admDate;
    }

    public String getStu_major() {
        return stu_major;
    }

    public void setStu_major(String stu_major) {
        this.stu_major = stu_major;
    }

    public Integer getBed_id() {
        return bed_id;
    }

    public void setBed_id(Integer bed_id) {
        this.bed_id = bed_id;
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "stu_id=" + stu_id +
                ", stu_name='" + stu_name + '\'' +
                ", stu_gender=" + stu_gender +
                ", stu_admDate=" + stu_admDate +
                ", stu_major='" + stu_major + '\'' +
                ", bed_id=" + bed_id +
                '}';
    }
}

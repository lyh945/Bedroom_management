package com.bed.entity;

/**
 * @ClassName Student
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 16:32
 * @Version 1.0
 **/
public class StudentAcc {
    private Integer id;
    private String stu_id;
    private String stu_password;

    public StudentAcc() {
    }

    public StudentAcc(String stu_id, String stu_password) {
        this.stu_id = stu_id;
        this.stu_password = stu_password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_password() {
        return stu_password;
    }

    public void setStu_password(String stu_password) {
        this.stu_password = stu_password;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", stu_id=" + stu_id +
                ", stu_password='" + stu_password + '\'' +
                '}';
    }
}

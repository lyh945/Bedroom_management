package com.bed.entity;

/**
 * @ClassName Bedroom
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/20 16:24
 * @Version 1.0
 **/
public class Bedroom {
    private Integer bed_id;
    private Integer stu_num;
    private Double water_bill;
    private Double ele_bill;
    private String bed_info;

    public Bedroom() {
    }

    public Bedroom(Integer bed_id, Integer stu_num, Double water_bill, Double ele_bill, String bed_info) {
        this.bed_id = bed_id;
        this.stu_num = stu_num;
        this.water_bill = water_bill;
        this.ele_bill = ele_bill;
        this.bed_info = bed_info;
    }

    public Integer getBed_id() {
        return bed_id;
    }

    public void setBed_id(Integer bed_id) {
        this.bed_id = bed_id;
    }

    public Integer getStu_num() {
        return stu_num;
    }

    public void setStu_num(Integer stu_num) {
        this.stu_num = stu_num;
    }

    public Double getWater_bill() {
        return water_bill;
    }

    public void setWater_bill(Double water_bill) {
        this.water_bill = water_bill;
    }

    public Double getEle_bill() {
        return ele_bill;
    }

    public void setEle_bill(Double ele_bill) {
        this.ele_bill = ele_bill;
    }

    public String getBed_info() {
        return bed_info;
    }

    public void setBed_info(String bed_info) {
        this.bed_info = bed_info;
    }

    @Override
    public String toString() {
        return "Bedroom{" +
                "bed_id=" + bed_id +
                ", stu_num=" + stu_num +
                ", water_bill=" + water_bill +
                ", ele_bill=" + ele_bill +
                ", bed_info='" + bed_info + '\'' +
                '}';
    }
}

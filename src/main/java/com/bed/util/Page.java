package com.bed.util;

/**
 * @ClassName Page
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/21 10:03
 * @Version 1.0
 **/
public class Page {
    private Integer start;
    private Integer count;
    private Integer total;

    public Page() {
    }

    public Page(Integer start, Integer count) {
        this.start = start;
        this.count = count;
    }

    public Page(Integer start, Integer count, Integer total) {
        this.start = start;
        this.count = count;
        this.total = total;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Page{" +
                "start=" + start +
                ", count=" + count +
                ", total=" + total +
                '}';
    }

}

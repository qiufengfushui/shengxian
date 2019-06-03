package cn.zxt.shengxian.pojo;

import java.sql.Date;

public class Shopping {
    private int sId;
    private int uId;
    private int pId;
    private int pCount;
    private Date sDateTime;
    private Product product;

    public Shopping() {
    }

    public Shopping(int sId, int uId, int pId, int pCount, Date sDateTime, Product product) {
        this.sId = sId;
        this.uId = uId;
        this.pId = pId;
        this.pCount = pCount;
        this.sDateTime = sDateTime;
        this.product = product;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getpCount() {
        return pCount;
    }

    public void setpCount(int pCount) {
        this.pCount = pCount;
    }

    public Date getsDateTime() {
        return sDateTime;
    }

    public void setsDateTime(Date sDateTime) {
        this.sDateTime = sDateTime;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Shopping{" +
                "sId=" + sId +
                ", uId=" + uId +
                ", pId=" + pId +
                ", pCount=" + pCount +
                ", sDateTime=" + sDateTime +
                ", product=" + product +
                '}';
    }
}

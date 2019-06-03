package cn.zxt.shengxian.pojo;

import java.util.Date;
import java.util.List;

public class Order {
    private int oid;
    private long oiId;
    private int uId;
    private Date dateTime; //下单时间
    private double total; //合计
    // 订单状态（四种）
    private int state; //1.未付款、2.付款未发货、3.发货未收货、4.交易成功
    private User owner; //订单所有者
    private String address; //收获地址
    private List<OrderItem> orderItemList; //当前订单下所有商品条目

    public Order() {
    }

    public Order(long oiId, int uId, double total, int state) {
        this.oiId = oiId;
        this.uId = uId;
        this.total = total;
        this.state = state;
    }

    public Order(int oid, long oiId, int uId, Date dateTime, double total, int state, User owner, String address, List<OrderItem> orderItemList) {
        this.oid = oid;
        this.oiId = oiId;
        this.uId = uId;
        this.dateTime = dateTime;
        this.total = total;
        this.state = state;
        this.owner = owner;
        this.address = address;
        this.orderItemList = orderItemList;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public long getOiId() {
        return oiId;
    }

    public void setOiId(long oiId) {
        this.oiId = oiId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid=" + oid +
                ", oiId=" + oiId +
                ", uId=" + uId +
                ", dateTime=" + dateTime +
                ", total=" + total +
                ", state=" + state +
                ", owner=" + owner +
                ", address='" + address + '\'' +
                ", orderItemList=" + orderItemList +
                '}';
    }
}

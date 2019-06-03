package cn.zxt.shengxian.pojo;


public class OrderItem {
    private long oiId;
    private int oipId;                      //购买的商品编号
    private int oipCount;                   //购买的商品数量
    private int oipUnitPrice;               //购买的商品单价
    private Product product;                //购买的商品信息

    public OrderItem() {
    }

    public OrderItem(long oiId, int oipId, int oipCount, int oipUnitPrice, Product product) {
        this.oiId = oiId;
        this.oipId = oipId;
        this.oipCount = oipCount;
        this.oipUnitPrice = oipUnitPrice;
        this.product = product;
    }

    public long getOiId() {
        return oiId;
    }

    public void setOiId(long oiId) {
        this.oiId = oiId;
    }

    public int getOipId() {
        return oipId;
    }

    public void setOipId(int oipId) {
        this.oipId = oipId;
    }

    public int getOipCount() {
        return oipCount;
    }

    public void setOipCount(int oipCount) {
        this.oipCount = oipCount;
    }

    public int getOipUnitPrice() {
        return oipUnitPrice;
    }

    public void setOipUnitPrice(int oipUnitPrice) {
        this.oipUnitPrice = oipUnitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "oiId=" + oiId +
                ", oipId=" + oipId +
                ", oipCount=" + oipCount +
                ", oipUnitPrice=" + oipUnitPrice +
                ", product=" + product +
                '}';
    }
}

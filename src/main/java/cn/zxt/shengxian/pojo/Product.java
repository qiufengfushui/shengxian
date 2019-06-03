package cn.zxt.shengxian.pojo;

public class Product {
    private int pId;
    private String pName;
    private int pType;
    private double pUnitPrice;
    private String pDesc;
    private String pImage;
    private int pUnit;
    private String pBigImage;
    private String pTitle;
    private ProductType productType;

    public Product() {
    }

    public Product(int pId, String pName, int pType, double pUnitPrice, String pDesc, String pImage, int pUnit, String pBigImage, String pTitle, ProductType productType) {
        this.pId = pId;
        this.pName = pName;
        this.pType = pType;
        this.pUnitPrice = pUnitPrice;
        this.pDesc = pDesc;
        this.pImage = pImage;
        this.pUnit = pUnit;
        this.pBigImage = pBigImage;
        this.pTitle = pTitle;
        this.productType = productType;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getpType() {
        return pType;
    }

    public void setpType(int pType) {
        this.pType = pType;
    }

    public double getpUnitPrice() {
        return pUnitPrice;
    }

    public void setpUnitPrice(double pUnitPrice) {
        this.pUnitPrice = pUnitPrice;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public int getpUnit() {
        return pUnit;
    }

    public void setpUnit(int pUnit) {
        this.pUnit = pUnit;
    }

    public String getpBigImage() {
        return pBigImage;
    }

    public void setpBigImage(String pBigImage) {
        this.pBigImage = pBigImage;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId=" + pId +
                ", pName='" + pName + '\'' +
                ", pType=" + pType +
                ", pUnitPrice=" + pUnitPrice +
                ", pDesc='" + pDesc + '\'' +
                ", pImage='" + pImage + '\'' +
                ", pUnit=" + pUnit +
                ", pBigImage='" + pBigImage + '\'' +
                ", pTitle='" + pTitle + '\'' +
                ", productType=" + productType +
                '}';
    }
}

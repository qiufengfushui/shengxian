package cn.zxt.shengxian.pojo;

public class ProductType {
    private int ptId;
    private String ptImage;
    private String ptName;

    public ProductType() {
    }

    public ProductType(int ptId, String ptImage, String ptName) {
        this.ptId = ptId;
        this.ptImage = ptImage;
        this.ptName = ptName;
    }

    public int getPtId() {
        return ptId;
    }

    public void setPtId(int ptId) {
        this.ptId = ptId;
    }

    public String getPtImage() {
        return ptImage;
    }

    public void setPtImage(String ptImage) {
        this.ptImage = ptImage;
    }

    public String getPtName() {
        return ptName;
    }

    public void setPtName(String ptName) {
        this.ptName = ptName;
    }

    @Override
    public String toString() {
        return "ProductType{" +
                "ptId=" + ptId +
                ", ptImage='" + ptImage + '\'' +
                ", ptName='" + ptName + '\'' +
                '}';
    }
}

package cn.zxt.shengxian.pojo;

public class Address {
    private int aId;
    private int uId;
    private String aName;
    private String zipCode;
    private String phone;
    private String aAddress;
    private int status;

    public Address() {
    }

    public Address(int aId, int uId, String aName, String zipCode, String phone, String aAddress, int status) {
        this.aId = aId;
        this.uId = uId;
        this.aName = aName;
        this.zipCode = zipCode;
        this.phone = phone;
        this.aAddress = aAddress;
        this.status = status;
    }

    public int getaId() {
        return aId;
    }

    public void setaId(int aId) {
        this.aId = aId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getaAddress() {
        return aAddress;
    }

    public void setaAddress(String aAddress) {
        this.aAddress = aAddress;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Address{" +
                "aId=" + aId +
                ", uId=" + uId +
                ", aName='" + aName + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", phone='" + phone + '\'' +
                ", aAddress='" + aAddress + '\'' +
                ", status=" + status +
                '}';
    }
}

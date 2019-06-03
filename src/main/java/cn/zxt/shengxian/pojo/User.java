package cn.zxt.shengxian.pojo;

public class User {
    private int userId;
    private String userName;
    private String userPwd;
    private String userEmail;
    private String userPhone;
    private String userAddress;

    public User() {
    }
    public User(int userId, String userName, String userPwd, String userEmail) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userEmail = userEmail;
    }
    public User(int userId, String userName, String userPwd, String userEmail, String userPhone, String userAddress) {
        this.userId = userId;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userAddress='" + userAddress + '\'' +
                '}';
    }
}

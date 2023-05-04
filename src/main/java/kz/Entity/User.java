package kz.Entity;

public class User {

    int id;
    String email;
    String password;
    String fullName;

    boolean isAdmin;

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public User(){}

    public User(int id, String email, String password, String fullName,boolean isAdmin) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.isAdmin = isAdmin;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getFullName() {
        return fullName;
    }
}

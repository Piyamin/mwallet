package com.api.mwallet.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import java.util.Objects;
@Entity
@Table(name = "mwallet_user")
public class UserManage {
    private @Id @GeneratedValue Integer user_id;
    private @NotBlank String user_name;
    private @NotBlank String user_password;
    private @NotBlank boolean loggedIn;
    public UserManage() {
    }
    public UserManage(@NotBlank String user_name, 
                @NotBlank String user_password) {
        this.user_name = user_name;
        this.user_password = user_password;
        this.loggedIn = false;
    }
    public long getUser_id() {
        return user_id;
    }
    public String getUser_name() {
        return user_name;
    }
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getUser_password() {
        return user_password;
    }
    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }
    public boolean isLoggedIn() {
        return loggedIn;
    }
    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return Objects.equals(user_name, user.user_name) &&
                Objects.equals(user_password, user.user_password);
    }
    @Override
    public int hashCode() {
        return Objects.hash(user_id, user_name, user_password, 
                            loggedIn);
    }
    @Override
    public String toString() {
        return "User{" +
                "id=" + user_id +
                ", username='" + user_name + '\'' +
                ", password='" + user_password + '\'' +
                ", loggedIn=" + loggedIn +
                '}';
    }
}
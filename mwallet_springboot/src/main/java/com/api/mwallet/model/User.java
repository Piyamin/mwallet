package com.api.mwallet.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name = "mwallet_user")
public class User {
        @Id
        @GeneratedValue
        private int user_id;
        @NotBlank
        private String first_name;
        @NotBlank
        private String last_name;
        private String user_address;
        private String user_phone;
        private String user_name;
        private String user_password;
    public User() {
        super();
    }

    public User(int user_id, String first_name, String last_name, String user_address, String user_phone, String user_name, String user_password ) {
        super();
        this.user_id = user_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.user_address = user_address;
        this.user_phone = user_phone;
        this.user_name = user_name;
        this.user_password = user_password;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getuser_id() {
        return user_id;
    }

    public void setuser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

}

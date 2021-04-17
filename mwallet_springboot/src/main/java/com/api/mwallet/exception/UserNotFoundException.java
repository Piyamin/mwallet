package com.api.mwallet.exception;

public class UserNotFoundException extends Exception {
    private int user_id;
    public UserNotFoundException(int user_id){
        super(String.format("User is not found with id : '%d'",user_id));
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}

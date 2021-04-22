package com.api.mwallet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.api.mwallet.exception.Status;
// import com.api.mwallet.model.User;
import com.api.mwallet.model.UserManage;
import com.api.mwallet.repository.UserManageRepository;

import java.util.List;
@RestController
public class UserManageController {
    @Autowired
    UserManageRepository userManageRepository;
    @PostMapping("/register")
    public Status registerUser(@Valid @RequestBody UserManage newUser) {
        List<UserManage> users = userManageRepository.findAll();
        System.out.println("New user: " + newUser.toString());
        for (UserManage userManage : users) {
            System.out.println("Registered user: " + newUser.toString());
            if (userManage.equals(newUser)) {
                System.out.println("User Already exists!");
                return Status.USER_ALREADY_EXISTS;
            }
        }
        userManageRepository.save(newUser);
        return Status.SUCCESS;
    }
    @PostMapping("/login")
    public Status loginUser(@Valid @RequestBody UserManage userManage) {
        List<UserManage> users = userManageRepository.findAll();
        for (UserManage other : users) {
            if (other.equals(userManage)) {
                userManage.setLoggedIn(true);
                userManageRepository.save(userManage);
                return Status.SUCCESS;
            }
        }
        return Status.FAILURE;
    }
    @PostMapping("/logout")
    public Status logUserOut(@Valid @RequestBody UserManage userManage) {
        List<UserManage> users = userManageRepository.findAll();
        for (UserManage other : users) {
            if (other.equals(userManage)) {
                userManage.setLoggedIn(false);
                userManageRepository.save(userManage);
                return Status.SUCCESS;
            }
        }
        return Status.FAILURE;
    }
    @DeleteMapping("/users/all")
    public Status deleteUsers() {
        userManageRepository.deleteAll();
        return Status.SUCCESS;
    }
}

package com.api.mwallet.controller;

// import com.api.mwallet.exception.Status;
import com.api.mwallet.exception.UserNotFoundException;
import com.api.mwallet.model.User;
import com.api.mwallet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import javax.validation.Valid;

import java.math.BigDecimal;
import java.util.NoSuchElementException;
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    UserService userService;

// Get All 

    @GetMapping("")
    public Iterable<User> list() {
        return userService.listAllUser();
    }

// creat a new user
    @PostMapping("/")
    public void add(@Valid @RequestBody User user) {
        userService.saveUser(user);
    }

// Get  a Single User
    @GetMapping("/{id}")
    public ResponseEntity<User> get(@PathVariable Integer id) {
        try {
            User user = userService.getUser(id);
            return new ResponseEntity<User>(user, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
    }
// update 
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<User> updateUser_whenPutUser(@RequestBody User user, @PathVariable Integer id) throws UserNotFoundException {
        return ResponseEntity.ok().body(userService.updateUser(id,user));
    }
//delete 
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {

        userService.deleteUser(id);
    }
    
    //  findby name
    @GetMapping("/maxid")
    public BigDecimal getMaxid() {
            BigDecimal user = userService.getMaxid();
            return user;
    }
    
    @GetMapping("/username")
    public String getUser_name() {
            String user = userService.getUserName();
            return user;
    }

}
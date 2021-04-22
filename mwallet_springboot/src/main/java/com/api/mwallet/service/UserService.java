package com.api.mwallet.service;

import com.api.mwallet.exception.UserNotFoundException;
import com.api.mwallet.model.User;
import com.api.mwallet.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import javax.transaction.Transactional;

@Service
@Transactional
public class UserService  {
    @Autowired
    UserRepository userRepository;

    public Iterable<User> listAllUser() {
        return userRepository.findAll();
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public User getUser(Integer id) {
        return userRepository.findById(id).get();
    }

    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    public User updateUser(Integer id, User user) throws UserNotFoundException {
        Optional<User> userOptional = userRepository.findById(id);
        if (!userOptional.isPresent()) {
            throw new UserNotFoundException(id);
        } else {
            userRepository.findById(id);
            return userRepository.save(user);
        }
    }

}
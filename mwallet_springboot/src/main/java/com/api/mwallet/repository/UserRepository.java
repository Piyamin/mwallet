package com.api.mwallet.repository;

import com.api.mwallet.model.User;

import org.springframework.data.jpa.repository.JpaRepository;
// import org.springframework.stereotype.Repository;
// @Repository
public interface UserRepository extends JpaRepository<User, Integer> {
}
package com.api.mwallet.repository;

import com.api.mwallet.model.UserManage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserManageRepository extends JpaRepository<UserManage, Integer> {

}
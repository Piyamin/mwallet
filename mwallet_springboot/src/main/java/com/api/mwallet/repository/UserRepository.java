package com.api.mwallet.repository;

import java.math.BigDecimal;
// import java.util.List;

import com.api.mwallet.model.User;
// import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
    @Query(value = "SELECT max(user_id) FROM User ")
	public BigDecimal max();
    @Query(value = "SELECT user_id FROM User WHERE user_name = 'Piya' ")
    public String findByUser_name();
}
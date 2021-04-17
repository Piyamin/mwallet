package com.api.mwallet.repository;

import com.api.mwallet.model.Transection;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransectionRepository extends JpaRepository<Transection, Integer> {
}
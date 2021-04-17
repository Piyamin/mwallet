package com.api.mwallet.repository;

import com.api.mwallet.model.WalletList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WalletListRepository extends JpaRepository<WalletList, Integer> {
}
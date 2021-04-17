package com.api.mwallet.service;

import com.api.mwallet.exception.UserNotFoundException;
import com.api.mwallet.model.WalletList;
import com.api.mwallet.model.Transection;
import com.api.mwallet.repository.WalletListRepository;
import com.api.mwallet.repository.TransectionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
@Service
@Transactional
public class WalletListService {
    @Autowired
    WalletListRepository walletListRepository;

    public List<WalletList> listAllWalletList() {
        return walletListRepository.findAll();
    }

    public void saveWallet(WalletList walletList) {
        walletListRepository.save(walletList);
    }

    public WalletList getWalletList(Integer id) {
        return walletListRepository.findById(id).get();
    }

    public void deleteWalletList(Integer id) {
        walletListRepository.deleteById(id);
    }
    public WalletList updateWalletList(Integer id, WalletList walletList) throws UserNotFoundException {
        Optional<WalletList> walletListOptional = walletListRepository.findById(id);
        if (!walletListOptional.isPresent()) {
            throw new UserNotFoundException(id);
        } else {
            walletListRepository.findById(id);
            return walletListRepository.save(walletList);
        }
    }
    
    // Transection start
    @Autowired
    TransectionRepository transectionRepository;
    public List<Transection> listAllTransection() {
        return transectionRepository.findAll();
    }

    public void saveTransection(Transection transection) {
        transectionRepository.save(transection);
    }

    public Transection getTransection(Integer id) {
        return transectionRepository.findById(id).get();
    }

    public void deleteTransection(Integer id) {
        transectionRepository.deleteById(id);
    }
    public Transection updateTransection(Integer id, Transection Transection) throws UserNotFoundException {
        Optional<Transection> TransectionOptional = transectionRepository.findById(id);
        if (!TransectionOptional.isPresent()) {
            throw new UserNotFoundException(id);
        } else {
            transectionRepository.findById(id);
            return transectionRepository.save(Transection);
        }
    }
   



}
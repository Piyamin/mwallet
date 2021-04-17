package com.api.mwallet.controller;

import com.api.mwallet.exception.UserNotFoundException;
import com.api.mwallet.model.WalletList;
import com.api.mwallet.model.Transection;
import com.api.mwallet.service.WalletListService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import javax.validation.Valid;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/wallet")
public class WalletListController {
    @Autowired
    WalletListService walletListService;

// Get All 

    @GetMapping("")
    public List<WalletList> list() {
        return walletListService.listAllWalletList();
    }

// creat a new user
    @PostMapping("/")
    public void add(@Valid @RequestBody WalletList walletList) {
        walletListService.saveWallet(walletList);
    }

// Get  a Single User
    @GetMapping("/{id}")
    public ResponseEntity<WalletList> get(@PathVariable Integer id) {
        try {
            WalletList walletList = walletListService.getWalletList(id);
            return new ResponseEntity<WalletList>(walletList, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<WalletList>(HttpStatus.NOT_FOUND);
        }
    }
// update 
    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<WalletList> updateWalletList_whenPutWalletList(@RequestBody WalletList walletList, @PathVariable Integer id) throws UserNotFoundException {
        return ResponseEntity.ok().body(walletListService.updateWalletList(id,walletList));
    }
//delete 
    @DeleteMapping("/{id}")
    public void deleteWalletList(@PathVariable Integer id) {

        walletListService.deleteWalletList(id);
    }

// Transection start
    // Get All 

    @GetMapping("/transection")
    public List<Transection> listTransection(){
        return walletListService.listAllTransection();
    }

    // creat a new user
    @PostMapping("/transection")
    public void addTransection(@Valid @RequestBody Transection transection) {
        walletListService.saveTransection(transection);
    }

    // Get  a Single User
    @GetMapping("/transection/{id}")
    public ResponseEntity<Transection> getTransection(@PathVariable Integer id) {
        try {
            Transection transection = walletListService.getTransection(id);
            return new ResponseEntity<Transection>(transection, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Transection>(HttpStatus.NOT_FOUND);
        }
    }
    // update 
    @PutMapping("/transection/{id}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<Transection> updateTransection_whenPutTransection(@RequestBody Transection transection, @PathVariable Integer id) throws UserNotFoundException {
        return ResponseEntity.ok().body(walletListService.updateTransection(id,transection));
    }
    //delete 
    @DeleteMapping("/transection/{id}")
    public void deleteTransection(@PathVariable Integer id) {
        walletListService.deleteTransection(id);
    }



}
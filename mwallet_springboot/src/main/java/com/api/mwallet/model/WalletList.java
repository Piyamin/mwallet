package com.api.mwallet.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name = "mwallet_wallet_list")
public class WalletList {
        @Id
        @GeneratedValue
        private int wallet_list_id;
        @NotBlank
        private Double wallet_list_amount;
        @NotBlank
        private int user_id;
    public WalletList() {
        super();
    }

    public WalletList(int wallet_list_id,Double wallet_list_amount,int user_id) {
        super();
        this.wallet_list_id = wallet_list_id;
        this.wallet_list_amount = wallet_list_amount;
        this.user_id = user_id;

    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getWallet_list_id() {
        return wallet_list_id;
    }
    public void setWallet_list_id(int wallet_list_id) {
        this.wallet_list_id = wallet_list_id;
    }
    public Double getWallet_list_amount() {
        return wallet_list_amount;
    }
    public void setWallet_list_amount(Double wallet_list_amount) {
        this.wallet_list_amount = wallet_list_amount;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

}

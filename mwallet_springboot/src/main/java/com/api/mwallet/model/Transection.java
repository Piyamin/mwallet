package com.api.mwallet.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name = "mwallet_transection")
public class Transection {
        @Id
        @GeneratedValue
        private int transection_id;
        @NotBlank
        private String transection_receiver;
        private String transection_datetime;
        private String user_id;
        private String wallet_list_id;
        private String transection_description;
        private String financial_id;
        private String transection_amount;
    public Transection() {
        super();
    }
  
    public Transection(int transection_id, String transection_receiver, String transection_datetime, String user_id, String wallet_list_id, String transection_description, String financial_id, String transection_amount) {
        super();
        this.transection_id = transection_id;
        this.wallet_list_id = wallet_list_id;
        this.transection_amount = transection_amount;
        this.financial_id = financial_id;
        this.transection_description = transection_description;
        this.user_id = user_id;
        this.transection_datetime = transection_datetime;
        this.transection_receiver = transection_receiver;


       

    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTransection_id() {
        return transection_id;
    }
    public void setTransection_id(int transection_id) {
        this.transection_id = transection_id;
        
    }
  
    public String getTransection_amount() {
        return transection_amount;
    }

    public void setTransection_amount(String transection_amount) {
        this.transection_amount = transection_amount;
    }

    public String getFinancial_id() {
        return financial_id;
    }

    public void setFinancial_id(String financial_id) {
        this.financial_id = financial_id;
    }

    public String getTransection_description() {
        return transection_description;
    }

    public void setTransection_description(String transection_description) {
        this.transection_description = transection_description;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTransection_datetime() {
        return transection_datetime;
    }

    public void setTransection_datetime(String transection_datetime) {
        this.transection_datetime = transection_datetime;
    }

    public String getTransection_receiver() {
        return transection_receiver;
    }

    public void setTransection_receiver(String transection_receiver) {
        this.transection_receiver = transection_receiver;
    }
    public String getWallet_list_id() {
        return wallet_list_id;
    }
    public void setWallet_list_id(String wallet_list_id) {
        this.wallet_list_id = wallet_list_id;
    }

    

}

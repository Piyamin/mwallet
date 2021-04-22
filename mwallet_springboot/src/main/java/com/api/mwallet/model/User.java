package com.api.mwallet.model;

// import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Entity
@Data
@Table(name = "mwallet_user")
public class User {
        @Id
        @GeneratedValue
        public Integer user_id;

        public String first_name;
        public String last_name;
        @NotBlank
        public String user_name;
        @NotBlank
        public String user_password;
}

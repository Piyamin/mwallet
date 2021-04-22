package com.api.mwallet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@CrossOrigin 
public class MwalletApplication {

	public static void main(String[] args) {
		SpringApplication.run(MwalletApplication.class, args);
	}

}

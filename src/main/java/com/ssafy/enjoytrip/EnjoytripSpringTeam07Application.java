package com.ssafy.enjoytrip;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ssafy"})
public class EnjoytripSpringTeam07Application {

	public static void main(String[] args) {
		SpringApplication.run(EnjoytripSpringTeam07Application.class, args);
	}

}

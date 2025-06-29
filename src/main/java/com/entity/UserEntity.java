package com.entity;

import java.time.LocalDate;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)

public class UserEntity 
{
	Integer userid;
	String firstname;
	String lastname;
	String email;
	String password;
	String gender;
	String role = "USER";
	LocalDate createdAt = LocalDate.now();
	String profilePicPath;
}

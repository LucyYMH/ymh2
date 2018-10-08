package com.hpe.service;

import java.util.List;

import com.hpe.pojo.User;
public interface UserService {

	User login(String username, String pwd);

	List<User> selectAll(User u);

	int addUser(User user);

	int delAll(String[] ids);
	
}

package com.hpe.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.hpe.mapper.UserMapper;
import com.hpe.pojo.User;
import com.hpe.service.UserService;
@Service
public class UserServiceimpl implements UserService {
@Autowired
private UserMapper userMapper;
	@Override
	public User login(String username, String pwd) {
		// TODO Auto-generated method stub
		User user=new User();
		user.setUsername(username);
		user.setPwd(pwd);
		 User user2 = userMapper.selectOne(user);
		return user2;
	}
	@Override
	public List<User> selectAll(User user) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Example example=new Example(User.class);
		Criteria createCriteria = example.createCriteria();
		if(user.getUsername()!=null && !"".equals(user.getUsername())){
		createCriteria.andLike("username", "%"+user.getUsername()+"%");
		} 
		if(user.getSex()!=null &&!"".equals(user.getSex())){
			createCriteria.andEqualTo("sex", user.getSex());
		}
		if(user.getAddress()!=null && !"".equals(user.getAddress())){
			createCriteria.andLike("address", "%"+user.getAddress()+"%");
		}
		if(user.getCreateDate()!=null && !"".equals(user.getCreateDate())){
			createCriteria.andLike("createDate", "%"+user.getCreateDate()+"%");
		}
		List<User> userList = userMapper.selectByExample(example);
		//List<User> userList = userMapper.select(user);
		return userList;
	}
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		int selective = userMapper.insertSelective(user);
		return selective;
	}
	@Override
	public int delAll(String[] ids) {
		int i=0;
		Example example=new Example(User.class);
		Criteria createCriteria = example.createCriteria();
		List<Object> idlist=new ArrayList<>();
		for(String id:ids){
			idlist.add(id);
		}
		 createCriteria.andIn("id", idlist);
		i = userMapper.deleteByExample(example);
		return i;
	}
	
}

package com.hpe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.hpe.pojo.User;
import com.hpe.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="login")
	//�û���¼�ķ���
	public ModelAndView login(String username, String pwd,HttpServletRequest request,HttpServletResponse response){
		User user=userService.login(username,pwd);
		ModelAndView mv=new ModelAndView();
		HttpSession session = request.getSession();
		User u=new User();
		if(user!=null){
			//���user��Ϊ�գ���¼�ɹ�,��ѯ���е��û�
			session.setAttribute("user", user);
			List<User> list=userService.selectAll(u);
			System.err.println(list);
			//�����ݷŵ�mv��
			//mv.addObject(list);
			mv.addObject("list", list);
			mv.setViewName("/user/list.jsp");
		}else{
			//��¼ʧ��
			mv.addObject("��¼ʧ��");
			mv.setViewName("/index.jsp");
		}
		return mv;
		}
	//��ѯ�û��ķ���
	@RequestMapping("select")
	public String selectUsers(User user,Model model){
		//System.err.println(user);
		List<User> list=userService.selectAll(user);
		model.addAttribute("list", list);
		System.err.println(list);
		return "/user/list.jsp";
		
	}
	//����û��ķ���
	@RequestMapping("add")
	public String addUser(User user){
		//���÷���
		int res=userService.addUser(user);
		if(res==0){
			return "add.jsp";
		}
		//User u=new User();
		return "/user/select";
	}
	//����ɾ���û��ķ���
	@RequestMapping("deleAll")
	@ResponseBody
	public String delAll(@RequestParam(value="ids[]")String[] ids){
		//System.err.println(ids[0]);
		int res=userService.delAll(ids);
		JSONObject json=new JSONObject();
		if(res>0){
		json.put("res", 1);
		}else{
			json.put("res", 0);
		}
		return json.toJSONString();
	}
}

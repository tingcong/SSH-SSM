package com.myssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.myssm.bean.Employee;
import com.myssm.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping("/form")
	public String loginForm() {
		return "/login";
	}

	@RequestMapping("/confirm")
	public @ResponseBody
	Employee confirm(String username, String password) {
		return loginService.getEmployee(username, password);
	}

	@RequestMapping("/mng_stu")
	public String toMngStu() {
		return "/mng_stu";
	}

}

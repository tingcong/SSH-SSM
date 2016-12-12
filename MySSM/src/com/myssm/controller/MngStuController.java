package com.myssm.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myssm.bean.PreStudent;
import com.myssm.service.MngStuService;

@Controller
@RequestMapping("/mng_stu")
public class MngStuController {

	@Autowired
	private MngStuService mngStuService;

	@RequestMapping("/view")
	public @ResponseBody
	List<PreStudent> getListStudent() {
		return mngStuService.getListStudent();
	}

	@RequestMapping("/add")
	public String toAddStu() {
		return "/add_stu";
	}

	@RequestMapping("/cmtadd")
	public @ResponseBody
	String cmtAdd(PreStudent stu) {
		mngStuService.InsertStu(stu);
		return "ok";
	}

	@RequestMapping("/cmtdel")
	public @ResponseBody
	String cmtDel(String ids) {
		mngStuService.DelStu(Arrays.asList(ids.split(",")));
		return "ok";
	}

	@RequestMapping("/up")
	public String toUpStu(String id, Model model) {
		model.addAttribute("stu", mngStuService.getStudent(id));
		return "/up_stu";
	}

	@RequestMapping("/cmtup")
	public @ResponseBody
	String cmtUpdate(PreStudent stu) {
		mngStuService.UpdateStu(stu);
		return "ok";
	}

}

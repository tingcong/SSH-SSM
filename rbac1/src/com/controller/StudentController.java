package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.Lishi;
import com.bean.Students;
import com.service.LibraryService;

@Controller
@RequestMapping("/show")
public class StudentController  extends BaseController{

	@Autowired
	private LibraryService libraryService;
	
	@RequestMapping("/home")
	public String getlist(Model model){
		System.out.println("进入student");
		List<Students> list= libraryService.getlist();
		model.addAttribute("list",list);
		return "/student";
	}
	@RequestMapping("/random")
	public void getrandom(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException{
		System.out.println("进入random");
		Students list= libraryService.getradom();
		//System.out.println(id+name);
		int id = 0;
		String name = null;
	
			id=list.getId();
			name=list.getName();

		System.out.println(id+name);
		libraryService.add(null, id, name);
		super.printJSON(list, req, rsp);
	}
	@RequestMapping("/lishi")
	public String getlishi(Model model)
			throws IOException{
		System.out.println("进入lishi");
		List<Lishi> list= libraryService.getlishi();
		model.addAttribute("list",list);
		return "/lishi";
	}
	@RequestMapping("/tongji")
	public void gettongji(HttpServletRequest req, HttpServletResponse rsp)
			throws IOException{
		System.out.println("进入tongji");
		List list= libraryService.gettongji();
		//System.out.println(list);
		super.printJSON(list, req, rsp);
	}
}

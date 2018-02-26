package com.data.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.data.util.*;

@Controller
@RequestMapping("/index")
public class IndexController {

	
	@RequestMapping("/test")
	public void test(){
		
		
		System.out.print("test!!!");
		
	}
	
	
	
	@RequestMapping("/abc")
	public String abc(){
		
		
		
		return "index/abc";
	}
	
	
	@RequestMapping("/bbb")
	public String bbb(HttpServletRequest ret, HttpServletResponse req, Model model){
		
		String str = common.getstr("tangmeicun");
		model.addAttribute("str", str);
		
 
 
 
		String id = ret.getParameter("id");
		model.addAttribute("id", id);
		
		
		return "index/bbb";
	}
	
}

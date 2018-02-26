package com.data.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/abc")
public class abcController {

	
	@RequestMapping("/index")
	public String index(HttpServletRequest req, HttpServletResponse res, Model model) throws UnsupportedEncodingException
	{
//		req.setCharacterEncoding("UTF-8");
//		res.setCharacterEncoding("UTF-8");
		System.out.println("---------------"+req.getParameter("name"));
 
		String str = new String(req.getParameter("name").getBytes("iso-8859-1"), "utf-8");  
		System.out.println("==-----"+str);
		
		return null;
	}
}

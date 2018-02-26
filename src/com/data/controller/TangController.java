package com.data.controller;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.data.model.Student;
import com.data.service.SildeCatService;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
 
 
/*
 * */
@Controller
@RequestMapping("/tang")
public class TangController {

	private static final String URL="jdbc:mysql://192.168.2.190:3306/test";
	private static final String USER="root";
	private static final String PWD="123456";
	
	@RequestMapping("/list")
	public String list(Model model) throws Exception{
		//1����
		Class.forName("com.mysql.jdbc.Driver");
		//2����
		Connection conn=(Connection) DriverManager.getConnection(URL,USER,PWD);
		//3����
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,age from student");
		
		List<Student> studentlist = new ArrayList<Student>();
		while(rs.next()){
			Student student = new Student();
			student.setId(rs.getInt("id"));
			student.setName(rs.getString("name"));
			student.setAge(rs.getInt("age"));
			studentlist.add(student);
		}
 
		model.addAttribute("studentlist", studentlist);
		return "backend/list";
	}
	
	@RequestMapping("/slide")
	public String slide(Model model) throws ClassNotFoundException, SQLException{
		SildeCatService sildeCatService =new SildeCatService();
		model.addAttribute("sildelist", sildeCatService.queryList());
		return "backend/slide";
	}
	
	@RequestMapping("/test")
	 public void test(){
		
		
		String a = "A", b = "B", c = "C", d = "D", e = "E";
		List<String> list = new ArrayList<String>();
		list.add(a);
		list.add(e);
		list.add(d);
		list.set(1, b);
		list.set(0, "tang");
		list.add(2, c);
		Iterator<String> it = list.iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		System.out.println(list.indexOf(e));
		System.out.println(list.get(2));
	 }
	
	
	@RequestMapping("/arr")
	public void arr(HttpServletRequest req){

		
		System.out.println(req.getQueryString());
		
		List<String> l = new ArrayList<String>();
		l.add("aaa");
		l.add("bbb");
		l.add("ccc");
		l.add("ddd");
		l.add("eee");
		
		System.out.println(l.get(2));
		

		JSONObject json = new JSONObject();
		json.put("success", "true");
		json.put("status", "1001");
		json.put("msg", l.get(0));
		System.out.println("***********clickmiddle20*******back******");
		System.out.println("***********clickmiddle20*******back******"+json.toString());
		
			
		
		
		
	}
	
}

package com.data.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.data.model.Student;
import com.data.service.StudentService;
import com.data.util.DateUtils;
import com.data.util.Page;
 

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/add")
	public String add(){
		return "student/add";
	}
	
	@RequestMapping("/add_post")
	public void add_post(HttpServletRequest req, HttpServletResponse res, Model model,Student student) throws IOException
	{
		studentService.addStudent(student);
		res.sendRedirect(req.getContextPath()+"/student/list");
	}
	
	
	@RequestMapping("/list")
	public String list(HttpServletRequest req, HttpServletResponse res, Model model)
	{
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String pageNo = req.getParameter("pageNo");
		Page<Student> page = new Page<Student>();
		if(StringUtils.isEmpty(pageNo)){
			page.setPageNo(1);
		} else {
			page.setPageNo(Integer.valueOf(pageNo));
		}
		page.setPageSize(10);
		page.setQuery1(id);
		page.setQuery2(name);
		
//		Date currentTime = new Date();
//		System.out.println(formatDateTime(currentTime));
//		System.out.println(DateUtils.formatDateTime(currentTime));
//	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	    System.out.println(formatter.format(currentTime));
//	    System.out.println(currentTime);
		   
		studentService.getStudentlist(page);
//		System.out.println(page.toString());
//		List<Student> list = studentService.getStudentlist(page);
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		for(int i=0;i<list.size();i++){
//			System.out.println(list.get(i).getName());
//			System.out.println(list.get(i).getCreatetime());
//			System.out.println(formatter.format(list.get(i).getCreatetime()));
//		}
//		System.out.println(page.toString());
//		System.out.println(req.getContextPath());s
		model.addAttribute("page", page);
		return "student/list";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest req, HttpServletResponse res, Model model)
	{
		String id = req.getParameter("id");
		Student student = studentService.student_byid(id);
//		System.out.println(student.getName());
		model.addAttribute("student", student);
		return "/student/edit";
	}
	
	/*
	 * 修改提交
	 * */
	@RequestMapping("/edit_post")
	public void edit_post(HttpServletRequest req, HttpServletResponse res, Model model,Student student) throws IOException
	{
		studentService.editStudent(student);
		res.sendRedirect(req.getContextPath()+"/student/list");
	}
	
	/*
	 * 删除一条记录
	 * */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest req, HttpServletResponse res) throws IOException
	{
		String id = req.getParameter("id");
		studentService.delete_byid(id);
		res.sendRedirect(req.getContextPath()+"/student/list");
	}
	
	@RequestMapping("/ajax_getall")
	public void ajax_getall(HttpServletResponse res) throws IOException
	{
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		List<Student> list = studentService.getAllStudent();
		JSONObject json = new JSONObject();
		json.put("success", "true");
		json.put("status", "1001");
		json.put("msg", "返回成功!");
		json.put("list", list);
		System.out.println("***********clickmiddle20*******back******"+json.toString());
		res.getWriter().write(json.toJSONString());
	}
	
	
}

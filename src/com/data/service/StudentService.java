package com.data.service;


import java.util.List;

 
import com.data.model.Student;
import com.data.util.Page;
 


public interface StudentService {
	public void addStudent(Student student);
	public List<Student> getAllStudent();
	public List<Student> getStudentlist(Page page);
	//根据id获取当前数据
	public Student student_byid(String id);
	//根据id修改信息
	public void editStudent(Student student);
	
	public void delete_byid(String id);
	
	
}

 


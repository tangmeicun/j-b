package com.data.dao;


import java.util.List;
import org.springframework.stereotype.Repository;
import com.data.model.Student;
import com.data.util.Page;

@Repository
public interface StudentDao {

	public void addStudent(Student student);
	
	public List<Student> getAllStudent();
	 
	public List<Student> getStudentlist(Page page);

	//根据id获取单条记录信息
	public Student student_byid(String id);

	//根据id修改单条信息
	public void editStudent(Student student);

	public void delete_byid(String id);

	
 
	
}
 
 
package com.data.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

 
import com.data.dao.StudentDao;
import com.data.model.Student;
import com.data.service.StudentService;
import com.data.util.Page;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentDao studentDao;
	
	@Override
	public void addStudent(Student student)
	{
		// TODO Auto-generated method stub
		studentDao.addStudent(student);
	}
	
	@Override
	public List<Student> getAllStudent()
	{
		return studentDao.getAllStudent();
	}
 
	@Override
	public List<Student> getStudentlist(Page page){
		List<Student> list = studentDao.getStudentlist(page);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(Student student : list){
			student.setChangeTime(formatter.format(student.getCreatetime()));
		}
		return list;
	}
	
	/*
	 * 根据id获取当前数据
	 * */
	public Student student_byid(String id)
	{
		return studentDao.student_byid(id);
	}

	@Override
	public void editStudent(Student student) {
		// TODO Auto-generated method stub
		studentDao.editStudent(student);
	}

	@Override
	public void delete_byid(String id) {
		// TODO Auto-generated method stub
		studentDao.delete_byid(id);
		
	}
	
}

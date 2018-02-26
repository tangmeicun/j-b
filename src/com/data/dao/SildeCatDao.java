package com.data.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.data.model.SlideCat;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class SildeCatDao {

	public List<SlideCat> queryList() throws ClassNotFoundException, SQLException{
		List<SlideCat> slidelist = new ArrayList<SlideCat>();
		//1增加驱动
		Class.forName("com.mysql.jdbc.Driver");
		//2链接
		Connection conn=(Connection) DriverManager.getConnection("jdbc:mysql://192.168.2.190:3306/test","root","123456");
		//3操作
		Statement stmt=(Statement) conn.createStatement();
		ResultSet rs=stmt.executeQuery("select cid,cat_name,cat_idname,cat_remark from slide_cat");

		while(rs.next()){
			SlideCat slidecat = new SlideCat();
			slidecat.setCid(rs.getInt("cid"));
			slidecat.setCat_name(rs.getString("cat_name"));
			slidecat.setCat_idname(rs.getString("cat_idname"));
			slidecat.setCat_remark(rs.getString("cat_remark"));
			slidelist.add(slidecat);
		}
		return slidelist;
	}
	
}

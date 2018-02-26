package com.data.service;


import java.sql.SQLException;
import java.util.List;

import com.data.dao.SildeCatDao;
import com.data.model.SlideCat;

public class SildeCatService {

	
	public List<SlideCat> queryList() throws ClassNotFoundException, SQLException{
		
		SildeCatDao sildeCatDao = new SildeCatDao();
		return sildeCatDao.queryList();
		
	}
}

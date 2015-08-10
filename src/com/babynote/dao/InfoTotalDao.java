package com.babynote.dao;

import java.util.ArrayList;

import com.babynote.beans.*;

import java.sql.*;

public class InfoTotalDao extends BabyNoteDao{
	public static InfoTotalDao getInstance(){
		InfoTotalDao _instance = new InfoTotalDao();
		return _instance;
	}

	public ArrayList<Info>getInfoList() throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		conn = openConnection();
		
		String sql = "SELECT * FROM BABY_NOTE.Info";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		ArrayList<Info> infoList = new ArrayList<Info>();

		while(rs.next()){
			
			Info list = new Info();
			list.setImage(rs.getString(3));
			list.setSubject(rs.getString(4));
			list.setContents(rs.getString(5));
			list.setDate(rs.getString(7));
			
			infoList.add(list);
		}
		
		closeConnection();
		
		return infoList;
	}
}

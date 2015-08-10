package com.babynote.dao;

import java.util.ArrayList;

import com.babynote.beans.*;

import java.sql.*;

public class PrintWhisperDao extends BabyNoteDao{
	public static PrintWhisperDao getInstance(){
		PrintWhisperDao _instance = new PrintWhisperDao();
		return _instance;
	}

	public ArrayList<WhisperInfo>getContentsList() throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		conn = openConnection();
		
		String sql = "SELECT * FROM BABY_NOTE.Whisper order by BABY_NOTE.Whisper.W_Date desc";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		ArrayList<WhisperInfo> contentsList = new ArrayList<WhisperInfo>();

		while(rs.next()){
			
			WhisperInfo list = new WhisperInfo();
			list.setContents(rs.getString(2));
			contentsList.add(list);
		}
		
		closeConnection();
		rs.close();
		stmt.close();
			
		return contentsList;
	}
}

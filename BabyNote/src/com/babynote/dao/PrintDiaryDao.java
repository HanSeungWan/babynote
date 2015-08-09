package com.babynote.dao;

import java.util.ArrayList;

import com.babynote.beans.*;

import java.sql.*;

public class PrintDiaryDao extends BabyNoteDao{
	public static PrintDiaryDao getInstance(){
		PrintDiaryDao _instance = new PrintDiaryDao();
		return _instance;
	}

	public ArrayList<DiaryInfo>getDiaryList(SignInInfo info) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
		conn = openConnection();
		
		String sql = "SELECT * FROM BABY_NOTE.Diary Where M_ID = ? order by BABY_NOTE.Diary.D_Date desc;";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, info.getId());
		rs = pstmt.executeQuery();
		
		ArrayList<DiaryInfo> diaryList = new ArrayList<DiaryInfo>();

		while(rs.next()){
			
			DiaryInfo list = new DiaryInfo();
			list.setNo(rs.getString(1));
			list.setImage(rs.getString(2));
			list.setContents(rs.getString(3));
			list.setShare(rs.getString(4));
			list.setSubject(rs.getString(5));
			list.setId(rs.getString(5));
			list.setDate(rs.getString(6));
			
			diaryList.add(list);
		}
		
		return diaryList;
		
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
}

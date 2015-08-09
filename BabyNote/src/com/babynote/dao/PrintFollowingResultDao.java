package com.babynote.dao;

import java.util.ArrayList;

import com.babynote.beans.*;

import java.sql.*;

public class PrintFollowingResultDao extends BabyNoteDao{
	public static PrintFollowingResultDao getInstance(){
		PrintFollowingResultDao _instance = new PrintFollowingResultDao();
		return _instance;
	}

	public ArrayList<SignUpInfo>getFollowerSearchList(String search) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
		conn = openConnection();
		
		String sql = "SELECT * FROM BABY_NOTE.Member Where M_ID = ? or M_Name = ?;";	
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, search);
		pstmt.setString(2, search);
		
		rs = pstmt.executeQuery();
		
		ArrayList<SignUpInfo> followerList = new ArrayList<SignUpInfo>();

		while(rs.next()){
			
			SignUpInfo sui = new SignUpInfo();

			sui.setId(rs.getString(1));
			sui.setName(rs.getString(2));
			sui.setImage(rs.getString(4));
			
			followerList.add(sui);
		}
		
		return followerList;
		
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
}

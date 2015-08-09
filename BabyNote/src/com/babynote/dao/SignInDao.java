package com.babynote.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.babynote.beans.SignInInfo;

import java.sql.*;

public class SignInDao extends BabyNoteDao{
	public static SignInDao getInstance(){
		SignInDao _instance = new SignInDao();
		return _instance;
	}

	public int isMember(SignInInfo info) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = openConnection();
			
			String sql = "SELECT * FROM BABY_NOTE.member where BABY_NOTE.member.M_ID = ? and BABY_NOTE.member.M_PW = ?;";	
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getId());
			pstmt.setString(2, info.getPw());
			rs = pstmt.executeQuery();
		
			if(rs.next()){
				return 1;
			} else{
				return 0;
			}
			
		}catch(SQLException se){
			System.out.println(se.getMessage());
			return -1;
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)rs.close();
			if(conn!=null)conn.close();
		}
	}
}
	
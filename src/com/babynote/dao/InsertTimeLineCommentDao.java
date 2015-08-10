package com.babynote.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.beans.TimeLineCommentInfo;
import com.babynote.beans.TimeLineInfo;

import java.sql.*;

public class InsertTimeLineCommentDao extends BabyNoteDao{
	public static InsertTimeLineCommentDao getInstance(){
		InsertTimeLineCommentDao _instance = new InsertTimeLineCommentDao();
		return _instance;
	}

	public void setTimeLineComment(TimeLineCommentInfo tlci) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = openConnection();
			
			String sql = " SET FOREIGN_KEY_CHECKS = 0; ";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "INSERT INTO `BABY_NOTE`.`TimeLine_Reply` (`TL_No`, `TL_Contents`, `TL_Date`, `T_No`, `D_No`, `M_ID`)"
					+ " VALUES(?,?,?,?,?,?);";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, tlci.getNo());
			pstmt.setString(2, tlci.getContents());
			pstmt.setString(3, tlci.getDate());
			pstmt.setString(4, tlci.gettNo());
			pstmt.setString(5, tlci.getdNo());
			pstmt.setString(6, tlci.getId());
			
			pstmt.executeUpdate();
		
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
}
	
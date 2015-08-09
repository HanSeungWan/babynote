package com.babynote.dao;

import com.babynote.beans.*;

import java.sql.*;

public class InsertWhisperDao extends BabyNoteDao{
	public static InsertWhisperDao getInstance(){
		InsertWhisperDao _instance = new InsertWhisperDao();
		return _instance;
	}

	public void setContentsList(InsertWhisperInfo whisperInfo) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = openConnection();
		
		String sql = "INSERT INTO `BABY_NOTE`.`Whisper` (`W_No`, `W_Contents`, `W_Image`, `W_Tag`, `M_ID`, `W_Date`)"
				+"	VALUES (?, ?, ?,  ?, ?, ?); ";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, whisperInfo.getNo());
		pstmt.setString(2, whisperInfo.getContents());
		pstmt.setString(3, null);
		pstmt.setString(4, null);
		pstmt.setString(5, whisperInfo.getId());
		pstmt.setString(6, whisperInfo.getDate());
		
		pstmt.executeUpdate();
		
		closeConnection();
		pstmt.close();
	}
}

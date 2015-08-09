package com.babynote.dao;

import com.babynote.beans.*;

import java.sql.*;

public class WriteTimeLineDao extends BabyNoteDao {
	public static WriteTimeLineDao getInstance() {
		WriteTimeLineDao _instance = new WriteTimeLineDao();
		return _instance;
	}

	public void setTimeLine(TimeLineInfo info) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = openConnection();

			String sql = "INSERT INTO `BABY_NOTE`.`TimeLine` (`T_No`,`T_Date`,`T_Rating`,`D_No` ,`M_ID`) "
					+ "VALUES(?,?,?,?,?); ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getNo());
			pstmt.setString(2, info.getDate());
			pstmt.setInt(3, info.getRating());
			pstmt.setString(4, info.getdNo());
			pstmt.setString(5, info.getId());

			pstmt.executeUpdate();
			
		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				closeConnection();
		}
	}
}

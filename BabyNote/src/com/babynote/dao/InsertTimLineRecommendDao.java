package com.babynote.dao;

import com.babynote.beans.*;

import java.sql.*;

public class InsertTimLineRecommendDao extends BabyNoteDao {
	public static InsertTimLineRecommendDao getInstance() {
		InsertTimLineRecommendDao _instance = new InsertTimLineRecommendDao();
		return _instance;
	}

	public void setContentsList(DiaryInfo di) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			int rating = 0;
			TimeLineInfo tli = new TimeLineInfo();
			conn = openConnection();

			String sql = "SELECT T_Rating FROM BABY_NOTE.TimeLine where D_No = ? ;";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, di.getNo());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				tli.setRating(rs.getInt(1));
			}

			rating = tli.getRating() + 1;

			tli.setRating(rating);
			
			pstmt.close();
			
			sql = "UPDATE `BABY_NOTE`.`TimeLine` SET `T_Rating`= ? WHERE `D_No`= ? ;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tli.getRating());
			pstmt.setString(2, di.getNo());
			
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

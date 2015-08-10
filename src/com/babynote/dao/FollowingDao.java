package com.babynote.dao;

import com.babynote.beans.*;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FollowingDao extends BabyNoteDao {
	public static FollowingDao getInstance() {
		FollowingDao _instance = new FollowingDao();
		return _instance;
	}

	public int setFollowing(SignInInfo sii, String id, String name)
			throws SQLException, ServletException, IOException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		HttpServletRequest request = null;
		HttpServletResponse response = null;
		
		try {
			conn = openConnection();

			String sql = "INSERT INTO `BABY_NOTE`.`Follower` (`F_ID`, `F_Name`, `M_ID`)"
					+ "VALUES (?, ?, ?);";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, sii.getId());

			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "INSERT INTO `BABY_NOTE`.`Follower` (`F_ID`, `F_Name`, `M_ID`)"
					+ "	VALUES (?, ?, ?);";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sii.getId());
			pstmt.setString(2, name);
			pstmt.setString(3, id);

			pstmt.executeUpdate();
		} catch (SQLException se) {
			return -1;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				closeConnection();
		}
		return 1;
	}
}

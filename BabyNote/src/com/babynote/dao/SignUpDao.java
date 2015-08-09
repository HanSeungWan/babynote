package com.babynote.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.babynote.beans.SignUpInfo;

import java.sql.*;

public class SignUpDao extends BabyNoteDao {
	public static SignUpDao getInstance() {
		SignUpDao _instance = new SignUpDao();
		return _instance;
	}

	public int isId(SignUpInfo info) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			conn = openConnection();

			String sql = "SELECT * FROM BABY_NOTE.member where BABY_NOTE.member.M_ID = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getId());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			} else {
				return 0;
			}

		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	}

	@SuppressWarnings("resource")
	public void setMember(SignUpInfo info) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			conn = openConnection();

			String sql = "INSERT INTO `BABY_NOTE`.`Member` (`M_ID`, `M_Name`, `M_PW`, `M_Image`, `M_Answer`, `M_Questions`) VALUES (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, info.getId());
			pstmt.setString(2, info.getName());
			pstmt.setString(3, info.getPw());
			pstmt.setString(4, info.getImage());
			pstmt.setString(5, info.getAnswer());
			pstmt.setString(6, info.getQuestions());

			pstmt.executeUpdate();

			// 자기 자신은 무조건 following
			sql = "INSERT INTO `BABY_NOTE`.`Follower` (`F_ID`, `F_Name`, `M_ID`) "
					+ "VALUES (?,?,?); ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, info.getId());
			pstmt.setString(2, info.getName());
			pstmt.setString(3, info.getId());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			System.out.println(se.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
}

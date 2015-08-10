package com.babynote.dao;

import com.babynote.beans.*;

import java.sql.*;

public class WriteDiaryDao extends BabyNoteDao {
	public static WriteDiaryDao getInstance() {
		WriteDiaryDao _instance = new WriteDiaryDao();
		return _instance;
	}

	public void setWriteDiary(DiaryInfo info) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			conn = openConnection();

			String sql = "INSERT INTO `BABY_NOTE`.`Diary` (`D_No`, `D_Image`, `D_Contents`,`D_Share`, `D_Subject`, `M_ID`, `D_Date`)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?);";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, info.getNo());
			pstmt.setString(2, info.getImage());
			pstmt.setString(3, info.getContents());
			pstmt.setString(4, info.getShare());
			pstmt.setString(5, info.getSubject());
			pstmt.setString(6, info.getId());
			pstmt.setString(7, info.getDate());

			pstmt.executeUpdate();
			
			if(info.getShare().equals("y")){
				this.setTimeLineInfo(info);
			} else{}
			
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
	
	private void setTimeLineInfo(DiaryInfo info) throws SQLException{

			WriteTimeLineDao wild = new WriteTimeLineDao();
			TimeLineInfo tli = new TimeLineInfo();
			
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date =  formatter.format(new java.util.Date());
			 
			formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String dDate = formatter.format(new java.util.Date());
			String no = 4 + "+" + info.getId() + "+" + dDate;
			
			tli.setDate(date);
			tli.setdNo(info.getNo());
			tli.setId(info.getId());
			tli.setRating(0);
			tli.setNo(no);
			
			wild.setTimeLine(tli);
	}
}

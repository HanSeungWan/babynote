package com.babynote.dao;

import java.util.ArrayList;

import com.babynote.beans.*;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;

public class PrintTimeLineDao extends BabyNoteDao{
	public static PrintTimeLineDao getInstance(){
		PrintTimeLineDao _instance = new PrintTimeLineDao();
		return _instance;
	}

	public ArrayList<TimeLineViewInfo>getTimeLineList(TimeLineViewInfo tlvi) throws SQLException, ServletException, IOException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
		conn = openConnection();
		
		String sql = "SELECT Diary.D_No, Diary.D_Image, Diary.D_Contents, Diary.D_Subject, Diary.M_ID, T_Date, T_Rating, T_No FROM BABY_NOTE.Diary, BABY_NOTE.TimeLine "
				+ "Where BABY_NOTE.Diary.D_No = BABY_NOTE.TimeLine.D_No and BABY_NOTE.Diary.D_Share = 'y' and BABY_NOTE.Diary.M_ID in "
				+ "(select BABY_NOTE.Follower.F_ID from BABY_NOTE.Follower where BABY_NOTE.Follower.M_ID = ?) order by BABY_NOTE.Diary.D_Date desc";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tlvi.getId());
		rs = pstmt.executeQuery();
	
		ArrayList<TimeLineViewInfo> timeLineList = new ArrayList<TimeLineViewInfo>();
		
		while(rs.next()){
			if(rs.getString(5).equals(tlvi.getId())){}
			else{
				TimeLineViewInfo list = new TimeLineViewInfo();
				
				list.setNo(rs.getString(8));
				list.setImage(rs.getString(2));
				list.setContents(rs.getString(3));
				list.setSubject(rs.getString(4));
				list.setId(rs.getString(5));
				list.setDate(rs.getString(6));
				list.setRating(rs.getInt(7));
				list.setdNo(rs.getString(1));
				
				timeLineList.add(list);
			}
		}
		
		return timeLineList;
		
		}catch(Exception e){
			e.printStackTrace();
			}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return null;
	}
}

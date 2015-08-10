package com.babynote.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.TimeLineCommentInfo;
import com.babynote.beans.TimeLineViewInfo;

import java.sql.*;
import java.util.ArrayList;

public class PrintTimeLineCommentDao extends BabyNoteDao{
	public static PrintTimeLineCommentDao getInstance(){
		PrintTimeLineCommentDao _instance = new PrintTimeLineCommentDao();
		return _instance;
	}

	public ArrayList<TimeLineCommentInfo> getTimeLineComment(TimeLineCommentInfo tlci) throws SQLException{
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = openConnection();
			
			String sql = "SELECT * FROM baby_note.timeline_reply , baby_note.diary where timeline_reply.D_No = diary.D_No and baby_note.diary.D_No = ?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tlci.getdNo());
			rs = pstmt.executeQuery();
			ArrayList<TimeLineCommentInfo> timeLineCommentList = new ArrayList<TimeLineCommentInfo>();
			
			while(rs.next()){
				TimeLineCommentInfo list = new TimeLineCommentInfo();
				
				list.setContents(rs.getString(2));
				list.setId(rs.getString(12));
				list.setdNo(tlci.getdNo());
				list.settNo(tlci.gettNo());
				
				timeLineCommentList.add(tlci);
			}
			
			return timeLineCommentList;
			
		}catch(SQLException se){
			System.out.println(se.getMessage());
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)rs.close();
			if(conn!=null)conn.close();
		}
		return null;
	}
}
	
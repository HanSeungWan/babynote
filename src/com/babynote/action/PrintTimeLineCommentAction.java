package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.beans.TimeLineCommentInfo;
import com.babynote.beans.TimeLineViewInfo;
import com.babynote.beans.WhisperInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.PrintDiaryDao;
import com.babynote.dao.PrintTimeLineCommentDao;
import com.babynote.dao.PrintTimeLineDao;
import com.babynote.dao.PrintWhisperDao;
import com.babynote.dao.WriteTimeLineDao;

import java.util.ArrayList;

public class PrintTimeLineCommentAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		TimeLineCommentInfo tlci = new TimeLineCommentInfo();
		
		tlci.setdNo(request.getParameter("dNo"));
		tlci.settNo(request.getParameter("tNo"));
		
		ArrayList<TimeLineCommentInfo> timeLineCommentList = PrintTimeLineCommentDao.getInstance().getTimeLineComment(tlci);
		
		request.setAttribute("timeLineCommentList", timeLineCommentList);
			
		return "Baby_Note_TimeLine_Comment.jsp";
	}

}

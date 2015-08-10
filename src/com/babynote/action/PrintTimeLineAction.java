package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.beans.TimeLineViewInfo;
import com.babynote.beans.WhisperInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.PrintDiaryDao;
import com.babynote.dao.PrintTimeLineDao;
import com.babynote.dao.PrintWhisperDao;
import com.babynote.dao.WriteTimeLineDao;

import java.util.ArrayList;

public class PrintTimeLineAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		TimeLineViewInfo tlvi = new TimeLineViewInfo();
		SignInInfo si = (SignInInfo) session.getAttribute("login");
		tlvi.setdNo(request.getParameter("dNo"));
		tlvi.setId(si.getId());
		
		ArrayList<TimeLineViewInfo> timeLineList = PrintTimeLineDao.getInstance().getTimeLineList(tlvi);
		
		request.setAttribute("timeLineList", timeLineList);
			
		return "Baby_Note_TimeLine_View.jsp";
	}

}

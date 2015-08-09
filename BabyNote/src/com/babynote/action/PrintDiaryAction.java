package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.beans.WhisperInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.PrintDiaryDao;
import com.babynote.dao.PrintWhisperDao;

import java.util.ArrayList;

public class PrintDiaryAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		SignInInfo info = (SignInInfo) session.getAttribute("login");
		
		ArrayList<DiaryInfo> contentsList = PrintDiaryDao.getInstance().getDiaryList(info); 
		
		request.setAttribute("diaryContentsList", contentsList);
			
		return "Baby_Note_Diary_View.jsp";
	}

}

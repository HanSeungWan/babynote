package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.InsertWhisperInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.InsertWhisperDao;

public class InsertWhisperAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		InsertWhisperDao iwd = new InsertWhisperDao();
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String contents = request.getParameter("contents");
		String no = "";
		SignInInfo loginInfo = (SignInInfo) session.getAttribute("login");
		InsertWhisperInfo info = new InsertWhisperInfo();
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date =  formatter.format(new java.util.Date());
		
		no = 3 + "+" + loginInfo.getId() + "+" + date; // 고유 넘버 생성 3+아이디+날짜
		
		info.setId(loginInfo.getId());
		info.setDate(date);
		info.setContents(contents);
		info.setNo(no);
		
		iwd.setContentsList(info);
		
		return "Baby_Note_Whisper_View.do";
	}

}

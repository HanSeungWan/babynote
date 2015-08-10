package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babynote.beans.WhisperInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.PrintWhisperDao;

import java.util.ArrayList;

public class PrintWhisperAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		ArrayList<WhisperInfo> contentsList = PrintWhisperDao.getInstance().getContentsList(); 
		
		request.setAttribute("whisperContentsList", contentsList);
			
		return "Baby_Note_Whisper_View.jsp";
	}

}

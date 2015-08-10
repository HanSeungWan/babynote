package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babynote.beans.SignUpInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.PrintFollowingResultDao;

import java.util.ArrayList;

public class PrintFollowerSearchAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		String search = request.getParameter("search");
		
		ArrayList<SignUpInfo> contentsList = PrintFollowingResultDao.getInstance().getFollowerSearchList(search); 
		
		request.setAttribute("contentsList", contentsList);
			
		return "Baby_Note_Follower_Searchs_Result.jsp";
	}

}

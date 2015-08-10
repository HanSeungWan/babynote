package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.SignInInfo;
import com.babynote.beans.SignUpInfo;
import com.babynote.beans.WhisperInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.FollowingDao;
import com.babynote.dao.PrintWhisperDao;

import java.util.ArrayList;

public class FollowingAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		int status = 0;
		
		HttpSession session = request.getSession();
		
		SignInInfo sii = (SignInInfo)session.getAttribute("login");
		
		String id = request.getParameter("follower_id");
		String name = request.getParameter("follower_name");
		
		FollowingDao fd = new FollowingDao();
		
		status = fd.setFollowing(sii, id, name);
		
		if(status == -1){
			return "Baby_Note_Following_Err.jsp";
		}
		
		return "Baby_Note_Follower_Searchs_Result.jsp";
	}

}

package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.SignInInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.SignInDao;

public class SignInAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		SignInInfo info = new SignInInfo(id,pw);
		
		SignInDao dao = SignInDao.getInstance();
		
		int n = dao.isMember(info);
		
		if(n==1){
			HttpSession session = request.getSession();
			
			session.setAttribute("login", info);
			
			response.sendRedirect("Baby_Note_Main.jsp");
		} else if(n==0){
			String msg = "아이디 또는 비밀번호가 틀립니다.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignIn_Err.jsp").forward(request, response);
		} else{
			String msg = "내부 적인 오류";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignIn_Err.jsp").forward(request, response);
		}
		
		return null;
	}

	
}

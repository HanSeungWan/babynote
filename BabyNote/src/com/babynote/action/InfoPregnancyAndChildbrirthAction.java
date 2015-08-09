package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babynote.beans.Info;
import com.babynote.controller.CommandAction;
import com.babynote.dao.InfoPregnancyAndChildbrirthDao;

import java.util.ArrayList;

public class InfoPregnancyAndChildbrirthAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		ArrayList<Info> infoList = InfoPregnancyAndChildbrirthDao.getInstance().getInfoList();
		
		request.setAttribute("infoList", infoList);
			
		return "Baby_Note_Info_Pregnancy_and_childbrirth_View.jsp";
	}

}

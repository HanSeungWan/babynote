package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babynote.beans.Info;
import com.babynote.controller.CommandAction;
import com.babynote.dao.InfoGranulationDao;

import java.util.ArrayList;

public class InfoGranulationAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		ArrayList<Info> infoList = InfoGranulationDao.getInstance().getInfoList();
		
		request.setAttribute("infoList", infoList);
			
		return "Baby_Note_Info_Granulation_View.jsp";
	}

}

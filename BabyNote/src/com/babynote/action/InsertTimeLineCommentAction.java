package com.babynote.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.beans.TimeLineCommentInfo;
import com.babynote.beans.TimeLineInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.InsertTimeLineCommentDao;

public class InsertTimeLineCommentAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String contents = request.getParameter("contents");
		String no = "";
		SignInInfo sii = (SignInInfo) session.getAttribute("login");
		InsertTimeLineCommentDao itlcd = new InsertTimeLineCommentDao();
		TimeLineCommentInfo tlci = new TimeLineCommentInfo();
		DiaryInfo di = new DiaryInfo();
		TimeLineInfo tli = new TimeLineInfo();
		
		di.setNo(request.getParameter("dNo"));
		tli.setNo(request.getParameter("tNo"));;
		
		System.out.println(di.getNo());
		System.out.println(tli.getNo());
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date =  formatter.format(new java.util.Date());
	
		formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String nDate =  formatter.format(new java.util.Date());
		
		no =  5 + "+" + sii.getId() + "+" + nDate;
		
		tlci.setContents(contents);
		tlci.setDate(date);
		tlci.setNo(no);
		tlci.setdNo(di.getNo());
		tlci.setId(sii.getId());
		tlci.settNo(tli.getNo());
		
		itlcd.setTimeLineComment(tlci);
		
		request.setAttribute("tNo", tlci.gettNo());
		request.setAttribute("dNo", tlci.getdNo());
		
		return "Baby_Note_TimeLine_Comment.do";
	}

}

package com.babynote.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.babynote.beans.DiaryInfo;
import com.babynote.beans.SignInInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.InsertWhisperDao;
import com.babynote.dao.WriteDiaryDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteDiaryAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		String realFolder = "";
		int maxSize = 1024 * 1024 * 5;
		String encType = "UTF-8";
		String savefile = "Diary_Image";
		realFolder = request.getRealPath(savefile);

		String filename1 = null;
		MultipartRequest multi = new MultipartRequest(request, realFolder,
				maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);

		WriteDiaryDao wdd = new WriteDiaryDao();
		HttpSession session = request.getSession();

		String contents = multi.getParameter("contents");
		String no = "";
		String image = "";
		String share = multi.getParameter("share");
		String subject = multi.getParameter("subject");
		SignInInfo loginInfo = (SignInInfo) session.getAttribute("login");
		DiaryInfo info = new DiaryInfo();

		String fullpath = savefile + "/" + filename1;

		image = fullpath;

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String date = formatter.format(new java.util.Date());

		formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String noDate = formatter.format(new java.util.Date());

		no = 1 + "+" + loginInfo.getId() + "+" + noDate; // 고유 넘버 생성 3+아이디+날짜
		
		if(share == null) {share = "n";}
		
		info.setId(loginInfo.getId());
		info.setDate(date);
		info.setContents(contents);
		info.setNo(no);
		info.setImage(image);
		info.setSubject(subject);
		info.setShare(share);
		
		wdd.setWriteDiary(info);
		
		return "Baby_Note_Diary_View.do";
	}

}

package com.babynote.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.babynote.beans.SignUpInfo;
import com.babynote.controller.CommandAction;
import com.babynote.dao.SignUpDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SignUpAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		String realFolder = "";
		int maxSize = 1024*1024*5;
		String encType = "UTF-8";
		String savefile = "Join_Image";
		realFolder = request.getRealPath(savefile);
		
		String filename1 = null;
		MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	 	Enumeration<?> files = multi.getFileNames();
	    String file1 = (String)files.nextElement();
	    filename1 = multi.getFilesystemName(file1);
	    
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String rpw = multi.getParameter("rpw");
		String questions = multi.getParameter("questions");
		String answer = multi.getParameter("answer");
		String image = multi.getParameter("iamge");
		String name = multi.getParameter("name");
		
		String fullpath = savefile + "/" + filename1;
		
		image = fullpath;
		
		SignUpInfo info = new SignUpInfo();
		
		info.setId(id); 
		info.setPw(pw);
		info.setRpw(rpw);
		info.setAnswer(answer);
		info.setImage(image);
		info.setQuestions(questions);
		info.setName(name);
		
		SignUpDao dao = SignUpDao.getInstance();
		
		int n = dao.isId(info);
		
		if(info.getId().equals("")){
			String msg = "아이디를 입력해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(info.getPw().equals("")){
			String msg = "페스워드를 입력해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(info.getRpw().equals("")){
			String msg = "확인 페스워드를 입력해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(info.getName().equals("")){
			String msg = "이름을 입력해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(info.getQuestions().equals("0")){
			String msg = "질문을 선택해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(info.getAnswer().equals("")){
			String msg = "답변을 입력해 주세요.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		
		if(n==1){
			String msg = "아이디가 중복 됩니다.";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		} else if(n==0){
			if(!info.getPw().equals(info.getRpw())){
				String msg = "비밀번호가 다릅니다.";
				request.setAttribute("errMsg", msg);
				request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
			}else{
				dao.setMember(info);
				String msg = "회원가입 되었습니다.";
				request.setAttribute("errMsg", msg);
				request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
			}
		} else{
			String msg = "내부 적인 오류";
			request.setAttribute("errMsg", msg);
			request.getRequestDispatcher("Baby_Note_SignUp_Err.jsp").forward(request, response);
		}
		return null;
		
	}
}

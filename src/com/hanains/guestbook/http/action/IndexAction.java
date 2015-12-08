package com.hanains.guestbook.http.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanains.guestbook.dao.GuestbookDao;
import com.hanains.guestbook.vo.GuestbookVo;
import com.hanains.http.HttpUtil;
import com.hanains.http.action.Action;

public class IndexAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		GuestbookDao dao = new GuestbookDao();
		List<GuestbookVo> list = dao.getList();
		
		request.setAttribute("list", list);
		
		try {
			HttpUtil.forwarding(request, response, "/WEB-INF/views/index.jsp");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

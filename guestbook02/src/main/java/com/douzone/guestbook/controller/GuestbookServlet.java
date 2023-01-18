package com.douzone.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.douzone.guestbook.dao.GuestBookDao;
import com.douzone.guestbook.vo.GuestBookVo;

public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String aciton = request.getParameter("a");

		if ("add".equals(aciton)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String message = request.getParameter("message");

			Date now = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formatedNow = formatter.format(now);

			GuestBookVo vo = new GuestBookVo(name, password, message, formatedNow);
			// System.out.println(vo.toString());
			new GuestBookDao().insert(vo);
			response.sendRedirect(request.getContextPath()+"/gb");
		} else if ("deleteform".equals(aciton)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(request, response);
		} else if ("delete".equals(aciton)) {
			String password = request.getParameter("password");
			int no = Integer.parseInt(request.getParameter("no"));

			boolean result = new GuestBookDao().delete(no, password);
			if (result) {
				response.sendRedirect(request.getContextPath()+"/gb");
			} else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter pw = response.getWriter();
				pw.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
				pw.flush();
				pw.close();
			}
		} else {
			List<GuestBookVo> list = new GuestBookDao().findAll();
			request.setAttribute("list", list);

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

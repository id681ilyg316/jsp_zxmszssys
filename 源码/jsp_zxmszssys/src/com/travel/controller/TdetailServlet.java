package com.travel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;

@WebServlet("/Tdetail") // 加载图片
public class TdetailServlet extends HttpServlet {
	BaseDao dao = new BaseDaoImpl();

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
//		File[] files = File.listRoots();
//		String rootpath = files[files.length - 1].getPath();
		System.out.println(method);
		if ("showImage".equals(method)) {// 加载图片
			File file = new File(request.getParameter("image"));
//			System.out.println(file);
			if (file == null || !file.exists()) {
				return;
			}
			InputStream in = new FileInputStream(file);
			int len = 0;
			byte[] b = new byte[1024 * 4];
			OutputStream out = response.getOutputStream();
			while ((len = in.read(b)) != -1) {
//				 System.out.println(len);
				out.write(b, 0, len);
			}
			response.flushBuffer();
			out.close();
			in.close();

		}
	}

}

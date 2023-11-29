package com.travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.CllentEntity;
import com.travel.service.ObjectService;

@WebServlet("/Cllent")//用户类
public class CllentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BaseDao dao = new BaseDaoImpl();
	PrintWriter out = null;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		// service
		// 方法类-----------------------------------------------------------------------------------------------------
		ObjectService service = new ObjectService();
		CllentEntity con = service.setObject(request, CllentEntity.class);
		HttpSession session = request.getSession();
		out = response.getWriter();
		// 全局变量类----------------------------------------------------------------------------------------------------------
		String method = request.getParameter("method");
		System.out.println(method);

		if ("cllentList".equals(method)) {// 列表
			try {
				JSONArray cllent = dao.findJSONArray("select * from cllent ");
				request.setAttribute("cllent", cllent);
				request.getRequestDispatcher("admin-cllent.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("searchCllent".equals(method)) {// 查询
			try {
				JSONArray cllent = dao.findJSONArray("select * from cllent where ctel like '%" + con.getCtel() + "%'");
				request.setAttribute("cllent", cllent);
				request.getRequestDispatcher("admin-cllent.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("cllentAdd".equals(method)) {// 增加
			Object[] params = { con.getCllName(), con.getCtel(), con.getCsex(),con.getAge(),service.getRandom() };
			try {
				CllentEntity user = dao.findBean(CllentEntity.class, "select * from cllent where ctel=?",
						con.getCtel());
				if (user != null) {
					service.outWrite(out, "2");
				} else {
					int i = dao.update("INSERT INTO cllent(cll_name,ctel,csex,age,id_code,password) VALUES(?,?,?,?,?,123456)", params);
					if (i > 0) {
						service.outWrite(out, "1");
					} else {
						service.outWrite(out, "3");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("resetPwd".equals(method)) {// 重置密码
			try {
				int i = dao.update("update cllent set password = '123456' where ctel=?", con.getCtel());
				if (i > 0) {
					response.sendRedirect("Cllent?method=cllentList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("deleteCllent".equals(method)) {// 删除
			try {
				int i = dao.update("delete from cllent where ctel=?", con.getCtel());
				if (i > 0 ) {
					response.sendRedirect("Cllent?method=cllentList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateCllent".equals(method)) {// 修改
			Object[] params = { con.getCllId() };
			try {
				JSONObject cllent = dao.findJSONObject("select * from cllent where cll_id = ?", params);
				request.setAttribute("cllent", cllent);
				request.getRequestDispatcher("admin-cllentUpdate.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateCllent1".equals(method)) {// 完成修改
			Object[] params = {  con.getCllName(), con.getCsex(),con.getIdCode(),con.getAge(), con.getCtel() };
			try {
				int i = dao.update("update cllent set cll_name = ?,csex=?,id_code=?,age=? where ctel=?",
						params);
				if (i > 0) {
					service.outWrite(out, "1");
				} else {
					service.outWrite(out, "2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateCllent2".equals(method)) {// 用户完成修改信息
			Object[] params1 = { con.getCllName(), con.getCsex(),con.getIdCode(),con.getAge(), con.getCtel() };
			try {

				int i = dao.update("update cllent set cll_name = ?,csex=?,id_code=?,age=? where ctel=?",
						params1);
				if(i>0) {
					response.sendRedirect("Cllent?method=cllentList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("cllent".equals(method)) {// 用户信息
			String uname = (String) session.getAttribute("uname");
			JSONArray cllent;
			try {
				cllent = dao.findJSONArray(
						"select u.*,c.* from users u join cllent c on c.uname=u.uname where u.uname=?", uname);
				System.out.println(cllent);
				request.setAttribute("cllent", cllent);
				request.getRequestDispatcher("cllent-info.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

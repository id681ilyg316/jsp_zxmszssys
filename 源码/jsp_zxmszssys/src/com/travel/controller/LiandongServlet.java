package com.travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.BaseAreaEntity;
import com.travel.service.ObjectService;

/**
 * 首页所需servlet
 */
@WebServlet("/LiandongServlet")
public class LiandongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		BaseDao dao = new BaseDaoImpl();// 数据库工具类
		ObjectService ob = new ObjectService();// 处理方法
		BaseAreaEntity bas = ob.setObject(request, BaseAreaEntity.class);
		PrintWriter out = response.getWriter();// ajax返回方法
		String method = request.getParameter("method");
		System.out.println(method);

		if ("provinceQuery".equals(method)) {// 查询省
			try {
				String sql = "SELECT  area.base_areaid,area.name FROM base_area area where 1=1 and area.parentid='0'";
				JSONArray listDept = dao.findJSONArray(sql);
				System.out.println(listDept);
				out.write(listDept.toJSONString());
				out.flush();
				out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if("provinceCity".equals(method)) {//查询市
			try {
				String sql = "SELECT area.base_areaid,area.name FROM base_area area where 1=1 and area.parentid=?";
				JSONArray listDept = dao.findJSONArray(sql,bas.getParentid());
				System.out.println(listDept);
				out.write(listDept.toJSONString());
				out.flush();
				out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("provinceCounty".equals(method)) {//查询县/区
			try {
				String sql = "SELECT area.base_areaid,area.name FROM base_area area where 1=1 and area.parentid=?";
				JSONArray listDept = dao.findJSONArray(sql,bas.getParentid());
				System.out.println(listDept);
				out.write(listDept.toJSONString());
				out.flush();
				out.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}

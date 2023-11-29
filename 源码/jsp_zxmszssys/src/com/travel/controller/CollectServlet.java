package com.travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.FoodEntity;
import com.travel.entity.ScenicEntity;
import com.travel.service.ObjectService;

@WebServlet("/CollectServlet") // 用户类
@MultipartConfig
public class CollectServlet extends HttpServlet {
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
		FoodEntity foo = service.setObject(request, FoodEntity.class);
		ScenicEntity sce = service.setObject(request, ScenicEntity.class);
		out = response.getWriter();
		// 全局变量类----------------------------------------------------------------------------------------------------------
		String method = request.getParameter("method");
		System.out.println(method);

		if ("sce_collect".equals(method)) {// 景点收藏
			try {
				String sce_collect = "select count(*) value,s.sce_name name from scenic s "
						+ "join sce_collect sc on s.sce_id = sc.sce_id join cllent c on sc.ctel = c.ctel "
						+ " GROUP BY s.sce_id ORDER BY  value DESC limit 0,15";
				JSONArray scenic = dao.findJSONArray(sce_collect);
				service.outWrite(out, JSON.toJSONString(scenic));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("foo_collect".equals(method)) {// 美食收藏
			try {
				String foo_collect = "select count(*) value,f.foo_name name from food f "
						+ "join foo_collect fc on f.foo_id = fc.foo_id join cllent c on fc.ctel = c.ctel "
						+ "GROUP BY f.foo_id ORDER BY  value DESC limit 0,15";
				JSONArray food = dao.findJSONArray(foo_collect);
				service.outWrite(out, JSON.toJSONString(food));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("deleteFoo".equals(method)) {// 取消美食收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			Object[] params = { foo.getFooId(), ctel };
			System.out.println(foo.getFooId() + " " + ctel);
			try {
				int a = dao.update("delete from foo_collect where foo_id=? and ctel=?", params);
				if (a > 0) {
					service.outWrite(out, "1");
				} else {
					service.outWrite(out, "2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("addFoo".equals(method)) {// 美食收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			Object[] params = { foo.getFooId(), ctel };
			System.out.println(foo.getFooId() + " " + ctel);
			try {
				int a = dao.update("insert into foo_collect(foo_id,ctel) values(?,?)", params);
				if (a > 0) {
					service.outWrite(out, "1");
				} else {
					service.outWrite(out, "2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("deleteSce".equals(method)) {// 取消美食收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			Object[] params = { sce.getSceId(), ctel };
			try {
				int a = dao.update("delete from sce_collect where sce_id=? and ctel=?", params);
				if (a > 0) {
					service.outWrite(out, "1");
				} else {
					service.outWrite(out, "2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("addSce".equals(method)) {// 美食收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			Object[] params = { sce.getSceId(), ctel };
			try {
				int a = dao.update("insert into sce_collect(sce_id,ctel) values(?,?)", params);
				if (a > 0) {
					service.outWrite(out, "1");
				} else {
					service.outWrite(out, "2");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("collectSec".equals(method)) {// 用户查看景点收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			try {
				String sce_collect = "select s.* from scenic s join sce_collect sc on s.sce_id = sc.sce_id join cllent c on sc.ctel = c.ctel where sc.ctel=?";
				JSONArray scenic = dao.findJSONArray(sce_collect,ctel);
				request.setAttribute("collect", scenic);
				request.getRequestDispatcher("collectSce-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("collectFoo".equals(method)) {// 美食收藏
			String ctel = (String) request.getSession().getAttribute("ctel");
			try {
				String foo_collect = "select f.* from food f join foo_collect fc on f.foo_id = fc.foo_id join cllent c on fc.ctel = c.ctel where fc.ctel=?";
				JSONArray food = dao.findJSONArray(foo_collect,ctel);
				request.setAttribute("collect", food);
				request.getRequestDispatcher("collectFoo-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

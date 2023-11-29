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
import javax.servlet.http.Part;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.FoodEntity;
import com.travel.service.ObjectService;

@WebServlet("/FoodServlet") // 用户类
@MultipartConfig
public class FoodServlet extends HttpServlet {
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
		out = response.getWriter();
		// 全局变量类----------------------------------------------------------------------------------------------------------
		String method = request.getParameter("method");
		System.out.println(method);

		if ("foodList".equals(method)) {// 列表
			try {
				JSONArray food = dao
						.findJSONArray("select s.sce_name,f.* from food f left join scenic s on s.sce_id=f.sce_id");
				request.setAttribute("food", food);
				request.getRequestDispatcher("admin-food.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("searchFood".equals(method)) {// 查询
			try {
				System.out.println(foo.getFooName());
				JSONArray food = dao.findJSONArray(
						"select s.sce_name,f.* from food f left join scenic s on s.sce_id=f.sce_id where f.foo_name like '%"
								+ foo.getFooName() + "%'");
				String sceId = request.getParameter("sceId");
				System.out.println(sceId);
				if (sceId != null && sceId != "") {
					food = dao.findJSONArray(
							"select s.sce_name,f.* from food f left join scenic s on s.sce_id=f.sce_id where f.sce_id="
									+ sceId + " and f.foo_name like '%" + foo.getFooName() + "%'");
				}
				request.setAttribute("food", food);
				request.getRequestDispatcher("admin-food.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("foodAdd".equals(method)) {// 增加
			Part part = request.getPart("Savatar");
			String heads_url = service.imagepath(part);
			String img_url = heads_url;
			Object[] params = { foo.getFooName(), img_url, foo.getAddress(), foo.getSceId(), foo.getDescription() };
			try {
				int i = dao.update("INSERT INTO food(foo_name,img_url,address,sce_id,description) VALUES(?,?,?,?,?)",
						params);
				if (i > 0) {
					response.sendRedirect("FoodServlet?method=foodList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("deleteFood".equals(method)) {// 删除
			try {
				int i = dao.update("delete from food where foo_id=?", foo.getFooId());
				if (i > 0) {
					response.sendRedirect("FoodServlet?method=foodList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateFood".equals(method)) {// 修改
			Object[] params = { foo.getFooId() };
			try {
				JSONObject food = dao.findJSONObject(
						"select s.sce_name,f.* from food f left join scenic s on s.sce_id=f.sce_id where f.foo_id = ?",
						params);
				request.setAttribute("food", food);
				request.getRequestDispatcher("admin-foodUpdate.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateFood1".equals(method)) {// 完成修改
			String img_url = null;
			Part part1 = request.getPart("Savatar");
			if (part1.getSize() > 0) {
				String savepath = service.imagepath(part1);
				img_url = savepath;
			} else {
				img_url = foo.getImgUrl();
			}
			Object[] params = { foo.getFooName(), img_url, foo.getAddress(), foo.getSceId(), foo.getDescription(),
					foo.getFooId() };
			try {
				int i = dao.update(
						"update food set foo_name = ?,img_url=?,address=?,sce_id=?,description=? where foo_id=?",
						params);
				if (i > 0) {
					response.sendRedirect("FoodServlet?method=foodList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("foodCllentList".equals(method)) {// 用户查看列表
			String ctel = (String) request.getSession().getAttribute("ctel");
			try {
				String sql = "select IF(ISNULL(c.ctel),'0','1') count,IF(ISNULL(fo.foo_id),'0',CONVERT( COUNT(*) USING UTF8)) num ,f.* "
						+ "from foo_collect fo " + "left join food f on fo.foo_id=f.foo_id "
						+ "left join cllent c on c.ctel=fo.ctel " + "and c.ctel=? where f.sce_id=? "
						+ "GROUP BY f.foo_id order by num desc";
				JSONArray food = dao.findJSONArray(sql, ctel, foo.getSceId());
				request.setAttribute("food", food);
				request.getRequestDispatcher("food-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("foodCllentSearch".equals(method)) {// 用户搜索列表
			String ctel = (String) request.getSession().getAttribute("ctel");
			try {
				String sql = "select IF(ISNULL(c.ctel),'0','1') count,IF(ISNULL(fo.foo_id),'0',CONVERT( COUNT(*) USING UTF8)) num ,f.* "
						+ "from foo_collect fo " + "left join food f on fo.foo_id=f.foo_id "
						+ "left join cllent c on c.ctel=fo.ctel " + "and c.ctel=" + ctel + " where f.sce_id = "
						+ foo.getSceId() + " and f.foo_name like '%" + foo.getFooName() + "%' "
						+ "GROUP BY f.foo_id order by num desc";
				JSONArray food = dao.findJSONArray(sql);
				request.setAttribute("food", food);
				request.getRequestDispatcher("food-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("detailFood".equals(method)) {// 美食详情
			try {
				JSONObject food = dao.findJSONObject("select * from food where foo_id=?", foo.getFooId());
				request.setAttribute("food", food);
				request.getRequestDispatcher("food-detail.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

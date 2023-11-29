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
import com.travel.entity.ScenicEntity;
import com.travel.service.ObjectService;

@WebServlet("/ScenicServlet") // 景点类
@MultipartConfig
public class ScenicServlet extends HttpServlet {
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
		ScenicEntity sce = service.setObject(request, ScenicEntity.class);
		out = response.getWriter();
		// 全局变量类----------------------------------------------------------------------------------------------------------
		String method = request.getParameter("method");
		System.out.println(method);
		int currentPage=1;
		if ("scenicList".equals(method)) {// 列表
			try {
				JSONArray scenic = dao.findJSONArray("select * from scenic");
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("admin-scenic.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("scenic".equals(method)) {// 列表
			try {
				JSONArray scenic = dao.findJSONArray("select * from scenic");
				service.outWrite(out, scenic.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("searchScenic".equals(method)) {// 查询
			try {
				JSONArray scenic = dao
						.findJSONArray("select * from scenic where sce_name like '%" + sce.getSceName() + "%'");
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("admin-scenic.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("scenicAdd".equals(method)) {// 增加
			Part part = request.getPart("Savatar");
			String heads_url = service.imagepath(part);
			String img_url = heads_url;
			System.out.println(sce.getRegionId());
			Object[] params = { sce.getSceName(), sce.getRegionId(), img_url, sce.getAddress(), sce.getDescription() };
			try {
				int i = dao.update(
						"INSERT INTO scenic(sce_name,region_id,img_url,address,description) VALUES(?,?,?,?,?)", params);
				if (i > 0) {
					response.sendRedirect("ScenicServlet?method=scenicList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("deleteScenic".equals(method)) {// 删除
			try {
				int i = dao.update("delete from scenic where sce_id=?", sce.getSceId());
				if (i > 0) {
					response.sendRedirect("ScenicServlet?method=scenicList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateScenic".equals(method)) {// 修改
			Object[] params = { sce.getSceId() };
			try {
				JSONObject scenic = dao.findJSONObject("select * from scenic where sce_id = ?", params);
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("admin-scenicUpdate.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("updateScenic1".equals(method)) {// 完成修改
			String img_url = null;
			Part part1 = request.getPart("Savatar");
			if (part1.getSize() > 0) {
				String savepath = service.imagepath(part1);
				img_url = savepath;
			} else {
				img_url = sce.getImgUrl();
			}
			Object[] params = { sce.getSceName(), img_url, sce.getAddress(), sce.getDescription(), sce.getSceId() };
			try {
				int i = dao.update("update scenic set sce_name = ?,img_url=?,address=?,description=? where sce_id=?",
						params);
				if (i > 0) {
					response.sendRedirect("ScenicServlet?method=scenicList");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("scenicCllentList".equals(method)) {// 用户查看列表
			String ctel = (String) request.getSession().getAttribute("ctel");
//			int pageSize=6;
//			String currentPage1 = request.getParameter("currentPage");
//			System.out.println(currentPage1);
//			if(currentPage1!=null) {
//				currentPage=Integer.parseInt(currentPage1);
//			}
//			int pagestart = (currentPage-1)*pageSize;
//			System.out.println(pagestart);
			try {
//				int total=(int) dao.getCount("select count(*) from scenic");
//				int pages=(total%pageSize>0?total/pageSize+1:total/pageSize);
				
				JSONArray scenic = dao.findJSONArray("select IF(ISNULL(c.ctel),'0','1') count,IF(ISNULL(sc.sce_id),'0',CONVERT( COUNT(*) USING UTF8)) num ,s.* from scenic s" + 
						" left join sce_collect sc on s.sce_id=sc.sce_id " + 
						"left join cllent c on c.ctel=sc.ctel "+
						"and c.ctel="+ctel+
						" GROUP BY s.sce_id order by num desc");
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("scenic-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("searchCllentList".equals(method)) {// 用户查看列表
			String ctel = (String) request.getSession().getAttribute("ctel");
			try {
				JSONArray scenic = dao.findJSONArray("select IF(ISNULL(c.ctel),'0','1') count,IF(ISNULL(sc.sce_id),'0',CONVERT( COUNT(*) USING UTF8)) num ,s.* from scenic s " + 
						" left join sce_collect sc on s.sce_id=sc.sce_id " + 
						"left join cllent c on c.ctel=sc.ctel " + 
						"and c.ctel="+ctel+ "  where s.region_id like '%" + sce.getRegionId() + "%' and  s.sce_name like '%" + sce.getSceName() + "%' " + 
						"GROUP BY s.sce_id order by num desc ");
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("scenic-list.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("detailScenic".equals(method)) {// 美食详情
			try {
				JSONObject scenic = dao.findJSONObject("select * from scenic where sce_id=?", sce.getSceId());
				request.setAttribute("scenic", scenic);
				request.getRequestDispatcher("scenic-detail.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

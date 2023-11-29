package com.travel.controller;

import java.io.File;
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
import com.travel.entity.CllentEntity;
import com.travel.service.ObjectService;
/**
 * 我的信息所需servlet
 */
@WebServlet("/InforTwo")
@MultipartConfig
public class InformationTwoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		BaseDao dao = new BaseDaoImpl();
		ObjectService ob = new ObjectService();
		PrintWriter out = response.getWriter();
		CllentEntity cll = ob.setObject(request, CllentEntity.class);
		File[] files = File.listRoots();
		String rootpath = files[files.length - 1].getPath();
//======================================================================================
		String method = request.getParameter("method");
		System.out.println(method);

		if ("queryInfor".equals(method)) {//查询用户个人信息
			String ctel =""+request.getSession().getAttribute("ctel");
			System.out.println(ctel);
			try {
				String sql = "select * from cllent where ctel="+ctel;
				JSONObject cllent = dao.findJSONObject(sql);
//				System.out.println(cllent);
				request.setAttribute("cllent", cllent);
					request.getRequestDispatcher("information2.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if ("updateInfor".equals(method)){//修改个人信息
			
			String ctel = ""+ request.getSession().getAttribute("ctel");
			System.out.println(ctel);
			try {
				Object[] params = { cll.getCllName(), cll.getCsex(), cll.getAge(),cll.getIdCode(), ctel };
				int i = dao.update( "update cllent set cll_name=?,csex=?,age=?,id_code=? where ctel=?",
						params);
				if(i>0){
					System.out.println("修改成功");
					String sql = "insert into log(ctel,time,message) values(?,?,?)";
					Object []params1 = {ctel,ob.getNowTime(),"用户["+ctel+"]修改了个人信息"};
					int j = dao.update(sql, params1);
					if(j>0){
						response.sendRedirect("InforTwo?method=queryInfor");
					}else{
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if("updatePwd".equals(method)){//修改密码
			String ctel = ""+request.getSession().getAttribute("ctel");
			System.out.println(ctel);
			
			try {
				String pwd = request.getParameter("pwd");
				String Cpwd = request.getParameter("Cpwd");
				String sql = "select * from cllent where ctel="+ctel;
				CllentEntity cllent = dao.findBean(CllentEntity.class,sql);
				if(pwd.equals(cllent.getPassword())){
					int i = dao.update("update cllent set password=? where ctel=?",Cpwd,ctel);
					if(i>0){
						System.out.println("修改密码成功");
						Object[] params1 = {ctel,ob.getNowTime(),"用户["+ctel+"]修改了密码"};
						i = dao.update( "insert into log(ctel,time,message) values(?,?,?)", params1);
						if(i>0){
							System.out.println("增加成功");
						}
					}else{
						System.out.println("修改密码失败");
					}
				}else {
					out.write("原密码错误!");
					out.flush();
					out.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

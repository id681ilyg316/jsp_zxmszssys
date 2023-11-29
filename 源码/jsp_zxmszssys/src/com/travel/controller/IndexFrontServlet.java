package com.travel.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.CllentEntity;
import com.travel.service.ObjectService;

/**
 * 首页所需servlet
 */
@WebServlet("/IndexFrontServlet")//前端首页类
public class IndexFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		BaseDao db = new BaseDaoImpl();// 数据库工具类
		ObjectService ob = new ObjectService();// 处理方法
		PrintWriter out = response.getWriter();// ajax返回方法
		HttpSession session = request.getSession();
		CllentEntity cll = ob.setObject(request, CllentEntity.class);
		CllentEntity cllent = new CllentEntity();// 用户信息实体类
		String method = request.getParameter("method");
		System.out.println(method);
		File[] files = File.listRoots();
		String rootpath = files[files.length - 1].getPath();
		// 登录
		if ("login".equals(method)) {// 判断验证码和密码和手机号是否正确
			try {
				String flag = "0";
				// 判断验证码是否正确
				String piccode = (String) request.getSession().getAttribute("piccode");
				String checkcode = request.getParameter("checkcode").toUpperCase();
				System.out.println(piccode + "," + checkcode);

				if (!piccode.equals(checkcode)) {
					flag = "2";
					ob.outWrite(out, flag);
				}
//				// 判断是否有该手机号
				String Ctel = request.getParameter("ctel");
				String sql = "select * from cllent where Ctel=" + Ctel + " and password =" + cll.getPassword();
				cllent = db.findBean(CllentEntity.class, sql);
				if (cllent == null) {
					flag = "1";
					ob.outWrite(out, flag);
				} else {
					session.setAttribute("rootpath", rootpath);
					session.setAttribute("cname", cllent.getCllName());
					session.setAttribute("ctel", cllent.getCtel());
					flag = "3";
					ob.outWrite(out, flag);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if ("registe".equals(method)) {// 注册
			try {
				String flag = "0";
				String sql = "select * from cllent where ctel=" + cll.getCtel();
				cllent = db.findBean(CllentEntity.class, sql);
				if (cllent == null) {// 判断是否以存在该手机号
					sql = "insert into cllent(ctel,password,id_code) values(?,?,?)";
					Object[] params = {cll.getCtel(), cll.getPassword(),ob.getRandom() };
					int i = db.update(sql, params);
					System.out.println(i);
					if (i != 0) {
						flag="2";
						ob.outWrite(out, flag);
					}

				}else {
					flag="1";
					ob.outWrite(out, flag);
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if ("recover".equals(method)) {// 忘记密码
			try {
				String flag = "0";
				String sql = "select * from cllent where Ctel=" + cll.getCtel();
				cllent = db.findBean(CllentEntity.class, sql);

				if (cllent != null) {// 判断是否以存在该手机号
					sql = "select * from cllent where Ctel = ? and id_code=? ";
					cllent = db.findBean(CllentEntity.class, sql,cll.getCtel(),cll.getIdCode());

					if (cllent!=null) {
						flag="2";
						sql = "update cllent set password=? where ctel=?";
						Object[] params = { cll.getPassword(), cll.getCtel() };
						int i = db.update(sql, params);
						sql = "insert into log(ctel,time,message) values(?,?,?)";
						Object[] params1 = { cll.getCtel(), ob.getNowTime(), "用户["+cll.getCtel()+"]重置了密码" };
						int j = db.update(sql, params1);
						if (j > 0) {
							System.out.println("增加成功");
						}
						ob.outWrite(out, flag);
					}else {
						flag="1";
						ob.outWrite(out, flag);
					}
				} else {
					ob.outWrite(out, flag);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else if ("exit".equals(method)) {//退出页面
			request.getSession().removeAttribute("cname");
			request.getSession().removeAttribute("ctel");
			request.getSession().removeAttribute("rootpath");
			response.sendRedirect("indexfront.jsp");
		}

	}

}

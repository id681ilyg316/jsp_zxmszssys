package com.travel.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 生成验证码
 */
@WebServlet("/ImageServlet")//验证码生成类
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedImage bi = new BufferedImage(95, 35, BufferedImage.TYPE_INT_RGB);
		Graphics g=bi.getGraphics();
		Color c= new Color(255,231,147);
		Font font = new Font("Arial",40, 16);
		g.setColor(c);
		g.fillRect(0, 0, 95, 35);
		g.setFont(font);
		
		//字母数字组合
		char[] ch = "23456789".toCharArray();
		Random r= new Random();
		int len = ch.length;
		int index;
		StringBuffer sb = new StringBuffer() ;
		for (int i = 0; i < 4; i++) {
			index=r.nextInt(len);
			g.setColor(new Color(r.nextInt(255),r.nextInt(231),r.nextInt(147)));
			g.drawString(ch[index]+"",(i*20)+2, 25);
			sb.append(ch[index]);
		}
		request.getSession().setAttribute("piccode", sb.toString());
		ImageIO.write(bi, "JPG", response.getOutputStream());
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedImage bi = new BufferedImage(100, 40, BufferedImage.TYPE_INT_RGB);
		Graphics g=bi.getGraphics();
		Color c= new Color(255,231,147);
		g.setColor(c);
		g.fillRect(0, 0, 68, 22);
		
		//字母数字组合
		char[] ch = "23456789".toCharArray();
		Random r= new Random();
		int len = ch.length;
		int index;
		StringBuffer sb = new StringBuffer() ;
		for (int i = 0; i < 4; i++) {
			index=r.nextInt(len);
			g.setColor(new Color(r.nextInt(88),r.nextInt(188),r.nextInt(255)));
			g.drawString(ch[index]+"", (i*15)+3, 18);
			sb.append(ch[index]);
		}
		request.getSession().setAttribute("piccode", sb.toString());
		ImageIO.write(bi, "JPG", response.getOutputStream());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the POST method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
	}

}

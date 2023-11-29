package com.travel.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import com.alibaba.fastjson.JSONObject;




/**
 * @author JJ
 *
 */

public class ObjectService {
	public <T> Object getValue(String value, String type) {
		Object obj = null;
		if (value != null) {
			switch (type) {
			case "Integer":
//				try {
//					obj = new Integer(value);
//				} catch (Exception e) {
//					throw new Exception("转化成Integer对象错误");
//				}
				obj = new Integer(value);
				break;
			case "int":
				obj = Integer.parseInt(value);
				break;
			case "double":
				obj = Double.parseDouble(value);
				break;
			case "Double":
				obj = new Double(value);
				break;
			case "long":
				obj = Long.parseLong(value);
				break;
			case "Long":
				obj = new Long(value);
				break;
			default:
				obj = value;
				break;
			}
		}
		return obj;
	}
	
	public <T> T setObject(HttpServletRequest request, Class<T> clas) {
		//1.获取每一个字段
		Field[] fields = clas.getDeclaredFields();
		
		//2.创建反射的一个实例对象
		T obj = null;
		try {
			obj = clas.newInstance();
			//3.遍历
			for (Field field : fields) {
				//从request中获取值
				
				String value = request.getParameter(field.getName());
//				System.out.println(field.getName());
				if(value!=null){
				//将值对应类型进行转换
				Object objValue = getValue(value, field.getType().getSimpleName());
				
				//字段名称
				String name = field.getName();
				
				String methodName = "set" + name.substring(0, 1).toUpperCase() + name.substring(1);
				
				//set方法
				Method method = clas.getDeclaredMethod(methodName, field.getType());
				
				//将值设置到实例obj中
				method.invoke(obj, objValue);
				}
			}
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		return obj;
	}
	
	/**获得相反性别
	 * @param sex用户的性别
	 * @return 获得相反的性别
	 */
	public String getContrarySex(String sex){
		
		if("男".equals(sex)){
			sex="女";
		}else{
			sex="男";
		}
		return sex;
		
	}
	
	
	/**
	 * @param str json对象key数组
	 * @param str1 json对象vlue数组
	 * @return 一个json形式的验证信息
	 */
	public String getValidation(String []str,String []str1){
		
		JSONObject jsonObject = new JSONObject();
		for (int i = 0; i < str.length; i++) {
			jsonObject.fluentPut(str[i], str1[i]);
		}
		return jsonObject.toString();
		
	}
	
	/**向前端返回信息
	 * @param out
	 * @param str
	 */
	public void outWrite(PrintWriter out,String str){
		out.write(str);
		out.flush();
		out.close();
		
	}
	
	
	/**
	 * 获得当前时间
	 * @return time
	 */
	public String getNowTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(Calendar.getInstance().getTime());
		return time;
		
	}
	
	/**
	 * 获得当前年月日
	 * @return time
	 */
	public String getDateTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(Calendar.getInstance().getTime());
		return time;
		
	}
	/**
	 *根据日期生成随机数
	 * @param part
	 * @return
	 */
	public String getRandom() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String time = format.format(Calendar.getInstance().getTimeInMillis());
		return time;
	}
	
		//设置到实体类
		//根据实体类的类型，将字符串类型转化

	//文件写入-------------------------------------------------------------------------------------------
		public String imagepath(Part part) {
 			String rootpath = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16) +"/"+ "upload"+"/"+"travel";
			File file = new File(rootpath);
			if (file == null || !file.exists()) {
				file.mkdirs();
			}
			String savepath = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16) + "/upload/" + part.getSubmittedFileName();
			InputStream in;
			try {
				in = part.getInputStream();
				OutputStream out = new FileOutputStream(savepath);// 
				// System.out.println(savepath);
				int len = 0;
				byte[] b = new byte[1024 * 4];
				while ((len = in.read(b)) != -1) { 
					out.write(b, 0, len);
				}
				System.out.println("写入成功");
				out.close();
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "/upload/" + part.getSubmittedFileName();
		}
}

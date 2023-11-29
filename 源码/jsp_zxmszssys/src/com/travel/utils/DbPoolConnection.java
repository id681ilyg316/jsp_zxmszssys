package com.travel.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import com.alibaba.druid.pool.DruidDataSourceFactory;

/**
 * 连接池
 */
public class DbPoolConnection {
	//druid-1.1.9.jar:数据源（解决连接问题），（类似于JDBC）
	//commons-dbutils-1.7.jar：操作数据库的，类似于BaseDao
	
	//fastjson-1.2.58.jar:json数据相关包
	private static DbPoolConnection databasePool = null;
	//druid提供的连接数据源。包含了获取connection的一些属性和方法。类似于我们写的JDBC类。
	//私有的，只能通过getter、setter方法获取。
	private static DataSource dds = null;

	static {
		//读取配置文件
		Properties properties = loadPropertyFile("db.properties");
		try {
			dds = DruidDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
	//单例。所以连接池只需要被实例化一次。
	private DbPoolConnection() {}
 

	public static synchronized DbPoolConnection getInstance() {
		if (null == databasePool) {
			databasePool = new DbPoolConnection();
		}
		return databasePool;
	}

	public DataSource getDataSource() throws SQLException {
		return dds;

	}

	//【数据源】获取连接
	public Connection getConnection() throws SQLException {
		return dds.getConnection();
	}

	//加载配置文件
	public static Properties loadPropertyFile(String fullFile) {
		String webRootPath = null;
		if (null == fullFile || fullFile.equals(""))
			throw new IllegalArgumentException(
					"Properties file path can not be null : " + fullFile);
		//获取服务器classes文件夹所在的位置。（所有的Java文件都再classes文件夹下）
		//获取src所在的位置。通过反射得到自己的位置，再得到它的根目录。
		webRootPath = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16);
		//System.out.println(webRootPath);
		InputStream inputStream = null;
		Properties p = null;
		try {
			//fullFile：db.properties
			String profilepath = webRootPath+"/WEB-INF/classes/" + fullFile;
			File file = new File(profilepath);
			if (file == null || !file.exists()) {
				//文件不存在,则拼接上一级路径。Java获取和服务器获取方式有差别。
				//Java获取会产生/%5c的路径，获取上一级路径
				profilepath = new File(webRootPath) + File.separator + fullFile;
				System.out.println(profilepath);
				file = new File(fullFile);
			}
			//System.out.println(profilepath);
			inputStream = new FileInputStream(file);
			p = new Properties();
			//载入
			p.load(inputStream);
		} catch (FileNotFoundException e) {
			throw new IllegalArgumentException("Properties file not found: "
					+ fullFile);
		} catch (IOException e) {
			throw new IllegalArgumentException(
					"Properties file can not be loading: " + fullFile);
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return p;
	}
	public static void main(String[] args) {
		System.out.println(DbPoolConnection.getInstance());
	}
}

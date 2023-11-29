package com.travel.utils;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

/**
 * db操作工具类
 */
public class DBUtilsHelper {
	//数据源
	//DruidDataSource。DruidDataSource继承了DataSource
	private DataSource ds = null;
	//dbutils操作增删改查的一个类
	//增删改查的方法都是写在QueryRunner类中的，用的是反射
	//QueryRunner：相当于BaseDao
	private QueryRunner runner = null;
	
	public DBUtilsHelper() {
		try {
			//初始化数据源（初始化了JDBC）
			this.ds = DbPoolConnection.getInstance().getDataSource();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (this.ds != null) {
				this.runner = new QueryRunner(this.ds);
			}
		}
	}
	
	public DBUtilsHelper(DataSource ds) {
		this.ds = ds;
		this.runner = new QueryRunner(this.ds);

	}

	public QueryRunner getRunner() {
		return this.runner;

	}
	
	
}

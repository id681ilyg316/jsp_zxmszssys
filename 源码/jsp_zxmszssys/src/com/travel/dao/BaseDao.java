package com.travel.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据库操作接口
 */
public interface BaseDao {

	/** 
	 * 获取数据库连接 
	 */ 
	public Connection getConnection() throws SQLException; 

	/** 
	 * 关闭连接 
	 */ 
	public void CloseConnection() throws SQLException; 

	/** 
	 * 执行查询，将某一行的结果保存到Bean中
	 * @param <T> 
	 * @param beanClass 类的反射
	 * @param sql sql语句
	 * @param params 预编译可变参数
	 */
	public <T> T findBean(Class<T> beanClass, String sql, 
			Object... params) throws SQLException; 

	/** 
	 * 执行查询，将每行的结果保存到Bean中，然后将所有Bean保存到List中  <br>
	 * @param beanClass 反射
	 * @param sql sql语句 
	 * @param params 预编译可变参数
	 */ 
	public  <T> List<T> findList(Class<T> beanClass, String sql, 
			Object... params) throws SQLException ; 


	/** 
	 * 查询记录总条数 
	 * @param sql sql语句 
	 * @return 记录总数 
	 */ 
	public long getCount(String sql, Object... params) throws SQLException; 


	/** 
	 * 执行INSERT/UPDATE/DELETE语句 
	 * @param sql sql语句
	 * @param params 预编译可变参数
	 */ 
	public int update(String sql, Object... params)throws SQLException; 

	/** 
	 * 批量执行指定的SQL语句 .效率高.
	 * @param sql 
	 * @param params 批量执行的二维数组参数列表
	 */ 
	public int[] batch(String sql, Object[][] params) throws SQLException; 
	
	/**
	 * 查询条件所有的值，查询【多条】数据，不包括字段。
	 * @param sql 
	 * @param params 
	 */
	public List<Object[]> findObjectList(String sql, Object... params) throws SQLException;
	
	/**
	 * 查询条件所有的值，查询【一条】数据
	 * @param sql
	 * @param params
	 */
	public Object[] findObject(String sql, Object... params) throws SQLException;
	
	/**
	 * 查询条件所有的值，查询【多条】数据，每一条数据包括字段和值，存入map中
	 * @param sql
	 * @param params
	 */
	public List<Map<String, Object>> findMapList(String sql, Object... params) throws SQLException;
	
	/**
	 * 查询条件所有的值，查询【一条】数据，每一条数据包括字段和值，存入map中
	 * @param sql
	 * @param params
	 */
	public Map<String, Object> findMap(String sql, Object... params) throws SQLException;
	
	/**
	 * 查询一条数据，并且组装成一个json对象，与实体类无关，可做多表查询。
	 * @param sql
	 * @param params
	 */
	public JSONObject findJSONObject(String sql, Object... params) throws SQLException;
	
	/**
	 * 查询多条数据，并且组装成一个json数组，与实体类无关，可做夺标查询。
	 * @param sql
	 * @param params
	 */
	public JSONArray findJSONArray(String sql, Object... params) throws SQLException;
} 

package com.travel.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.travel.utils.DBUtilsHelper;

public class BaseDaoImpl implements BaseDao {

//	ArrayHandler：把结果集中的第一行数据转成对象数组。
//	ArrayListHandler：把结果集中的每一行数据都转成一个对象数组，再存放到List中。
//	BeanHandler：将结果集中的第一行数据封装到一个对应的JavaBean实例中。
//	BeanListHandler：将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
//	ColumnListHandler：将结果集中某一列的数据存放到List中。
//	KeyedHandler：将结果集中的每一行数据都封装到一个Map里，然后再根据指定的key把每个Map再存放到一个Map里。
//	MapHandler：将结果集中的第一行数据封装到一个Map里，key是列名，value就是对应的值。
//	MapListHandler：将结果集中的每一行数据都封装到一个Map里，然后再存放到List。
//	ScalarHandler：将结果集中某一条记录的其中某一列的数据存成Object。
	
	JSONObject jsonObject = new JSONObject();
	
	JSONArray jsonArray = new JSONArray();
	
	public static QueryRunner runner = null;
	static {
		runner = new DBUtilsHelper().getRunner();
	}

	//获取数据源连接
	public Connection getConnection() throws SQLException {
		return runner.getDataSource().getConnection();
	}

	//关闭数据源连接
	public void CloseConnection() throws SQLException {
		runner.getDataSource().getConnection().close();
	}

	public <T> T findBean(Class<T> beanClass, String sql, Object... params) throws SQLException {
		return runner.query(sql, new BeanHandler<T>(beanClass), params);
	}

	public <T> List<T> findList(Class<T> beanClass, String sql, Object... params) throws SQLException {
		return runner.query(sql, new BeanListHandler<T>(beanClass), params);
	}

	public long getCount(String sql, Object... params) throws SQLException {
		return (Long)runner.query(sql, new ScalarHandler<Object>(), params);
	}

	public int count(String sql) throws SQLException {
		return (Integer)runner.query(sql, new ScalarHandler<Object>());
	}

	public int update(String sql, Object... params) throws SQLException {
		return runner.update(sql, params);
	}

	public int[] batch(String sql, Object[][] params) throws SQLException {
		return runner.batch(sql, params);
	}

	@Override
	public List<Object[]> findObjectList(String sql, Object... params) throws SQLException {
		return runner.query(sql, new ArrayListHandler(), params);
	}

	@Override
	public Object[] findObject(String sql, Object... params) throws SQLException {
		return runner.query(sql, new ArrayHandler(), params);
	}

	@Override
	public List<Map<String, Object>> findMapList(String sql, Object... params) throws SQLException {
		return runner.query(sql, new MapListHandler(), params);
	}

	@Override
	public Map<String, Object> findMap(String sql, Object... params) throws SQLException {
		return runner.query(sql, new MapHandler(), params);
	}

	@Override
	public JSONObject findJSONObject(String sql, Object... params) throws SQLException {
		Map<String, Object> map = findMap(sql, params);
		jsonObject.clear();
		for (String key : map.keySet()) {
			jsonObject.fluentPut(key, map.get(key));
		}
		return jsonObject;
	}

	@Override
	public JSONArray findJSONArray(String sql, Object... params) throws SQLException {
		List<Map<String, Object>> maps = findMapList(sql, params);
		jsonArray.clear();
		for (Map<String, Object> map : maps) {
			JSONObject jsonObject = new JSONObject();
			for (String key : map.keySet()) {
				jsonObject.fluentPut(key, map.get(key));
			}
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
}

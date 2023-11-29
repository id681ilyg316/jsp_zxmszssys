package com.travel.test;

import java.sql.SQLException;

import com.travel.dao.BaseDao;
import com.travel.dao.BaseDaoImpl;
import com.travel.entity.UsersEntity;

public class test {
	public static void main(String[] args) {
		BaseDao dao = new BaseDaoImpl();
		try {
		UsersEntity use = dao.findBean(UsersEntity.class,"select * from users");
		System.out.println(use);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

package com.ct.test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConn {
	public String DRIVER_STRING="oracle.jdbc.driver.OracleDriver";
	public String CONN_STRING="jdbc:oracle:thin:@localhost:1521:orcl";
	
	public Connection getConn(){
		Connection conn = null;
		try{
			Class.forName(DRIVER_STRING);
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(CONN_STRING,"mfh","mfh");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	
}
	


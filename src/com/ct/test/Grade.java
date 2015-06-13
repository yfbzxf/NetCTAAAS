 package com.ct.test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Grade {

	
	public static void main(String[]args){
		int match =0;
		DbConn db=new DbConn();
		Connection conn=db.getConn();
		//4
		String sql="SELECT * from account";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);	
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				match++;				
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		System.out.print(match);
		
	
	}

}

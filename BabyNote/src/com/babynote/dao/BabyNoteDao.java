package com.babynote.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BabyNoteDao {
	
	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/baby_note";
	String dbid = "root";
	String dbpw = "nmop1019";

	public Connection openConnection(){
		
		try{	

		    Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,dbid,dbpw);		
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("erorr");
		}
		return conn;
	}
	
	public void closeConnection(){
		try{
			if(!conn.isClosed()) conn.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}	
}

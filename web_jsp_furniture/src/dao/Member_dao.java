package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Member_dto;

public class Member_dao {
	Connection 			con = null;
	PreparedStatement 	ps = null;
	ResultSet 			rs = null;
	
	public int memberUpdate(Member_dto dto) {
		int result = 0;
		String query = 	"update homepage_김세훈_member set name='"+dto.getName()+"',area='"+dto.getArea()+"',address='"+dto.getAddress()+"', "+
						"tel_1='"+dto.getTel_1()+"',tel_2 = '"+dto.getTel_2()+"',tel_3 = '"+dto.getTel_3()+"',gen = '"+dto.getGen()+"',\r\n" + 
						"hobby_travel='"+dto.getHobby_traval()+"',hobby_reading='"+dto.getHobby_reading()+"',hobby_sports = '"+dto.getHobby_sports()+"'where id = '"+dto.getId()+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
	
	public Member_dto getMemberView(String id) {
		Member_dto dto = null;
		String query = "select id, name, password, area, address, tel_1, tel_2, tel_3, gen, hobby_travel, hobby_reading, hobby_sports, to_char(reg_date,'yyyy-MM-dd') as reg_date\r\n" + 
				"from homepage_김세훈_member where id = '"+id+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String password = rs.getString("password");
				String area = rs.getString("area");
				String address = rs.getString("address");
				String tel_1 = rs.getString("tel_1");
				String tel_2 = rs.getString("tel_2");
				String tel_3 = rs.getString("tel_3");
				String gen = rs.getString("gen");
				String hobby_travel = rs.getString("hobby_travel");
				String hobby_reading = rs.getString("hobby_reading");
				String hobby_sports = rs.getString("hobby_sports");
				String reg_date = rs.getString("reg_date");
				
				dto = new Member_dto(id, name, password, area, address, tel_1, tel_2, tel_3, gen, hobby_travel, hobby_reading, hobby_sports, reg_date, "", "", "");
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dto;
	}
	
	public int memberSave(Member_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_member\r\n" + 
				"(id, name, password, area, address, tel_1, tel_2, tel_3, gen, hobby_travel, hobby_reading, hobby_sports, reg_date)\r\n" + 
				"values\r\n" + 
				"('"+dto.getId()+"', '"+dto.getName()+"', '"+dto.getPassword()+"', '"+dto.getArea()+"', '"+dto.getAddress()+"', " + 
				"'"+dto.getTel_1()+"', '"+dto.getTel_2()+"', '"+dto.getTel_3()+"','"+dto.getGen()+"', '"+dto.getHobby_traval()+"', " + 
				"'"+dto.getHobby_reading()+"', '"+dto.getHobby_sports()+"', '"+dto.getReg_date()+"')";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println("memberSave query\n" + query);
		return result;
	}
	
	public ArrayList<String> getCheckLogin(String t_id, String t_pw) {
		ArrayList<String> info = new ArrayList<>();;
		String query = "select name, level_gubun from homepage_김세훈_member\r\n" + 
				"where exit_gubun = 'in' and id = '"+t_id+"' and password = '"+t_pw+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				info.add(rs.getString(1));
				info.add(rs.getString(2));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return info;
	}
}

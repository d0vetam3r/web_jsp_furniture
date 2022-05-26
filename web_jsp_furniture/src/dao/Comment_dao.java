package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Comment_dto;

public class Comment_dao {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public int deleteCmt(String no, String reg_id) {
		int result = 0;
		String query = "delete homepage_김세훈_comment where no='"+no+"' and reg_id='"+reg_id+"'";
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
	
	public int updateCmt(String no, String content, String reg_id) {
		int result = 0;
		String query = "update homepage_김세훈_comment set content='"+content+"'\r\n" + 
				"where no='"+no+"' and reg_id='"+reg_id+"'";
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
	
	public ArrayList<Comment_dto> getComment(String no){
		ArrayList<Comment_dto> dtos = new ArrayList<>();
		String query = "select content, reg_id, to_char(reg_date,'yyyy-MM-dd')as reg_date\r\n" + 
				"from homepage_김세훈_comment where no='"+no+"' order by to_number(reg_order) desc";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				String content = rs.getNString(1);
				String reg_id = rs.getNString(2);
				String reg_date = rs.getNString(3);
				
				Comment_dto dto = new Comment_dto("",0,content, reg_id,reg_date);
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}
	
	public int chkId(String no, String reg_id) {
		int result = 0;
		String query = "select count(*) from homepage_김세훈_comment\r\n" + 
				"where no='"+no+"' and reg_id='"+reg_id+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	public int saveCmt(Comment_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_comment\r\n" + 
				"(no,reg_order,content,reg_id,reg_date)\r\n" + 
				"values ('"+dto.getNo()+"',"+dto.getReg_order()+",'"+dto.getContent()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')";
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
		System.out.println(query);
		return result;
		
	}
	
	//댓글번호 최댓값 조회
	public int getMaxOrder(String no) {
		int result = 0;
		String query = "select nvl(max(reg_order),0) from homepage_김세훈_comment where no='" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
}

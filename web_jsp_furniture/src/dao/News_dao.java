package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBConnection;
import dto.News_dto;

public class News_dao {
	Connection			con	= null;
	PreparedStatement 	ps 	= null;
	ResultSet 			rs 	= null;
	
	public int saveNews(News_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_news\r\n" + 
				"(no,title,content,attach,reg_id,reg_date) values\r\n" + 
				"('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','','"+dto.getReg_info()+"','"+dto.getReg_date()+"')";
		
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
	
	public String getMaxNo() {
		String result = null;
		String query = "select nvl(max(no),'n000') from homepage_김세훈_news";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}
}

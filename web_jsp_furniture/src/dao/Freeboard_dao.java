package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Freeboard_dto;


public class Freeboard_dao {
	Connection			con	= null;
	PreparedStatement 	ps 	= null;
	ResultSet 			rs 	= null;
	
	public String idName(String reg_id) {
		String result = "";
		String query = "select name from homepage_김세훈_member where id='"+reg_id+"'";
		
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
	
	public int updateFree(String title, String content, String reg_date, String no) {
		int result = 0;
		String query = "update homepage_김세훈_freeboard set title='" + title + "',content='" + content + "',reg_date='"
				+ reg_date + "' where no='" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.getConnection();
		}

		return result;
	}
	
	public int deleteFree(String no) {
		int result = 0;
		String query = "delete homepage_김세훈_freeboard where no ='"+no+"'";
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
	
	public int updateHit(String hit, String no) {
		int result = 0;
		int temp = Integer.parseInt(hit);
		temp++;
		String query = "update homepage_김세훈_freeboard set hit = '" + temp + "' where no = '" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);
		return result;
	}

	public Freeboard_dto getView(String no) {
		Freeboard_dto dto = null;
		String query = "select no, title, content, reg_id,to_char(reg_date,'yyyy-MM-dd') as reg_date, hit\r\n"
				+ "from homepage_김세훈_freeboard where no = '" + no + "'";
		String hit = "";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			if (rs.next()) {
				String title = rs.getString(2);
				String content = rs.getString(3);
				String reg_info = rs.getString(4);
				String reg_date = rs.getString(5);
				hit = rs.getString(6);

				dto = new Freeboard_dto(no, title, content, hit, reg_info, reg_date);
			}
			if (dto != null) {
				int update = updateHit(hit, no);
				if (update == 1) {
					System.out.println("업데이트 성공. 조회수 : " + hit);
				} else {
					System.out.println("삭제해라 애송이");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	
	public int getTotalCount(String select, String search) {
		int result = 0;
		String query = "select count(*) from homepage_김세훈_freeboard where " + select + " like '%" + search + "%'";
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
	
	// 전체목록(페이징)
	public ArrayList<Freeboard_dto> getNoticeListPaging(String select, String search, int start, int end) {
		ArrayList<Freeboard_dto> dtos = new ArrayList<>();
		;
		String query = "select * from(select tbl.*, rownum as rnum from(select no,title,content,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n"
				+ "as reg_date,hit from homepage_김세훈_freeboard where " + select + " like '%" + search
				+ "%' order by no desc)tbl) where rnum>=" + start + " and rnum<=" + end + "";

		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String reg_info = rs.getString(4);
				String reg_date = rs.getString(5);
				String hit = rs.getString(6);

				Freeboard_dto dto = new Freeboard_dto(no, title, content, hit, reg_info, reg_date);
				dtos.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);
		return dtos;
	}
	public String getMaxNo() {
		String result = null;
		String query = "select nvl(max(no),'f000') from homepage_김세훈_freeboard";
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
	
	public int saveFree(Freeboard_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_freeboard\r\n" + 
				"(no,title,content,reg_id,reg_date) values\r\n" + 
				"('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')";
		
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
}

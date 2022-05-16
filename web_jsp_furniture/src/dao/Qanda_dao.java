package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Qanda_dto;

public class Qanda_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public void updateHit(String hit, String no) {

		int temp = Integer.parseInt(hit);
		temp++;
		String query = "update homepage_김세훈_qanda set hit = '" + temp + "' where no = '" + no + "'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);
	}
	
	public int getTotalCount(String select, String search) {
		int result = 0;
		String query = "select count(*) from homepage_김세훈_qanda where " + select + " like '%" + search + "%'";
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
	
	
	public String getWriter(String no) {
		String result = "";
		String query = "select reg_id from homepage_김세훈_qanda\r\n" + 
				"where no like '"+no+"'";
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
	
	public int checkJogun(String no) {
		int result = 0;
		String query = "select count(*) from homepage_김세훈_qanda\r\n" + 
				"where is_guest = 'n' and pub_pri = 'private' and no like '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
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
	
	//상세보기 정보 미리로딩, 권한확인용
	public Qanda_dto checkPriPub(String no) {
		Qanda_dto dto = null;
		String query = 	"select no,title,content,attach,hit,reg_id,to_char(reg_date,'yyyy-MM-dd')as reg_date,\r\n" + 
						"is_guest,guest_id,guest_pw,pub_pri from homepage_김세훈_qanda where no='"+no+"'";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String hit = rs.getString(5);
				String reg_info = rs.getString(6);
				String reg_date = rs.getString(7);
				String is_guest = rs.getString(8);
				String guest_id = rs.getString(9);
				String guest_pw = rs.getString(10);
				String pub_pri = rs.getString(11);
				dto = new Qanda_dto(no,title,content,attach,hit,reg_info,reg_date,is_guest,guest_id,guest_pw,pub_pri);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);
		return dto;
	}
	
	public String getDbPw(String no) {
		String result = "";
		String query = "select guest_pw from homepage_김세훈_qanda where no='"+no+"'";
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
	
	public ArrayList<Qanda_dto> getQandaListPaging(String select, String search, int start, int end){
		ArrayList<Qanda_dto> dtos = new ArrayList<>();
		String query = 	"select * from(select tbl.*, rownum as rnum from(select no,title,content,attach,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n" + 
						"as reg_date,hit,pub_pri,is_guest,guest_id from homepage_김세훈_qanda\r\n" + 
						"where "+select+" like '%"+search+"%' order by no desc)tbl) where rnum>=" + start + " and rnum<=" + end + "";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String reg_info = rs.getString(5);
				String reg_date = rs.getString(6);
				String hit = rs.getString(7);
				String pub_pri = rs.getString(8);
				String is_guest = rs.getString(9);
				String guest_id = rs.getString(10);
				Qanda_dto dto = new Qanda_dto(no,title,content,attach,hit,reg_info,reg_date,is_guest,guest_id,"",pub_pri);
				dtos.add(dto);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println("paging query : " + query);
		return dtos;
	}
	
	public ArrayList<Qanda_dto> getQandaList(){
		ArrayList<Qanda_dto> dtos = new ArrayList<>();;
		String query = 	"select no,title,content,attach,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n" + 
						"as reg_date,hit,pub_pri,is_guest from homepage_김세훈_qanda order by no desc";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String reg_info = rs.getString(5);
				String reg_date = rs.getString(6);
				String hit = rs.getString(7);
				String pub_pri = rs.getString(8);
				String is_guest = rs.getString(9);
				Qanda_dto dto = new Qanda_dto(no,title,content,attach,hit,reg_info,reg_date,is_guest,"","",pub_pri);
				dtos.add(dto);
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}

	public int insertQandaGuest(Qanda_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_qanda\r\n"
				+ "(no,title,content,reg_id,reg_date,is_guest,guest_id,guest_pw,pub_pri)\r\n" + "values\r\n" + "('"
				+ dto.getNo() + "','" + dto.getTitle() + "','" + dto.getContent() + "','" + dto.getReg_info() + "','"
				+ dto.getReg_date() + "','" + dto.getIs_guest() + "','" + dto.getGuest_id() + "','" + dto.getGuest_pw() + "','"+dto.getPub_pri()+"')";

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

	public String getMaxNo() {
		String result = null;
		String query = "select nvl(max(no),'q000') from homepage_김세훈_qanda";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		System.out.println(query);
		return result;
	}
}
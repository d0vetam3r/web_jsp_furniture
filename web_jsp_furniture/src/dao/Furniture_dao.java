package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Furniture_dto;

public class Furniture_dao {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<Furniture_dto> getFurnitureList(){
		ArrayList<Furniture_dto> dtos = new ArrayList<>();
		String query = "select * from(select tbl.*, rownum as rnum from(\r\n" + 
				"select p_name, p_size, attach,img_order from homepage_김세훈_furniture\r\n" + 
				"order by img_order)tbl) where rnum>=1 and rnum<=6";
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString(1);
				String size = rs.getString(2);
				String attach = rs.getString(3);
				Furniture_dto dto = new Furniture_dto("",name,size,attach,"","","");
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
	
	public int UpdateFurn(Furniture_dto dto) {
		int result = 0;
		String query = "update homepage_김세훈_furniture set p_name='"+dto.getName()+"',\r\n" + 
				"p_size='"+dto.getSize()+"',img_order='"+dto.getOrder()+"',attach='"+dto.getAttach()+"' where no='"+dto.getNo()+"'";
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
	
	public int deleteFurniture(String no) {
		int result = 0;
		String query = "delete from homepage_김세훈_furniture where no='"+no+"'";
		
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
	
	public Furniture_dto getView(String no){
		Furniture_dto dto = null;
		String query = "select no,p_name,p_size,attach,img_order,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n" + 
				"from homepage_김세훈_furniture where no='"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				String title = rs.getString(2);
				String size = rs.getString(3);
				String attach = rs.getString(4);
				String img_order = rs.getString(5);
				String reg_id = rs.getString(6);
				String reg_date = rs.getString(7);

				dto = new Furniture_dto(no, title, size, attach, img_order, reg_id, reg_date);
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
	
	public int getTotalCount() {
		int result = 0;
		String query = "select count(*)from homepage_김세훈_furniture";
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
	
	// 전체목록
		public ArrayList<Furniture_dto> getFurnitureListPaging(int start, int end) {
			ArrayList<Furniture_dto> dtos = new ArrayList<>();
			;
			String query = 	"select * from(select tbl.*, rownum as rnum from(\r\n" + 
					"select no,p_name,p_size,attach,img_order,reg_id,to_char(reg_date,'yyyy-MM-dd')\r\n" + 
					"from homepage_김세훈_furniture order by no desc)tbl) where rnum>="+start+" and rnum<="+end+"";

			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();

				while (rs.next()) {
					String no = rs.getString(1);
					String title = rs.getString(2);
					String size = rs.getString(3);
					String attach = rs.getString(4);
					String img_order = rs.getString(5);
					String reg_id = rs.getString(6);
					String reg_date = rs.getString(7);

					Furniture_dto dto = new Furniture_dto(no, title, size, attach, img_order, reg_id, reg_date);
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
	
	public int saveFurni(Furniture_dto dto) {
		int result = 0;
		String query = "insert into homepage_김세훈_furniture\r\n" + 
				"values('"+dto.getNo()+"','"+dto.getName()+"','"+dto.getSize()+
				"','"+dto.getAttach()+"','"+dto.getOrder()+"','"+dto.getId()+"','"+dto.getDate()+"')";
		
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
		String result = "";
		String query = "select nvl(max(no),'I000') from homepage_김세훈_furniture";
		
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
		System.out.println("maxNo : " + result);
		return result;
	}

}

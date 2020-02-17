package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Chh;
import model.ChhListView;
import model.Fnq;
import model.FnqListView;
import util.JdbcUtil;

public class ChhDao {
	
	public void insert(Connection conn, Chh chh) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into charge_history (ch_way,ch_price,ch_time,u_id)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, chh.getCh_way());
			pstmt.setInt(2, chh.getCh_price());
			pstmt.setTimestamp(3, 
					new Timestamp(chh.getCh_time().getTime()));
			pstmt.setString(4, chh.getU_id());
			
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Chh selectById(Connection conn, int ch_code) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Chh chh = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from charge_history where ch_code = ?");
			pstmt.setInt(1, ch_code);
			rs = pstmt.executeQuery();
			if (rs.next()){
				chh = new Chh(); 
				chh.setCh_code(rs.getInt(1));
				chh.setCh_way(rs.getString(2));
				chh.setCh_price(rs.getInt(3));
				chh.setCh_time(rs.getTimestamp(4));
				chh.setU_id(rs.getString(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return chh;
	}
	
	public List<Chh> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Chh chh = null; 
		List<Chh> chhs = new ArrayList<Chh>();
		try {
			pstmt = conn.prepareStatement
			("select * from charge_history where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				chh = new Chh(); 
				chh.setCh_code(rs.getInt(1));
				chh.setCh_way(rs.getString(2));
				chh.setCh_price(rs.getInt(3));
				chh.setCh_time(rs.getTimestamp(4));
				chh.setU_id(rs.getString(5));
				chhs.add(chh);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return chhs;
	}
	
	public void update(Connection conn, Chh chh) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update charge_history set ch_way=?,ch_price=?,ch_time=?, "
					+ "   u_history=? where ch_code=?");
			pstmt.setString(1, chh.getCh_way());
			pstmt.setInt(2, chh.getCh_price());
			pstmt.setTimestamp(3, new Timestamp(chh.getCh_time().getTime()));
			pstmt.setString(4, chh.getU_id());
			pstmt.setInt(5, chh.getCh_code());
			pstmt.executeUpdate(); 
		} catch (SQLException e){ 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int ch_code) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from charge_history where ch_code = ?");
			pstmt.setInt(1, ch_code);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from charge_history");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Chh> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Chh> chhList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from charge_history ");			
			rs  = pstmt.executeQuery(); 
			chhList = new ArrayList<Chh>();
			while (rs.next()){
				Chh chh = new Chh();
				chh.setCh_code(rs.getInt(1));
				chh.setCh_way(rs.getString(2));
				chh.setCh_price(rs.getInt(3));
				chh.setCh_time(rs.getTimestamp(4));
				chh.setU_id(rs.getString(5));
				chhList.add(chh);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return chhList;
	}
	
	
	//페이징
	
	public int selectCountU_id(Connection conn, String u_id) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from charge_history where u_id like '"+u_id+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	   private static final int MOVIE_COUNT_PER_PAGE = 6;

		public ChhListView getChhList(Connection conn, int pageNumber, String u_id)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int chhTotalCount = selectCountU_id(conn, u_id); //카운트 픽스 필요
			List<Chh> chhList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (chhTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					chhList = selectList(conn, firstRow, endRow, u_id);
				} else {
					currentPageNumber = 0;
					chhList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ChhListView(chhList,chhTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Chh> selectList(Connection conn, int firstRow, int endRow, String u_id) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Chh> chhList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from charge_history where u_id like ? limit ?,?");
				pstmt.setString(1, u_id);
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				chhList = new ArrayList<Chh>();
				while (rs.next()){
					Chh chh = new Chh();
					chh.setCh_code(rs.getInt(1));
					chh.setCh_way(rs.getString(2));
					chh.setCh_price(rs.getInt(3));
			 		chh.setCh_time(rs.getTimestamp(4));
			 		chh.setU_id(rs.getString(5));
					chhList.add(chh);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return chhList;
		}

}

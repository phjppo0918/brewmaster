package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Mark;
import model.MarkListView;

import util.JdbcUtil;

public class MarkDao {
	
	public void insert(Connection conn, Mark mark) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into mark (u_id,p_no,p_image,p_name,p_price,mark_time)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, mark.getU_id());
			pstmt.setInt(2, mark.getP_no());
			pstmt.setString(3, mark.getP_image());
			pstmt.setString(4, mark.getP_name());
			pstmt.setInt(5, mark.getP_price());	
			pstmt.setTimestamp(6, 
					new Timestamp(mark.getMark_time().getTime()));
			
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int chackIn(Connection conn,String u_id ,int p_no)
			throws SQLException  {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM mark WHERE (u_id like ? and p_no = ?)");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {//일치하는 아이디가 있으면
				return 1; //1을 리턴
			}else {
				return 0; //아니면, 0을 리턴
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}		
		return -2; //db오류
	   
	}
	
	
	public Mark selectById(Connection conn,String u_id ,int p_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Mark mark = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from mark where (u_id like ? and p_no like ?) ");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()){
				mark = new Mark(); 
				mark.setU_id(rs.getString(1));
				mark.setP_no(rs.getInt(2));
				mark.setP_image(rs.getString(3));
				mark.setP_name(rs.getString(4));
				mark.setP_price(rs.getInt(5));
				mark.setMark_time(rs.getTimestamp(6));
				
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return mark;
	}
	
	public List<Mark> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Mark mark = null; 
		List<Mark> marks = new ArrayList<Mark>();
		try {
			pstmt = conn.prepareStatement
			("select * from mark where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				mark = new Mark(); 
				mark.setU_id(rs.getString(1));
				mark.setP_no(rs.getInt(2));
				mark.setP_image(rs.getString(3));
				mark.setP_name(rs.getString(4));
				mark.setP_price(rs.getInt(5));
				mark.setMark_time(rs.getTimestamp(6));
				marks.add(mark);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return marks;
	}
	
	public void update(Connection conn, Mark mark) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update mark set ch_way=?,ch_price=?,ch_time=?, "
					+ "   u_history=? where ch_code=?");
			pstmt.setString(1, mark.getU_id());
			pstmt.setInt(2, mark.getP_no());
			pstmt.setString(3, mark.getP_image());
			pstmt.setString(4, mark.getP_name());
			pstmt.setInt(5, mark.getP_price());	
			pstmt.setTimestamp(6, 
					new Timestamp(mark.getMark_time().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){ 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String u_id, int p_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from mark where (u_id like ? and p_no = ?)");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, p_no);
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
			rs = stmt.executeQuery("select count(*) from mark");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Mark> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Mark> markList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from mark ");			
			rs  = pstmt.executeQuery(); 
			markList = new ArrayList<Mark>();
			while (rs.next()){
				Mark mark = new Mark();
				mark.setU_id(rs.getString(1));
				mark.setP_no(rs.getInt(2));
				mark.setP_image(rs.getString(3));
				mark.setP_name(rs.getString(4));
				mark.setP_price(rs.getInt(5));
				mark.setMark_time(rs.getTimestamp(6));
				markList.add(mark);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return markList;
	}
	
	
	//페이징
	
	public int selectCountU_id(Connection conn, String u_id) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from mark where u_id like '"+u_id+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	   private static final int MOVIE_COUNT_PER_PAGE = 6;

		public MarkListView getMarkList(Connection conn, int pageNumber, String u_id)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int markTotalCount = selectCountU_id(conn, u_id); //카운트 픽스 필요
			List<Mark> markList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (markTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					markList = selectList(conn, firstRow, endRow, u_id);
				} else {
					currentPageNumber = 0;
					markList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new MarkListView(markList,markTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Mark> selectList(Connection conn, int firstRow, int endRow, String u_id) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Mark> markList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from mark where u_id like ? limit ?,?");
				pstmt.setString(1, u_id);
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				markList = new ArrayList<Mark>();
				while (rs.next()){
					Mark mark = new Mark();
					mark.setU_id(rs.getString(1));
					mark.setP_no(rs.getInt(2));
					mark.setP_image(rs.getString(3));
					mark.setP_name(rs.getString(4));
					mark.setP_price(rs.getInt(5));
					mark.setMark_time(rs.getTimestamp(6));
					markList.add(mark);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return markList;
		}

}

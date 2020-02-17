package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import model.Fnq;
import model.FnqListView;
import model.User;
import model.UserListView;
import util.JdbcUtil;


public class FnqDao {	
	
	public void insertAns(Connection conn, Fnq fnq) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update fnq set fnq_ans=?, fnq_ans_time=?, fnq_ans_ck=? where fnq_no=?");
			pstmt.setString(1, fnq.getFnq_ans());
			pstmt.setTimestamp(2, 
					new Timestamp(fnq.getFnq_ans_time().getTime()));
			pstmt.setString(3, "답변완료");
			pstmt.setInt(4, fnq.getFnq_no());
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
	}
	
	public void insert(Connection conn, Fnq fnq) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		
		try {
			pstmt = conn.prepareStatement
			("insert into fnq (u_id,fnq_type,fnq_title,fnq_con,fnq_time)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, fnq.getU_id());
			pstmt.setString(2, fnq.getFnq_type());
			pstmt.setString(3, fnq.getFnq_title());
			pstmt.setString(4, fnq.getFnq_con());
			pstmt.setTimestamp(5, 
					new Timestamp(fnq.getFnq_time().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Fnq selectById(Connection conn, int fnq_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Fnq fnq = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from fnq where fnq_no = ?");
			pstmt.setInt(1, fnq_no);
			rs = pstmt.executeQuery();
			if (rs.next()){
				fnq = new Fnq(); 
				fnq.setFnq_no(rs.getInt(1));
				fnq.setU_id(rs.getString(2));
				fnq.setFnq_type(rs.getString(3));
		 		fnq.setFnq_title(rs.getString(4));
		 		fnq.setFnq_con(rs.getString(5));
		 		fnq.setFnq_time(rs.getTimestamp(6));
		 		fnq.setFnq_ans(rs.getString(7));
		 		fnq.setFnq_ans_time(rs.getTimestamp(8));
		 		fnq.setFnq_ans_ck(rs.getString(9));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return fnq;
	}
	
	public List<Fnq> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Fnq fnq = null; 
		List<Fnq> fnqs = new ArrayList<Fnq>();
		try {
			pstmt = conn.prepareStatement
			("select * from fnq where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				fnq = new Fnq(); 
				fnq.setFnq_no(rs.getInt(1));
				fnq.setU_id(rs.getString(2));
				fnq.setFnq_type(rs.getString(3));
		 		fnq.setFnq_title(rs.getString(4));
		 		fnq.setFnq_con(rs.getString(5));
		 		fnq.setFnq_time(rs.getTimestamp(6));
		 		fnq.setFnq_ans(rs.getString(7));
		 		fnq.setFnq_ans_time(rs.getTimestamp(8));
		 		fnq.setFnq_ans_ck(rs.getString(9));
				fnqs.add(fnq);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return fnqs;
	}
	public int updateAns(Connection conn, Fnq fnq) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update fnq set fnq_ans=?, fnq_ans_time=?, fnq_ans_ck=? where fnq_no=?");
			
			pstmt.setString(1, fnq.getFnq_ans());
			pstmt.setTimestamp(2, 
					new Timestamp(fnq.getFnq_ans_time().getTime()));
			pstmt.setString(3, fnq.getFnq_ans_ck());
			pstmt.setInt(4, fnq.getFnq_no());
			
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	/*
	public int update(Connection conn, Fnq fnq) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update fnq set fnq_name_kr=?, fnq_name_en=?,"
					+ " fnq_kind=?, fnq_price=?, fnq_country=?,fnq_alchol=?"
					+ " fnq_suger=?, fnq_carbonic=?, fnq_detail=?,fnq_explain=?"
					+ "fnq_socre=?, fnq_image=?, fnq_maker=? where fnq_no=?");
			pstmt.setInt(1, fnq.getFnq_no());
			pstmt.setString(2, fnq.getFnq_name_en());
			pstmt.setString(3, fnq.getFnq_kind());
			pstmt.setInt(4, fnq.getFnq_price());
			pstmt.setString(5, fnq.getFnq_country());
			pstmt.setDouble(6, fnq.getFnq_alchol());
			pstmt.setInt(7, fnq.getFnq_suger());
			pstmt.setInt(8, fnq.getFnq_carbonic());
			pstmt.setString(9, fnq.getFnq_detail());
			pstmt.setString(10, fnq.getFnq_explain());
			pstmt.setString(11, fnq.getFnq_image());
			pstmt.setString(12, fnq.getFnq_maker());
			pstmt.setTimestamp(13, 
					new Timestamp(fnq.getFnq_time().getTime()));
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	*/
	
	public int deleteById(Connection conn, int fnq_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 	
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("delete from fnq where fnq_no = ?");
			pstmt.setInt(1, fnq_no);
			count = pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from fnq");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Fnq> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Fnq> fnqList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from fnq ");			
			rs  = pstmt.executeQuery(); 
			fnqList = new ArrayList<Fnq>();
			while (rs.next()){
				Fnq fnq = new Fnq(); 
				fnq.setFnq_no(rs.getInt(1));
				fnq.setU_id(rs.getString(2));
				fnq.setFnq_type(rs.getString(3));
		 		fnq.setFnq_title(rs.getString(4));
		 		fnq.setFnq_con(rs.getString(5));
		 		fnq.setFnq_time(rs.getTimestamp(6));
		 		fnq.setFnq_ans(rs.getString(7));
		 		fnq.setFnq_ans_time(rs.getTimestamp(8));
		 		fnq.setFnq_ans_ck(rs.getString(9));
				fnqList.add(fnq);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return fnqList;
	}
	
	
	
	
	  //paging
	public int selectCountU_id(Connection conn, String u_id) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from fnq where u_id like '"+u_id+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	   private static final int MOVIE_COUNT_PER_PAGE = 6;

		public FnqListView getFnqList(Connection conn, int pageNumber, String u_id)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int fnqTotalCount = selectCountU_id(conn, u_id); //카운트 픽스 필요
			List<Fnq> fnqList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (fnqTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					fnqList = selectList(conn, firstRow, endRow, u_id);
				} else {
					currentPageNumber = 0;
					fnqList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new FnqListView(fnqList,fnqTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Fnq> selectList(Connection conn, int firstRow, int endRow, String u_id) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Fnq> fnqList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from fnq where u_id like ? limit ?,?");
				pstmt.setString(1, u_id);
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				fnqList = new ArrayList<Fnq>();
				while (rs.next()){
					Fnq fnq = new Fnq();
					fnq.setFnq_no(rs.getInt(1));
					fnq.setU_id(rs.getString(2));
					fnq.setFnq_type(rs.getString(3));
			 		fnq.setFnq_title(rs.getString(4));
			 		fnq.setFnq_con(rs.getString(5));
			 		fnq.setFnq_time(rs.getTimestamp(6));
			 		fnq.setFnq_ans(rs.getString(7));
			 		fnq.setFnq_ans_time(rs.getTimestamp(8));
			 		fnq.setFnq_ans_ck(rs.getString(9));
					fnqList.add(fnq);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return fnqList;
		}
		
		
		//관리자
		
		public int selectCountAdmin(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from fnq where fnq_ans_ck like 'no'");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public FnqListView getFnqListAdmin(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int fnqTotalCount = selectCountAdmin(conn); //카운트 픽스 필요
			List<Fnq> fnqList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (fnqTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					fnqList = selectListAdmin(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					fnqList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new FnqListView(fnqList,fnqTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Fnq> selectListAdmin(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Fnq> fnqList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from fnq where fnq_ans_ck like ? limit ?,?");
				pstmt.setString(1, "no");
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				fnqList = new ArrayList<Fnq>();
				while (rs.next()){
					Fnq fnq = new Fnq();
					fnq.setFnq_no(rs.getInt(1));
					fnq.setU_id(rs.getString(2));
					fnq.setFnq_type(rs.getString(3));
			 		fnq.setFnq_title(rs.getString(4));
			 		fnq.setFnq_con(rs.getString(5));
			 		fnq.setFnq_time(rs.getTimestamp(6));
			 		fnq.setFnq_ans(rs.getString(7));
			 		fnq.setFnq_ans_time(rs.getTimestamp(8));
			 		fnq.setFnq_ans_ck(rs.getString(9));
					fnqList.add(fnq);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return fnqList;
		}
		
}





















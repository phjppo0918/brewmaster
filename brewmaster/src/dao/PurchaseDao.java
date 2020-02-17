package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import model.Product;
import model.ProductListView;
import model.Purchase;
import model.PurchaseListView;
/*import model.PurchaseListView;*/
/*import model.User;
import model.UserListView;*/
import util.JdbcUtil;


public class PurchaseDao {	
	
	
	
	public void insert(Connection conn, Purchase pur) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		
		try {
			pstmt = conn.prepareStatement
			("insert into purchase (p_no,amount,pur_price_total,u_id,"
					+ "pur_time,add_up,add_doro,add_jibun,add_detail,order_request)"
					+ " values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, pur.getP_no());
			pstmt.setInt(2, pur.getAmount());
			pstmt.setInt(3, pur.getPur_price_total());
			pstmt.setString(4, pur.getU_id());
			pstmt.setTimestamp(5, 
					new Timestamp(pur.getPur_time().getTime()));
			pstmt.setString(6, pur.getAdd_up());
			pstmt.setString(7, pur.getAdd_doro());
			pstmt.setString(8, pur.getAdd_jibun());
			pstmt.setString(9, pur.getAdd_detail());
			pstmt.setString(10, pur.getOrder_request());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	/*
	 * public Purchase selectById(Connection conn, int pur_no) throws SQLException {
	 * PreparedStatement pstmt=null; ResultSet rs = null; Purchase pur = null; try {
	 * pstmt = conn.prepareStatement ("select * from pur where pur_no = ?");
	 * pstmt.setInt(1, pur_no); rs = pstmt.executeQuery(); if (rs.next()){ pur = new
	 * Purchase(); pur.setPurchase_no(rs.getInt(1)); pur.setU_id(rs.getString(2));
	 * pur.setPurchase_type(rs.getString(3));
	 * pur.setPurchase_title(rs.getString(4)); pur.setPurchase_con(rs.getString(5));
	 * pur.setPurchase_time(rs.getTimestamp(6));
	 * pur.setPurchase_ans(rs.getString(7));
	 * pur.setPurchase_ans_time(rs.getTimestamp(8));
	 * pur.setPurchase_ans_ck(rs.getString(9)); } } catch (SQLException e){
	 * e.printStackTrace(); } finally { JdbcUtil.close(conn); JdbcUtil.close(pstmt);
	 * JdbcUtil.close(rs); } return pur; }
	 */
	
	/*
	 * public List<Purchase> selectLike(Connection conn, String target, String
	 * keyword) throws SQLException { PreparedStatement pstmt=null; ResultSet rs =
	 * null; Purchase pur = null; List<Purchase> purs = new ArrayList<Purchase>();
	 * try { pstmt = conn.prepareStatement ("select * from pur where " +target
	 * +" like ?"); pstmt.setString(1, "%"+keyword+"%"); rs = pstmt.executeQuery();
	 * while (rs.next()){ pur = new Purchase(); pur.setPurchase_no(rs.getInt(1));
	 * pur.setU_id(rs.getString(2)); pur.setPurchase_type(rs.getString(3));
	 * pur.setPurchase_title(rs.getString(4)); pur.setPurchase_con(rs.getString(5));
	 * pur.setPurchase_time(rs.getTimestamp(6));
	 * pur.setPurchase_ans(rs.getString(7));
	 * pur.setPurchase_ans_time(rs.getTimestamp(8));
	 * pur.setPurchase_ans_ck(rs.getString(9)); purs.add(pur); } } catch
	 * (SQLException e){ e.printStackTrace(); } finally { JdbcUtil.close(conn);
	 * JdbcUtil.close(pstmt); JdbcUtil.close(rs); } return purs; }
	 */
	/*
	 * public int updateAns(Connection conn, Purchase pur) throws SQLException {
	 * PreparedStatement pstmt=null; int count = 0; try { pstmt =
	 * conn.prepareStatement
	 * ("update pur set pur_ans=?, pur_ans_time=?, pur_ans_ck=? where pur_no=?");
	 * 
	 * pstmt.setString(1, pur.getPurchase_ans()); pstmt.setTimestamp(2, new
	 * Timestamp(pur.getPurchase_ans_time().getTime())); pstmt.setString(3,
	 * pur.getPurchase_ans_ck()); pstmt.setInt(4, pur.getPurchase_no());
	 * 
	 * count = pstmt.executeUpdate(); } catch (SQLException e){ e.printStackTrace();
	 * } finally { JdbcUtil.close(conn); JdbcUtil.close(pstmt); } return count; }
	 */
	/*
	public int update(Connection conn, Purchase pur) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update pur set pur_name_kr=?, pur_name_en=?,"
					+ " pur_kind=?, pur_price=?, pur_country=?,pur_alchol=?"
					+ " pur_suger=?, pur_carbonic=?, pur_detail=?,pur_explain=?"
					+ "pur_socre=?, pur_image=?, pur_maker=? where pur_no=?");
			pstmt.setInt(1, pur.getPurchase_no());
			pstmt.setString(2, pur.getPurchase_name_en());
			pstmt.setString(3, pur.getPurchase_kind());
			pstmt.setInt(4, pur.getPurchase_price());
			pstmt.setString(5, pur.getPurchase_country());
			pstmt.setDouble(6, pur.getPurchase_alchol());
			pstmt.setInt(7, pur.getPurchase_suger());
			pstmt.setInt(8, pur.getPurchase_carbonic());
			pstmt.setString(9, pur.getPurchase_detail());
			pstmt.setString(10, pur.getPurchase_explain());
			pstmt.setString(11, pur.getPurchase_image());
			pstmt.setString(12, pur.getPurchase_maker());
			pstmt.setTimestamp(13, 
					new Timestamp(pur.getPurchase_time().getTime()));
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
	
	/*
	 * public int deleteById(Connection conn, int pur_no) throws SQLException {
	 * PreparedStatement pstmt=null; int count = 0; try { pstmt =
	 * conn.prepareStatement ("delete from pur where pur_no = ?"); pstmt.setInt(1,
	 * pur_no); count = pstmt.executeUpdate(); } catch (SQLException e){
	 * e.printStackTrace(); } finally { JdbcUtil.close(conn); JdbcUtil.close(pstmt);
	 * } return count; }
	 */
	
	/*
	 * public int selectCount(Connection conn) throws SQLException { Statement stmt
	 * = null; ResultSet rs = null; try { stmt = conn.createStatement(); rs =
	 * stmt.executeQuery("select count(*) from pur"); rs.next(); return
	 * rs.getInt(1); } finally { //JdbcUtil.close(conn); JdbcUtil.close(rs); } }
	 */
	
	/*
	 * public List<Purchase> selectList(Connection conn) throws SQLException {
	 * PreparedStatement pstmt = null; ResultSet rs = null; List<Purchase> purList =
	 * null; try { pstmt = conn.prepareStatement ("select * from pur "); rs =
	 * pstmt.executeQuery(); purList = new ArrayList<Purchase>(); while (rs.next()){
	 * Purchase pur = new Purchase(); pur.setPurchase_no(rs.getInt(1));
	 * pur.setU_id(rs.getString(2)); pur.setPurchase_type(rs.getString(3));
	 * pur.setPurchase_title(rs.getString(4)); pur.setPurchase_con(rs.getString(5));
	 * pur.setPurchase_time(rs.getTimestamp(6));
	 * pur.setPurchase_ans(rs.getString(7));
	 * pur.setPurchase_ans_time(rs.getTimestamp(8));
	 * pur.setPurchase_ans_ck(rs.getString(9)); purList.add(pur); } } finally {
	 * JdbcUtil.close(conn); JdbcUtil.close(rs); JdbcUtil.close(pstmt); } return
	 * purList; }
	 */
	
	
	
	
	  //paging
	/*
	 * public int selectCountU_id(Connection conn, String u_id) throws SQLException
	 * { Statement stmt = null; ResultSet rs = null; try { stmt =
	 * conn.createStatement(); rs =
	 * stmt.executeQuery("select count(*) from pur where u_id like '"+u_id+"'");
	 * rs.next(); return rs.getInt(1); } finally { //JdbcUtil.close(conn);
	 * JdbcUtil.close(rs); } }
	 * 
	 * private static final int MOVIE_COUNT_PER_PAGE = 6;
	 * 
	 * public PurchaseListView getPurchaseList(Connection conn, int pageNumber,
	 * String u_id) throws SQLException { int currentPageNumber = pageNumber; int
	 * purTotalCount = selectCountU_id(conn, u_id); //카운트 픽스 필요 List<Purchase>
	 * purList = null; int firstRow = 0; int endRow = 0; try { if (purTotalCount >
	 * 0) { firstRow = (pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
	 * 
	 * endRow = MOVIE_COUNT_PER_PAGE; purList = selectList(conn, firstRow, endRow,
	 * u_id); } else { currentPageNumber = 0; purList = Collections.emptyList(); }
	 * 
	 * } catch (SQLException e) { } finally { JdbcUtil.close(conn); } return new
	 * PurchaseListView(purList,purTotalCount,
	 * currentPageNumber,MOVIE_COUNT_PER_PAGE); }
	 * 
	 * 
	 * public List<Purchase> selectList(Connection conn, int firstRow, int endRow,
	 * String u_id) throws SQLException { PreparedStatement pstmt = null; ResultSet
	 * rs = null; List<Purchase> purList = null; try { pstmt = conn.prepareStatement
	 * ("select * from pur where u_id like ? limit ?,?"); pstmt.setString(1, u_id);
	 * pstmt.setInt(2, firstRow); pstmt.setInt(3, endRow); rs =
	 * pstmt.executeQuery(); purList = new ArrayList<Purchase>(); while (rs.next()){
	 * Purchase pur = new Purchase(); pur.setPurchase_no(rs.getInt(1));
	 * pur.setU_id(rs.getString(2)); pur.setPurchase_type(rs.getString(3));
	 * pur.setPurchase_title(rs.getString(4)); pur.setPurchase_con(rs.getString(5));
	 * pur.setPurchase_time(rs.getTimestamp(6));
	 * pur.setPurchase_ans(rs.getString(7));
	 * pur.setPurchase_ans_time(rs.getTimestamp(8));
	 * pur.setPurchase_ans_ck(rs.getString(9)); purList.add(pur); } } finally {
	 * JdbcUtil.close(conn); JdbcUtil.close(rs); JdbcUtil.close(pstmt); } return
	 * purList; }
	 * 
	 * 
	 * //관리자
	 * 
	 * public int selectCountAdmin(Connection conn) throws SQLException { Statement
	 * stmt = null; ResultSet rs = null; try { stmt = conn.createStatement(); rs =
	 * stmt.executeQuery("select count(*) from pur where pur_ans_ck like 'no'");
	 * rs.next(); return rs.getInt(1); } finally { //JdbcUtil.close(conn);
	 * JdbcUtil.close(rs); } }
	 * 
	 * public PurchaseListView getPurchaseListAdmin(Connection conn, int pageNumber)
	 * throws SQLException { int currentPageNumber = pageNumber; int purTotalCount =
	 * selectCountAdmin(conn); //카운트 픽스 필요 List<Purchase> purList = null; int
	 * firstRow = 0; int endRow = 0; try { if (purTotalCount > 0) { firstRow =
	 * (pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
	 * 
	 * endRow = MOVIE_COUNT_PER_PAGE; purList = selectListAdmin(conn, firstRow,
	 * endRow); } else { currentPageNumber = 0; purList = Collections.emptyList(); }
	 * 
	 * } catch (SQLException e) { } finally { JdbcUtil.close(conn); } return new
	 * PurchaseListView(purList,purTotalCount,
	 * currentPageNumber,MOVIE_COUNT_PER_PAGE); }
	 * 
	 * 
	 * public List<Purchase> selectListAdmin(Connection conn, int firstRow, int
	 * endRow) throws SQLException { PreparedStatement pstmt = null; ResultSet rs =
	 * null; List<Purchase> purList = null; try { pstmt = conn.prepareStatement
	 * ("select * from pur where pur_ans_ck like ? limit ?,?"); pstmt.setString(1,
	 * "no"); pstmt.setInt(2, firstRow); pstmt.setInt(3, endRow); rs =
	 * pstmt.executeQuery(); purList = new ArrayList<Purchase>(); while (rs.next()){
	 * Purchase pur = new Purchase(); pur.setPurchase_no(rs.getInt(1));
	 * pur.setU_id(rs.getString(2)); pur.setPurchase_type(rs.getString(3));
	 * pur.setPurchase_title(rs.getString(4)); pur.setPurchase_con(rs.getString(5));
	 * pur.setPurchase_time(rs.getTimestamp(6));
	 * pur.setPurchase_ans(rs.getString(7));
	 * pur.setPurchase_ans_time(rs.getTimestamp(8));
	 * pur.setPurchase_ans_ck(rs.getString(9)); purList.add(pur); } } finally {
	 * JdbcUtil.close(conn); JdbcUtil.close(rs); JdbcUtil.close(pstmt); } return
	 * purList; }
	 */
		
	
	
	//페이징
	
	  private static final int MOVIE_COUNT_PER_PAGE = 8;
	
	public List<Purchase> selectListUser(Connection conn, int firstRow, int endRow, String u_id) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Purchase> purchaseList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from purchase where u_id like ? limit ?,?");
			pstmt.setString(1, u_id);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, endRow);
			rs  = pstmt.executeQuery(); 
			purchaseList = new ArrayList<Purchase>();
			while (rs.next()){
				Purchase purchase = new Purchase(); 
				purchase.setPur_no(rs.getInt(1));
				purchase.setP_no(rs.getInt(2));
				purchase.setAmount(rs.getInt(3));
				purchase.setPur_price_total(rs.getInt(4));
				purchase.setU_id(rs.getString(5));
				purchase.setPur_time(rs.getTimestamp(6));
		 		purchase.setAdd_up(rs.getString(7));
		 		purchase.setAdd_doro(rs.getString(8));
		 		purchase.setAdd_jibun(rs.getString(9));
		 		purchase.setAdd_detail(rs.getString(10));
		 		purchase.setOrder_request(rs.getString(11));
		 		purchase.setInvoice(rs.getString(12));
				purchaseList.add(purchase);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return purchaseList;
	}
	
	public PurchaseListView getPurchaseListUser(Connection conn, int pageNumber, String u_id)
			throws SQLException {
		int currentPageNumber = pageNumber;
		int purchaseTotalCount = selectCountUser(conn, u_id);
		List<Purchase> purchaseList = null;
		int firstRow = 0;
		int endRow = 0;
		try {
			if (purchaseTotalCount > 0) {
				firstRow =
						(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
				
				endRow = MOVIE_COUNT_PER_PAGE;
				purchaseList = selectListUser(conn, firstRow, endRow, u_id);
			} else {
				currentPageNumber = 0;
				purchaseList = Collections.emptyList();
			}
			
		} catch (SQLException e) {
		} finally {
			JdbcUtil.close(conn);
		}
		return new PurchaseListView(purchaseList,purchaseTotalCount,
				currentPageNumber,MOVIE_COUNT_PER_PAGE);
	}
	
	public int selectCountUser(Connection conn, String u_id) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from purchase where (u_id like '"+u_id+"')");
			if(rs.next())
				return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
		return 0;
	}
}





















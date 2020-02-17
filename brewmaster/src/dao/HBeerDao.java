package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import model.HBeer;
import model.HBeerListView;
import util.JdbcUtil;


public class HBeerDao {	
	public void updateAcc(Connection conn, int h_beer_no, String h_beer_acc) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update h_beer set h_beer_acc=? where h_beer_no=?");
			pstmt.setString(1, h_beer_acc);
			pstmt.setInt(2, h_beer_no);
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
	}
	public void insert(Connection conn, HBeer hBeer) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		
		try {
			pstmt = conn.prepareStatement
			("insert into h_beer (h_beer_name,"
					+ "h_beer_price,h_beer_alchol,"
					+ " h_beer_suger, h_beer_carbonic, h_beer_detail, h_beer_explain,"
					+ " h_beer_image, h_beer_maker, h_beer_time)"
					+ " values(?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, hBeer.getH_beer_name());
			pstmt.setInt(2, hBeer.getH_beer_price());
			pstmt.setDouble(3, hBeer.getH_beer_alchol());
			pstmt.setInt(4, hBeer.getH_beer_suger());
			pstmt.setInt(5, hBeer.getH_beer_carbonic());
			pstmt.setString(6, hBeer.getH_beer_detail());
			pstmt.setString(7, hBeer.getH_beer_explain());
			pstmt.setString(8, hBeer.getH_beer_image());
			pstmt.setString(9, hBeer.getH_beer_maker());
			pstmt.setTimestamp(10, 
					new Timestamp(hBeer.getH_beer_time().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public HBeer selectById(Connection conn, int h_beer_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		HBeer hBeer = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from h_beer where h_beer_no = ?");
			pstmt.setInt(1, h_beer_no);
			rs = pstmt.executeQuery();
			if (rs.next()){
				hBeer = new HBeer(); 
				hBeer.setH_beer_no(rs.getInt(1));
				hBeer.setH_beer_name(rs.getString(2));
		 		hBeer.setH_beer_price(rs.getInt(3));
		 		hBeer.setH_beer_alchol(rs.getDouble(4));
		 		hBeer.setH_beer_suger(rs.getInt(5));
		 		hBeer.setH_beer_carbonic(rs.getInt(6));
		 		hBeer.setH_beer_detail(rs.getString(7));
		 		hBeer.setH_beer_explain(rs.getString(8));
		 		hBeer.setH_beer_image(rs.getString(9));
		 		hBeer.setH_beer_maker(rs.getString(10));
				hBeer.setH_beer_time(rs.getTimestamp(11));
				hBeer.setH_beer_acc(rs.getString(12));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return hBeer;
	}
	
	public List<HBeer> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		HBeer hBeer = null; 
		List<HBeer> hBeers = new ArrayList<HBeer>();
		try {
			pstmt = conn.prepareStatement
			("select * from h_beer where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				hBeer = new HBeer(); 
				hBeer.setH_beer_no(rs.getInt(1));
				hBeer.setH_beer_name(rs.getString(2));
		 		hBeer.setH_beer_price(rs.getInt(3));
		 		hBeer.setH_beer_alchol(rs.getDouble(4));
		 		hBeer.setH_beer_suger(rs.getInt(5));
		 		hBeer.setH_beer_carbonic(rs.getInt(6));
		 		hBeer.setH_beer_detail(rs.getString(7));
		 		hBeer.setH_beer_explain(rs.getString(8));
		 		hBeer.setH_beer_image(rs.getString(9));
		 		hBeer.setH_beer_maker(rs.getString(10));
				hBeer.setH_beer_time(rs.getTimestamp(11));
				hBeer.setH_beer_acc(rs.getString(12));
				hBeers.add(hBeer);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return hBeers;
	}
	public List<HBeer> selectLikeNotT(Connection conn, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		HBeer hBeer = null; 
		List<HBeer> hBeers = new ArrayList<HBeer>();
		try {
			pstmt = conn.prepareStatement
			("select * from h_beer where h_beer_name like ? or h_beer_maker like ?");
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				hBeer = new HBeer(); 
				hBeer.setH_beer_no(rs.getInt(1));
				hBeer.setH_beer_name(rs.getString(2));
		 		hBeer.setH_beer_price(rs.getInt(3));
		 		hBeer.setH_beer_alchol(rs.getDouble(4));
		 		hBeer.setH_beer_suger(rs.getInt(5));
		 		hBeer.setH_beer_carbonic(rs.getInt(6));
		 		hBeer.setH_beer_detail(rs.getString(7));
		 		hBeer.setH_beer_explain(rs.getString(8));
		 		hBeer.setH_beer_image(rs.getString(9));
		 		hBeer.setH_beer_maker(rs.getString(10));
				hBeer.setH_beer_time(rs.getTimestamp(11));
				hBeer.setH_beer_acc(rs.getString(12));
				hBeers.add(hBeer);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return hBeers;
	}
	public int update(Connection conn, HBeer hBeer) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update h_beer set h_beer_name=?,"
					+ "h_beer_price=?,h_beer_alchol=?"
					+ " ,h_beer_suger=?, h_beer_carbonic=?, h_beer_detail=?,h_beer_explain=?"
					+ ",h_beer_image=?, h_beer_maker=? where h_beer_no=?");
			pstmt.setString(1, hBeer.getH_beer_name());
			pstmt.setInt(2, hBeer.getH_beer_price());
			pstmt.setDouble(3, hBeer.getH_beer_alchol());
			pstmt.setInt(4, hBeer.getH_beer_suger());
			pstmt.setInt(5, hBeer.getH_beer_carbonic());
			pstmt.setString(6, hBeer.getH_beer_detail());
			pstmt.setString(7, hBeer.getH_beer_explain());
			pstmt.setString(8, hBeer.getH_beer_image());
			pstmt.setString(9, hBeer.getH_beer_maker());
			pstmt.setTimestamp(13, 
					new Timestamp(hBeer.getH_beer_time().getTime()));
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	
	public int deleteById(Connection conn, int h_beer_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 	
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("delete from h_beer where h_beer_no = ?");
			pstmt.setInt(1, h_beer_no);
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
			rs = stmt.executeQuery("select count(*) from h_beer");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<HBeer> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HBeer> hBeerList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from h_beer ");			
			rs  = pstmt.executeQuery(); 
			hBeerList = new ArrayList<HBeer>();
			while (rs.next()){
				HBeer hBeer = new HBeer(); 
				hBeer.setH_beer_no(rs.getInt(1));
				hBeer.setH_beer_name(rs.getString(2));
		 		hBeer.setH_beer_price(rs.getInt(3));
		 		hBeer.setH_beer_alchol(rs.getDouble(4));
		 		hBeer.setH_beer_suger(rs.getInt(5));
		 		hBeer.setH_beer_carbonic(rs.getInt(6));
		 		hBeer.setH_beer_detail(rs.getString(7));
		 		hBeer.setH_beer_explain(rs.getString(8));
		 		hBeer.setH_beer_image(rs.getString(9));
		 		hBeer.setH_beer_maker(rs.getString(10));
				hBeer.setH_beer_time(rs.getTimestamp(11));
				hBeer.setH_beer_acc(rs.getString(12));
				hBeerList.add(hBeer);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return hBeerList;
	}
	
	
	 //paging
	   
	   private static final int MOVIE_COUNT_PER_PAGE = 7;

		public HBeerListView getHBeerList(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int hBeerTotalCount = selectCount(conn);
			List<HBeer> hBeerList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (hBeerTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					hBeerList = selectList(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					hBeerList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new HBeerListView(hBeerList,hBeerTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<HBeer> selectList(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<HBeer> hBeerList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from h_beer limit ?,?");
				pstmt.setInt(1, firstRow);
				pstmt.setInt(2, endRow);
				rs  = pstmt.executeQuery(); 
				hBeerList = new ArrayList<HBeer>();
				while (rs.next()){
					HBeer hBeer = new HBeer();
					hBeer.setH_beer_no(rs.getInt(1));
					hBeer.setH_beer_name(rs.getString(2));
			 		hBeer.setH_beer_price(rs.getInt(3));
			 		hBeer.setH_beer_alchol(rs.getDouble(4));
			 		hBeer.setH_beer_suger(rs.getInt(5));
			 		hBeer.setH_beer_carbonic(rs.getInt(6));
			 		hBeer.setH_beer_detail(rs.getString(7));
			 		hBeer.setH_beer_explain(rs.getString(8));
			 		hBeer.setH_beer_image(rs.getString(9));
			 		hBeer.setH_beer_maker(rs.getString(10));
					hBeer.setH_beer_time(rs.getTimestamp(11));
					hBeer.setH_beer_acc(rs.getString(12));
					hBeerList.add(hBeer);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return hBeerList;
		}
		
		//키온리
	
			public HBeerListView getHBeerListKeyOnly(Connection conn, int pageNumber, String keyword)
					throws SQLException {
				int currentPageNumber = pageNumber;
				int hBeerTotalCount = selectCountKeyOnly(conn, keyword);
				List<HBeer> hBeerList = null;
				int firstRow = 0;
				int endRow = 0;
				try {
					if (hBeerTotalCount > 0) {
						firstRow =
								(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
						
						endRow = MOVIE_COUNT_PER_PAGE;
						hBeerList = selectListKeyOnly(conn, firstRow, endRow, keyword);
					} else {
						currentPageNumber = 0;
						hBeerList = Collections.emptyList();
					}
					
				} catch (SQLException e) {
				} finally {
					JdbcUtil.close(conn);
				}
				return new HBeerListView(hBeerList,hBeerTotalCount,
						currentPageNumber,MOVIE_COUNT_PER_PAGE);
			}
			
			
			public List<HBeer> selectListKeyOnly(Connection conn, int firstRow, int endRow, String keyword) 
					throws SQLException {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<HBeer> hBeerList = null;
				try {
					pstmt = conn.prepareStatement
							("select * from h_beer where (h_beer_name like ? or h_beer_maker like ?) limit ?,?");
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setString(2, "%"+keyword+"%");
					pstmt.setInt(3, firstRow);
					pstmt.setInt(4, endRow);
					rs  = pstmt.executeQuery(); 
					hBeerList = new ArrayList<HBeer>();
					while (rs.next()){
						HBeer hBeer = new HBeer();
						hBeer.setH_beer_no(rs.getInt(1));
						hBeer.setH_beer_name(rs.getString(2));
				 		hBeer.setH_beer_price(rs.getInt(3));
				 		hBeer.setH_beer_alchol(rs.getDouble(4));
				 		hBeer.setH_beer_suger(rs.getInt(5));
				 		hBeer.setH_beer_carbonic(rs.getInt(6));
				 		hBeer.setH_beer_detail(rs.getString(7));
				 		hBeer.setH_beer_explain(rs.getString(8));
				 		hBeer.setH_beer_image(rs.getString(9));
				 		hBeer.setH_beer_maker(rs.getString(10));
						hBeer.setH_beer_time(rs.getTimestamp(11));
						hBeer.setH_beer_acc(rs.getString(12));
						hBeerList.add(hBeer);
					}
				} finally {
					JdbcUtil.close(conn);
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}
				return hBeerList;
			}
			public int selectCountKeyOnly(Connection conn, String keyword) throws SQLException {
				Statement stmt = null; 
				ResultSet rs = null; 
				try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery("select count(*) from h_beer where (h_beer_name like '%"+keyword+"%' or h_beer_maker like '%"+keyword+"%')");
					rs.next();
					return rs.getInt(1);
				} finally {
					//JdbcUtil.close(conn);
					JdbcUtil.close(rs);
				}
			}
			
			
			// 더블키
			
			public HBeerListView getHBeerListKeyCon(Connection conn, int pageNumber,String target, String keyword)
					throws SQLException {
				int currentPageNumber = pageNumber;
				int hBeerTotalCount = selectCountKeyCon(conn, target, keyword);
				List<HBeer> hBeerList = null;
				int firstRow = 0;
				int endRow = 0;
				try {
					if (hBeerTotalCount > 0) {
						firstRow =
								(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
						
						endRow = MOVIE_COUNT_PER_PAGE;
						hBeerList = selectListKeyCon(conn, firstRow, endRow, target, keyword);
					} else {
						currentPageNumber = 0;
						hBeerList = Collections.emptyList();
					}
					
				} catch (SQLException e) {
				} finally {
					JdbcUtil.close(conn);
				}
				return new HBeerListView(hBeerList,hBeerTotalCount,
						currentPageNumber,MOVIE_COUNT_PER_PAGE);
			}
			
			
			public List<HBeer> selectListKeyCon(Connection conn, int firstRow, int endRow, String target, String keyword) 
					throws SQLException {
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				List<HBeer> hBeerList = null;
				try {
					pstmt = conn.prepareStatement
							("select * from h_beer where ("+target+" like ?) limit ?,?");
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, firstRow);
					pstmt.setInt(3, endRow);
					rs  = pstmt.executeQuery(); 
					hBeerList = new ArrayList<HBeer>();
					while (rs.next()){
						HBeer hBeer = new HBeer();
						hBeer.setH_beer_no(rs.getInt(1));
						hBeer.setH_beer_name(rs.getString(2));
				 		hBeer.setH_beer_price(rs.getInt(3));
				 		hBeer.setH_beer_alchol(rs.getDouble(4));
				 		hBeer.setH_beer_suger(rs.getInt(5));
				 		hBeer.setH_beer_carbonic(rs.getInt(6));
				 		hBeer.setH_beer_detail(rs.getString(7));
				 		hBeer.setH_beer_explain(rs.getString(8));
				 		hBeer.setH_beer_image(rs.getString(9));
				 		hBeer.setH_beer_maker(rs.getString(10));
						hBeer.setH_beer_time(rs.getTimestamp(11));
						hBeer.setH_beer_acc(rs.getString(12));
						hBeerList.add(hBeer);
					}
				} finally {
					JdbcUtil.close(conn);
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}
				return hBeerList;
			}
			public int selectCountKeyCon(Connection conn,String target, String keyword) throws SQLException {
				Statement stmt = null; 
				ResultSet rs = null; 
				try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery("select count(*) from h_beer where ("+target+" like '%"+keyword+"%')");
					rs.next();
					return rs.getInt(1);
				} finally {
					//JdbcUtil.close(conn);
					JdbcUtil.close(rs);
				}
			}
			
			
			
			//유져뷰
			 private static final int HB_COUNT_PER_PAGE = 12;
			 
			 
			 //일반 유저뷰 - 허가된것들
			 
			 public HBeerListView getHBeerListUV(Connection conn, int pageNumber)
						throws SQLException {
					int currentPageNumber = pageNumber;
					int hBeerTotalCount = selectCountUV(conn);
					List<HBeer> hBeerList = null;
					int firstRow = 0;
					int endRow = 0;
					try {
						if (hBeerTotalCount > 0) {
							firstRow =
									(pageNumber - 1) * HB_COUNT_PER_PAGE;
							
							endRow = HB_COUNT_PER_PAGE;
							hBeerList = selectListUV(conn, firstRow, endRow);
						} else {
							currentPageNumber = 0;
							hBeerList = Collections.emptyList();
						}
						
					} catch (SQLException e) {
					} finally {
						JdbcUtil.close(conn);
					}
					return new HBeerListView(hBeerList,hBeerTotalCount,
							currentPageNumber,HB_COUNT_PER_PAGE);
				}
				
				
				public List<HBeer> selectListUV(Connection conn, int firstRow, int endRow) 
						throws SQLException {
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					List<HBeer> hBeerList = null;
					try {
						pstmt = conn.prepareStatement
								("select * from h_beer where h_beer_acc like ?  limit ?,?");
						pstmt.setString(1, "승인");
						pstmt.setInt(2, firstRow);
						pstmt.setInt(3, endRow);
						rs  = pstmt.executeQuery(); 
						hBeerList = new ArrayList<HBeer>();
						while (rs.next()){
							HBeer hBeer = new HBeer();
							hBeer.setH_beer_no(rs.getInt(1));
							hBeer.setH_beer_name(rs.getString(2));
					 		hBeer.setH_beer_price(rs.getInt(3));
					 		hBeer.setH_beer_alchol(rs.getDouble(4));
					 		hBeer.setH_beer_suger(rs.getInt(5));
					 		hBeer.setH_beer_carbonic(rs.getInt(6));
					 		hBeer.setH_beer_detail(rs.getString(7));
					 		hBeer.setH_beer_explain(rs.getString(8));
					 		hBeer.setH_beer_image(rs.getString(9));
					 		hBeer.setH_beer_maker(rs.getString(10));
							hBeer.setH_beer_time(rs.getTimestamp(11));
							hBeer.setH_beer_acc(rs.getString(12));
							hBeerList.add(hBeer);
						}
					} finally {
						JdbcUtil.close(conn);
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
					}
					return hBeerList;
				}
				public int selectCountUV(Connection conn) throws SQLException {
					Statement stmt = null; 
					ResultSet rs = null; 
					try {
						stmt = conn.createStatement();
						rs = stmt.executeQuery("select count(*) from h_beer where h_beer_acc like '승인' ");
						rs.next();
						return rs.getInt(1);
					} finally {
						//JdbcUtil.close(conn);
						JdbcUtil.close(rs);
					}
				}
			 
				 
				 //일반 유저뷰 - 허가 - 검색
				 
				 public HBeerListView getHBeerListUVKey(Connection conn, int pageNumber, String keyword)
							throws SQLException {
						int currentPageNumber = pageNumber;
						int hBeerTotalCount = selectCountUVKey(conn, keyword);
						List<HBeer> hBeerList = null;
						int firstRow = 0;
						int endRow = 0;
						try {
							if (hBeerTotalCount > 0) {
								firstRow =
										(pageNumber - 1) * HB_COUNT_PER_PAGE;
								
								endRow = HB_COUNT_PER_PAGE;
								hBeerList = selectListUVKey(conn, firstRow, endRow, keyword);
							} else {
								currentPageNumber = 0;
								hBeerList = Collections.emptyList();
							}
							
						} catch (SQLException e) {
						} finally {
							JdbcUtil.close(conn);
						}
						return new HBeerListView(hBeerList,hBeerTotalCount,
								currentPageNumber,HB_COUNT_PER_PAGE);
					}
					
					
					public List<HBeer> selectListUVKey(Connection conn, int firstRow, int endRow, String keyword) 
							throws SQLException {
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						List<HBeer> hBeerList = null;
						try {
							pstmt = conn.prepareStatement
									("select * from h_beer where (h_beer_acc like ?) and (h_beer_name like ?) limit ?,?");
							pstmt.setString(1, "승인");
							pstmt.setString(2, "%"+keyword+"%");
							pstmt.setInt(3, firstRow);
							pstmt.setInt(4, endRow);
							rs  = pstmt.executeQuery(); 
							hBeerList = new ArrayList<HBeer>();
							while (rs.next()){
								HBeer hBeer = new HBeer();
								hBeer.setH_beer_no(rs.getInt(1));
								hBeer.setH_beer_name(rs.getString(2));
						 		hBeer.setH_beer_price(rs.getInt(3));
						 		hBeer.setH_beer_alchol(rs.getDouble(4));
						 		hBeer.setH_beer_suger(rs.getInt(5));
						 		hBeer.setH_beer_carbonic(rs.getInt(6));
						 		hBeer.setH_beer_detail(rs.getString(7));
						 		hBeer.setH_beer_explain(rs.getString(8));
						 		hBeer.setH_beer_image(rs.getString(9));
						 		hBeer.setH_beer_maker(rs.getString(10));
								hBeer.setH_beer_time(rs.getTimestamp(11));
								hBeer.setH_beer_acc(rs.getString(12));
								hBeerList.add(hBeer);
							}
						} finally {
							JdbcUtil.close(conn);
							JdbcUtil.close(rs);
							JdbcUtil.close(pstmt);
						}
						return hBeerList;
					}
					public int selectCountUVKey(Connection conn, String keyword) throws SQLException {
						Statement stmt = null; 
						ResultSet rs = null; 
						try {
							stmt = conn.createStatement();
							rs = stmt.executeQuery("select count(*) from h_beer where (h_beer_acc like '승인') and (h_beer_name like '%"+keyword+"%')");
							rs.next();
							return rs.getInt(1);
						} finally {
							//JdbcUtil.close(conn);
							JdbcUtil.close(rs);
						}
					}	 
}






















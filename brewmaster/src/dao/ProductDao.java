package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import model.Product;
import model.ProductListView;
import model.User;
import model.UserListView;
import util.JdbcUtil;


public class ProductDao {	
	
	public void upScore(Connection conn, int p_no, int amount) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		//ResultSet rs = null;
		int cnt=0;
		try {	
			pstmt = conn.prepareStatement
			("update product set p_score = p_score + ?  where p_no = ?");
			pstmt.setInt(1, amount);
			pstmt.setInt(2, p_no);
		
			
			cnt = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
			//JdbcUtil.close(rs);
		}
	}
	
	
	public void insert(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		
		try {
			pstmt = conn.prepareStatement
			("insert into product (p_name_kr,p_name_en,"
					+ "p_kind,p_price,p_country,p_alchol,"
					+ " p_suger, p_carbonic, p_detail, p_explain,"
					+ " p_image, p_maker, p_time)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, product.getP_name_kr());
			pstmt.setString(2, product.getP_name_en());
			pstmt.setString(3, product.getP_kind());
			pstmt.setInt(4, product.getP_price());
			pstmt.setString(5, product.getP_country());
			pstmt.setDouble(6, product.getP_alchol());
			pstmt.setInt(7, product.getP_suger());
			pstmt.setInt(8, product.getP_carbonic());
			pstmt.setString(9, product.getP_detail());
			pstmt.setString(10, product.getP_explain());
			pstmt.setString(11, product.getP_image());
			pstmt.setString(12, product.getP_maker());
			pstmt.setTimestamp(13, 
					new Timestamp(product.getP_time().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Product selectById(Connection conn, int p_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from product where p_no = ?");
			pstmt.setInt(1, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()){
				product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return product;
	}
	
	public List<Product> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement
			("select * from product where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	public List<Product> selectLikeManage(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement
			("select * from product where p_kind like ? and (p_name_kr like ? or p_name_en like ?)");
			pstmt.setString(1, "%"+target+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setString(3, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	public List<Product> selectLikeManagekeyOnly(Connection conn, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement
			("select * from product where (p_name_kr like ? or p_name_en like ?)");
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	public int update(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update product set p_name_kr=?, p_name_en=?,"
					+ " p_kind=?, p_price=?, p_country=?,p_alchol=?"
					+ " p_suger=?, p_carbonic=?, p_detail=?,p_explain=?"
					+ "p_socre=?, p_image=?, p_maker=? where p_no=?");
			pstmt.setString(1, product.getP_name_kr());
			pstmt.setString(2, product.getP_name_en());
			pstmt.setString(3, product.getP_kind());
			pstmt.setInt(4, product.getP_price());
			pstmt.setString(5, product.getP_country());
			pstmt.setDouble(6, product.getP_alchol());
			pstmt.setInt(7, product.getP_suger());
			pstmt.setInt(8, product.getP_carbonic());
			pstmt.setString(9, product.getP_detail());
			pstmt.setString(10, product.getP_explain());
			pstmt.setString(11, product.getP_image());
			pstmt.setString(12, product.getP_maker());
			pstmt.setTimestamp(13, 
					new Timestamp(product.getP_time().getTime()));
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	
	public int deleteById(Connection conn, int p_no) 
			throws SQLException {
		PreparedStatement pstmt=null; 	
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("delete from product where p_no = ?");
			pstmt.setInt(1, p_no);
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
			rs = stmt.executeQuery("select count(*) from product");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Product> selectListTop3(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product order by p_score desc limit 3");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	
	
	public List<Product> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product ");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product(); 
				product.setP_no(rs.getInt(1));
				product.setP_name_kr(rs.getString(2));
				product.setP_name_en(rs.getString(3));
		 		product.setP_kind(rs.getString(4));
		 		product.setP_price(rs.getInt(5));
		 		product.setP_country(rs.getString(6));
		 		product.setP_alchol(rs.getDouble(7));
		 		product.setP_suger(rs.getInt(8));
		 		product.setP_carbonic(rs.getInt(9));
		 		product.setP_detail(rs.getString(10));
		 		product.setP_explain(rs.getString(11));
		 		product.setP_score(rs.getInt(12));
		 		product.setP_image(rs.getString(13));
		 		product.setP_maker(rs.getString(14));
				product.setP_time(rs.getTimestamp(15));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	
	   //paging
	   
	   private static final int MOVIE_COUNT_PER_PAGE = 12;

		public ProductListView getProductList(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCount(conn);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectList(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Product> selectList(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product limit ?,?");
				pstmt.setInt(1, firstRow);
				pstmt.setInt(2, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		
		//키온리
		
		public List<Product> selectListKeyOnly(Connection conn, int firstRow, int endRow, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, firstRow);
				pstmt.setInt(4, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListKeyOnly(Connection conn, int pageNumber, String keyword)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountKeyOnly(conn, keyword);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListKeyOnly(conn, firstRow, endRow, keyword);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountKeyOnly(Connection conn, String keyword) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where (p_name_kr like '%"+keyword+"%' or p_name_en like '%"+ keyword+"%')");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		//더블키
		
		public List<Product> selectListKeyCon(Connection conn, int firstRow, int endRow, String target, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where (p_kind like ? and (p_name_kr like ? or p_name_en like ?)) limit ?,?");
				pstmt.setString(1, "%"+target+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setString(3, "%"+keyword+"%");
				pstmt.setInt(4, firstRow);
				pstmt.setInt(5, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListKeyCon(Connection conn, int pageNumber, String target, String keyword)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountKeyCon(conn, target, keyword);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListKeyCon(conn, firstRow, endRow, target, keyword);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountKeyCon(Connection conn,String target ,String keyword) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '%"+target+"%' and (p_name_kr like '%"+keyword+"%' or p_name_en like '%"+ keyword+"%')");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		
		//전체 맥주
		public List<Product> selectListB(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like ?  limit ?,?");
				
				pstmt.setString(1, "맥주");
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListB(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountB(conn);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListB(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountB(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '맥주'");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		
		
		
		//전체 검색맥주
		public int selectCountShAll(Connection conn, String target) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '맥주' and (p_name_kr like '%"+target+"%' or p_name_en like '%"+target+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListShAll(Connection conn, int pageNumber, String target)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountShAll(conn, target);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListShAll(conn, firstRow, endRow, target);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Product> selectListShAll(Connection conn, int firstRow, int endRow, String target) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '맥주' and (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, "%"+target+"%");
				pstmt.setString(2, "%"+target+"%");
				pstmt.setInt(3, firstRow);
				pstmt.setInt(4, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		
		
		//네션 맥주
		public int selectCountNatB(Connection conn, String nation) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '맥주' and (p_country in (select a.nat_name FROM nation a where a.nat_con like '"+nation+"'))");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListNatB(Connection conn, int pageNumber, String nation)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountNatB(conn, nation);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListNatB(conn, firstRow, endRow, nation);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Product> selectListNatB(Connection conn, int firstRow, int endRow, String nation) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '맥주' and (p_country in (select a.nat_name FROM nation a " + 
														"where a.nat_con like ?)) limit ?,?");
				pstmt.setString(1, nation);
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		
		//네션 키온리 맥주
		
		public List<Product> selectListKeyOnlyNatB(Connection conn, int firstRow, int endRow, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '맥주' and (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, firstRow);
				pstmt.setInt(4, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListKeyOnlyNatB(Connection conn, int pageNumber, String keyword)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountKeyOnlyNatB(conn, keyword);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListKeyOnlyNatB(conn, firstRow, endRow, keyword);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountKeyOnlyNatB(Connection conn, String keyword) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where (p_name_kr like '%"+keyword+"%' or p_name_en like '%"+ keyword+"%')");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		//네션 더블키 맥주
		
		public List<Product> selectListKeyConNatB(Connection conn, int firstRow, int endRow, String target, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where (p_kind like ? and (p_name_kr like ? or p_name_en like ?)) limit ?,?");
				pstmt.setString(1, "%"+target+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setString(3, "%"+keyword+"%");
				pstmt.setInt(4, firstRow);
				pstmt.setInt(5, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListKeyConNatB(Connection conn, int pageNumber, String target, String keyword)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountKeyConNatB(conn, target, keyword);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListKeyConNatB(conn, firstRow, endRow, target, keyword);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountKeyConNatB(Connection conn,String target ,String keyword) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '%"+target+"%' and (p_name_kr like '%"+keyword+"%' or p_name_en like '%"+ keyword+"%')");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		
		//네션 맥주 유저 탐색
		
		public int selectCountNatBKey(Connection conn, String nation,String target) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '맥주' and (p_country in (select a.nat_name FROM nation a where a.nat_con like '"+nation+"')) and  (p_name_kr like '%"+target+"%' or p_name_en like '%"+ target+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListNatBKey(Connection conn, int pageNumber, String nation, String target)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountNatBKey(conn, nation, target);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListNatBKey(conn, firstRow, endRow, nation, target);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public List<Product> selectListNatBKey(Connection conn, int firstRow, int endRow, String nation, String target) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '맥주' and (p_country in (select a.nat_name FROM nation a " + 
														"where a.nat_con like ?)) and (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, nation);
				pstmt.setString(2, "%"+target+"%");
				pstmt.setString(3, "%"+target+"%");
				pstmt.setInt(4, firstRow);
				pstmt.setInt(5, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}

		
	
		
		//전체 와인
		
		public List<Product> selectListW(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like ?  limit ?,?");
				
				pstmt.setString(1, "와인");
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		public ProductListView getProductListW(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountW(conn);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListW(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public int selectCountW(Connection conn) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '와인'");
				if(rs.next())
					return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
			return 0;
		}
		
		
		
		
		//전체 검색와인
		public int selectCountShWAll(Connection conn, String target) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '와인' and (p_name_kr like '%"+target+"%' or p_name_en like '%"+target+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListShWAll(Connection conn, int pageNumber, String target)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountShWAll(conn, target);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListShWAll(conn, firstRow, endRow, target);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Product> selectListShWAll(Connection conn, int firstRow, int endRow, String target) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '와인' and (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, "%"+target+"%");
				pstmt.setString(2, "%"+target+"%");
				pstmt.setInt(3, firstRow);
				pstmt.setInt(4, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		
		//와인 네션
		
		public int selectCountNatW(Connection conn, String nation) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '와인' and ( p_detail like '"+nation+"')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListNatW(Connection conn, int pageNumber, String nation)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountNatW(conn, nation);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListNatW(conn, firstRow, endRow, nation);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<Product> selectListNatW(Connection conn, int firstRow, int endRow, String nation) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '와인' and (p_detail like ?) limit ?,?");
				pstmt.setString(1, nation);
				pstmt.setInt(2, firstRow);
				pstmt.setInt(3, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}
		
		
		
		//와인 네션 검색
		
		public int selectCountNatWKey(Connection conn, String nation,String target) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from product where p_kind like '와인' and (p_detail like '"+nation+"') and  (p_name_kr like '%"+target+"%' or p_name_en like '%"+ target+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		public ProductListView getProductListNatWKey(Connection conn, int pageNumber, String nation, String target)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int productTotalCount = selectCountNatWKey(conn, nation, target);
			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (productTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					productList = selectListNatWKey(conn, firstRow, endRow, nation, target);
				} else {
					currentPageNumber = 0;
					productList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new ProductListView(productList,productTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		public List<Product> selectListNatWKey(Connection conn, int firstRow, int endRow, String nation, String target) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Product> productList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from product where p_kind like '와인' and (p_detail like ?) and (p_name_kr like ? or p_name_en like ?) limit ?,?");
				pstmt.setString(1, nation);
				pstmt.setString(2, "%"+target+"%");
				pstmt.setString(3, "%"+target+"%");
				pstmt.setInt(4, firstRow);
				pstmt.setInt(5, endRow);
				rs  = pstmt.executeQuery(); 
				productList = new ArrayList<Product>();
				while (rs.next()){
					Product product = new Product(); 
					product.setP_no(rs.getInt(1));
					product.setP_name_kr(rs.getString(2));
					product.setP_name_en(rs.getString(3));
			 		product.setP_kind(rs.getString(4));
			 		product.setP_price(rs.getInt(5));
			 		product.setP_country(rs.getString(6));
			 		product.setP_alchol(rs.getDouble(7));
			 		product.setP_suger(rs.getInt(8));
			 		product.setP_carbonic(rs.getInt(9));
			 		product.setP_detail(rs.getString(10));
			 		product.setP_explain(rs.getString(11));
			 		product.setP_score(rs.getInt(12));
			 		product.setP_image(rs.getString(13));
			 		product.setP_maker(rs.getString(14));
					product.setP_time(rs.getTimestamp(15));
					productList.add(product);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return productList;
		}

}





















package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import model.User;
import model.UserListView;
import util.JdbcUtil;
import java.util.Random;

public class UserDao {
	public void updateUserInfo(Connection conn, String u_id,String u_pw, String u_ph, String u_email) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update user set u_pw=?, u_ph=?, u_email=? where u_id=?");
			pstmt.setString(1, u_pw);
			pstmt.setString(2, u_ph);
			pstmt.setString(3, u_email);
			pstmt.setString(4, u_id);
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		
	}
	public String searchUPW(Connection conn, String u_id, String u_name, String u_email)
			 throws SQLException{
		PreparedStatement pstmt=null; 
		PreparedStatement pstmt2=null; 
	    ResultSet rs = null;
	    int cnt=0;
		String dbPw = new String(); //db에서 가져온 id
		Random ran = new Random();
		String ranPw = (ran.nextInt(899998)+100000)+"";
		try {
			 pstmt = conn.prepareStatement
			         ("select u_pw from user where u_id=? and u_name=? and u_email=?");
			 pstmt.setString(1, u_id);
			 pstmt.setString(2, u_name);
			 pstmt.setString(3, u_email);
			 
			 rs = pstmt.executeQuery();
			 if (rs.next()){
				 dbPw = rs.getString(1); // 2번째 칼럼에 있는 것을 dbpassword에 넣음
				 pstmt2 = conn.prepareStatement
				         ("update user set u_pw=? where u_id=?");
				 pstmt2.setString(1, ranPw);
				 pstmt2.setString(2, u_id);
				 dbPw = ranPw;
				 cnt = pstmt2.executeUpdate(); 
				 
		     }else {
		    	 dbPw ="";
		     }
			 
		}catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(pstmt2);
	         JdbcUtil.close(rs);
	      }
		return dbPw;
	}
	public String searchUId(Connection conn, String u_name, String u_email)
			 throws SQLException{
		PreparedStatement pstmt=null; 
	    ResultSet rs = null;
		String dbId = new String(); //db에서 가져온 id
		try {
			 pstmt = conn.prepareStatement
			         ("select u_id from user where u_name=? and u_email=?");
			 pstmt.setString(1, u_name);
			 pstmt.setString(2, u_email);
			 
			 rs = pstmt.executeQuery();
			 if (rs.next()){
				 dbId = rs.getString(1); // 2번째 칼럼에 있는 것을 dbpassword에 넣음
		     }
		}catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
		return dbId;
	}
	public boolean checkPassword(Connection conn, String u_id, String u_pw) 
	         throws SQLException {
	      PreparedStatement pstmt=null; 
	      ResultSet rs = null;
	      String dbpassword=""; //DB에서 가져온 password
	      try {
	         pstmt = conn.prepareStatement
	         ("select * from user where u_id = ?");
	         pstmt.setString(1, u_id);
	         rs = pstmt.executeQuery();
	         if (rs.next()){
	            dbpassword = rs.getString(2); // 2번째 칼럼에 있는 것을 dbpassword에 넣음
	         }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	      if(u_pw.equals(dbpassword))
	         return true;
	      else
	         return false;
	   } 
	public int ch_id(Connection conn, String u_id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT u_id FROM user WHERE u_id = ?");
			pstmt.setString(1, u_id);
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
	public int bringCoin(Connection conn,String u_id) 
			throws SQLException{
				PreparedStatement pstmt=null; 
				ResultSet rs = null;
				int coin=0;
				
				try {
					pstmt = conn.prepareStatement
					("select u_money from user where u_id=?");
					pstmt.setString(1, u_id);
					rs = pstmt.executeQuery();
					if (rs.next()){
						coin = rs.getInt(1);
					}
				} catch (SQLException e){
					e.printStackTrace();
				} finally {
					JdbcUtil.close(conn);
					JdbcUtil.close(pstmt);
					JdbcUtil.close(rs);
				}
				return coin;
			} 
	
	
	public void chargeMoney(Connection conn,String u_id, int ch) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		//ResultSet rs = null;
		int cnt=0;
		try {	
			pstmt = conn.prepareStatement
			("update user set u_money=? where u_id=?");
			pstmt.setInt(1, ch);
			pstmt.setString(2, u_id);
			
			cnt = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
			//JdbcUtil.close(rs);
		}
	}
	public User searchU_money(Connection conn, String u_id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where u_id=?");
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	
	public User searchId(Connection conn, String u_name, String u_email) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where u_name=? and u_email=?");
			pstmt.setString(1, u_name);
			pstmt.setString(2, u_email);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	public int login(Connection conn, String u_id, String u_pw) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT u_pw FROM user WHERE u_id = ?");
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString(1).equals(u_pw)) {
					return 1; // 라긴 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}		
		return -2;
	}
	
	
	public void insert(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		
		try {
			pstmt = conn.prepareStatement
			("insert into user (u_id,u_pw,u_name,u_ph,u_birth,u_email)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_pw());
			pstmt.setString(3, user.getU_name());
			pstmt.setString(4, user.getU_ph());
			pstmt.setDate(5, user.getU_birth());
		//	pstmt.setTimestamp(5, 
		//			new Timestamp(user.getU_birth().getTime()));
			pstmt.setString(6, user.getU_email());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public User selectById(Connection conn, String u_id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from user where u_id = ?");
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				user = new User(); 
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return user;
	}
	
	public List<User> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		List<User> users = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement
			("select * from user where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				user = new User(); 
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
				users.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return users;
	}
	
	public int update(Connection conn, User user) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("update user set u_pw=?, u_name=?, u_ph=?, u_birth=?,u_email=? where u_id=?");
			
			pstmt.setString(1, user.getU_pw());
			pstmt.setString(2, user.getU_name());
			pstmt.setString(3, user.getU_ph());
			pstmt.setDate(4, user.getU_birth());
			//	pstmt.setTimestamp(5, 
			//			new Timestamp(user.getU_birth().getTime()));
				pstmt.setString(5, user.getU_email());
				pstmt.setString(6, user.getU_id());
			count = pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
			JdbcUtil.close(pstmt);
		}
		return count;
	}
	
	public int deleteById(Connection conn, String u_id) 
			throws SQLException {
		PreparedStatement pstmt=null; 	
		int count = 0;
		try {
			pstmt = conn.prepareStatement
			("delete from user where u_id = ?");
			pstmt.setString(1, u_id);
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
			rs = stmt.executeQuery("select count(*) from user");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<User> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<User> userList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from user ");			
			rs  = pstmt.executeQuery(); 
			userList = new ArrayList<User>();
			while (rs.next()){
				User user = new User();
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
				userList.add(user);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return userList;
	}
	public List<User> selectLikeNot(Connection conn, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		User user = null; 
		List<User> users = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement
			("select * from user where u_id like ? or u_name like ?");
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				user = new User(); 
				user.setU_id(rs.getString(1));
				user.setU_pw(rs.getString(2));
		 		user.setU_name(rs.getString(3));
		 		user.setU_ph(rs.getString(4));
		 		user.setU_money(rs.getInt(5));
				user.setU_birth(rs.getDate(6));
				//user.setU_birth(rs.getTimestamp(5));
				user.setU_email(rs.getString(7));
				users.add(user);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return users;
	}
	
	  
	   //paging
	   
	   private static final int MOVIE_COUNT_PER_PAGE = 10;

		public UserListView getUserList(Connection conn, int pageNumber)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int userTotalCount = selectCount(conn);
			List<User> userList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (userTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					userList = selectList(conn, firstRow, endRow);
				} else {
					currentPageNumber = 0;
					userList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new UserListView(userList,userTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		public List<User> selectList(Connection conn, int firstRow, int endRow) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<User> userList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from user limit ?,?");
				pstmt.setInt(1, firstRow);
				pstmt.setInt(2, endRow);
				rs  = pstmt.executeQuery(); 
				userList = new ArrayList<User>();
				while (rs.next()){
					User user = new User();
					user.setU_id(rs.getString(1));
					user.setU_pw(rs.getString(2));
			 		user.setU_name(rs.getString(3));
			 		user.setU_ph(rs.getString(4));
			 		user.setU_money(rs.getInt(5));
					user.setU_birth(rs.getDate(6));
					//user.setU_birth(rs.getTimestamp(5));
					user.setU_email(rs.getString(7));
					userList.add(user);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return userList;
		}
		
		
		
		//키온리
		
		public UserListView getUserListKeyonly(Connection conn, int pageNumber, String keyword)
				throws SQLException {
			int currentPageNumber = pageNumber;
			int userTotalCount = selectCountKeyonly(conn, keyword);
			List<User> userList = null;
			int firstRow = 0;
			int endRow = 0;
			try {
				if (userTotalCount > 0) {
					firstRow =
							(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
					
					endRow = MOVIE_COUNT_PER_PAGE;
					userList = selectListKeyonly(conn, firstRow, endRow, keyword);
				} else {
					currentPageNumber = 0;
					userList = Collections.emptyList();
				}
				
			} catch (SQLException e) {
			} finally {
				JdbcUtil.close(conn);
			}
			return new UserListView(userList,userTotalCount,
					currentPageNumber,MOVIE_COUNT_PER_PAGE);
		}
		
		
		
		
		public List<User> selectListKeyonly(Connection conn, int firstRow, int endRow, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<User> userList = null;
			try {
				pstmt = conn.prepareStatement
						("select * from user where (u_id like ? or u_name like ?) limit ?,?");
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, firstRow);
				pstmt.setInt(4, endRow);
				rs  = pstmt.executeQuery(); 
				userList = new ArrayList<User>();
				while (rs.next()){
					User user = new User();
					user.setU_id(rs.getString(1));
					user.setU_pw(rs.getString(2));
			 		user.setU_name(rs.getString(3));
			 		user.setU_ph(rs.getString(4));
			 		user.setU_money(rs.getInt(5));
					user.setU_birth(rs.getDate(6));
					//user.setU_birth(rs.getTimestamp(5));
					user.setU_email(rs.getString(7));
					userList.add(user);
				}
			} finally {
				JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return userList;
		}
		
		
		public int selectCountKeyonly(Connection conn, String keyword) throws SQLException {
			Statement stmt = null; 
			ResultSet rs = null; 
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from user where (u_id like '%"+keyword+"%' or u_name like '%"+keyword+"%')");
				rs.next();
				return rs.getInt(1);
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
			}
		}
		
		
		//키콘
		
				public UserListView getUserListKeyCon(Connection conn, int pageNumber, String target, String keyword)
						throws SQLException {
					int currentPageNumber = pageNumber;
					int userTotalCount = selectCountKeyCon(conn, target, keyword);
					List<User> userList = null;
					int firstRow = 0;
					int endRow = 0;
					try {
						if (userTotalCount > 0) {
							firstRow =
									(pageNumber - 1) * MOVIE_COUNT_PER_PAGE;
							
							endRow = MOVIE_COUNT_PER_PAGE;
							userList = selectListKeyCon(conn, firstRow, endRow, target, keyword);
						} else {
							currentPageNumber = 0;
							userList = Collections.emptyList();
						}
						
					} catch (SQLException e) {
					} finally {
						JdbcUtil.close(conn);
					}
					return new UserListView(userList,userTotalCount,
							currentPageNumber,MOVIE_COUNT_PER_PAGE);
				}
				
				
				
				
				public List<User> selectListKeyCon(Connection conn, int firstRow, int endRow, String target, String keyword) 
						throws SQLException {
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					List<User> userList = null;
					try {
						pstmt = conn.prepareStatement
								("select * from user where ("+target+" like ?) limit ?,?");
						pstmt.setString(1, "%"+keyword+"%");
						pstmt.setInt(2, firstRow);
						pstmt.setInt(3, endRow);
						rs  = pstmt.executeQuery(); 
						userList = new ArrayList<User>();
						while (rs.next()){
							User user = new User();
							user.setU_id(rs.getString(1));
							user.setU_pw(rs.getString(2));
					 		user.setU_name(rs.getString(3));
					 		user.setU_ph(rs.getString(4));
					 		user.setU_money(rs.getInt(5));
							user.setU_birth(rs.getDate(6));
							//user.setU_birth(rs.getTimestamp(5));
							user.setU_email(rs.getString(7));
							userList.add(user);
						}
					} finally {
						JdbcUtil.close(conn);
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
					}
					return userList;
				}
				
				
				public int selectCountKeyCon(Connection conn, String target, String keyword) throws SQLException {
					Statement stmt = null; 
					ResultSet rs = null; 
					try {
						stmt = conn.createStatement();
						rs = stmt.executeQuery("select count(*) from user where ("+target+" like '%"+keyword+"%')");
						rs.next();
						return rs.getInt(1);
					} finally {
						//JdbcUtil.close(conn);
						JdbcUtil.close(rs);
					}
				}
		
}






















package com.douzone.guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.douzone.guestbook.vo.GuestBookVo;


public class GuestBookDao {
	public void insert(GuestBookVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnetion();
			String sql = "insert into guestbook values(null,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getMessage());
			pstmt.setString(4, vo.getRegDate());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public List<GuestBookVo> findAll() {
		List<GuestBookVo> result = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnetion();
			String sql = "select no,name,message,reg_date from guestbook order by no desc";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 5. 결과
			while (rs.next()) {
				GuestBookVo vo = new GuestBookVo();
				vo.setNo(rs.getLong(1));
				vo.setName(rs.getString(2));
				vo.setMessage(rs.getString(3));
				vo.setRegDate(rs.getString(4));
				result.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	public boolean delete(int no,String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		try {
			conn = getConnetion();
			String sql = "delete from guestbook where no=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.setString(2, password);
			result = pstmt.executeUpdate()==1?true:false;
			

		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	private Connection getConnetion() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");

			String url = "jdbc:mariadb://192.168.10.109:3307/webdb?charset=utf8";
			conn = DriverManager.getConnection(url, "webdb", "webdb");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패: " + e);
		}
		return conn;

	}
}

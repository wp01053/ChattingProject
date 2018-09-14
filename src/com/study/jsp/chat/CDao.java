package com.study.jsp.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CDao {

	private static CDao instance = new CDao();
	DataSource dataSource = null;

	public CDao() {

		try {

			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static CDao getInstance() {
		return instance;

	}

	public void chatt(String M_COUNT, String R1, String BID, String PASSWORD) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into roomlist" + "(CNUM,RNAME, M_COUNT,R1,BID,PASSWORD)" + "values"
				+ "(cnum.nextval,'waitroom',?,?,?,?)";

		try {
//         
			System.out.println("db 입력 완료");
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, M_COUNT);
			pstmt.setString(2, R1);
			pstmt.setString(3, BID);
			pstmt.setString(4, PASSWORD);

			int rn = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				System.out.println("dd");
				e2.printStackTrace();
			}
		}

	}

	// roomlist
	public ArrayList<CDto> list() {

		ArrayList<CDto> dtos = new ArrayList<CDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from roomlist where RNAME != 'waitroom' ";

		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				String CNUM = rs.getString("CNUM");
				String RNAME = rs.getString("RNAME");

				String M_COUNT = rs.getString("M_COUNT");
				String BID = rs.getString("BID");
				String R1 = rs.getString("R1");
				String PASSWORD = rs.getString("PASSWORD");

				CDto dto = new CDto(CNUM, RNAME, M_COUNT, BID, R1, PASSWORD);
				dtos.add(dto);
			}
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}

	public void create(String RNAME, String M_COUNT, String R1, String BID, String PASSWORD) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update roomlist set" + " RNAME = '" + RNAME + "', " + "M_COUNT = '" + M_COUNT + "', r1 = '" + R1
				+ "', PASSWORD = '" + PASSWORD + "' where BID = '" + BID + "'";
		try {
//         
			System.out.println("db 입력 완료");
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(query);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				System.out.println("dd");
				e2.printStackTrace();
			}
		}

	}

	public CDto delete(String CNUM) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String query = "delete from roomlist where CNUM = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, CNUM);

			int rn = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;

	}

//	public ArrayList<CDto> userlist() {
//
//		ArrayList<CDto> dtos = new ArrayList<CDto>();
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		System.out.println("유저리스트");
//		try {
//			con = dataSource.getConnection();
//
//			pstmt = con.prepareStatement("select bid from roomlist where rname = 'waitroom'");
//
//			rs = pstmt.executeQuery();
//			String BID = "";
//			System.out.println("유저리스트11111111");
//
//			while (rs.next()) {
//				System.out.println("유저리스트222222222");
//
//				BID = rs.getString(1);
//
//				String CNUM = rs.getString("CNUM");
//				String RNAME = rs.getString("RNAME");
//
//				String M_COUNT = rs.getString("M_COUNT");
//				String R1 = rs.getString("R1");
//				String PASSWORD = rs.getString("PASSWORD");
//
//				System.out.println("유저리스트3333333333");
//				System.out.println("dㅏㄴ에서 찍었을때 : " + BID);
//				CDto dto = new CDto(CNUM, RNAME, M_COUNT, BID, R1, PASSWORD);
//				dtos.add(dto);
//			}
//			System.out.println(BID);
//
//			System.out.println(rs);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (con != null)
//					con.close();
//				if (rs != null)
//					rs.close();
//
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		return dtos;
//	}

}

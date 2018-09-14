package com.stduy.jsp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BDao {

//   private String url = "jdbc:oracle:thin:@localhost:1521:xe";
//   private String uid = "scott";
//   private String upw = "tiger";

	public static final int MEMBER_NONEISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;

	private static BDao instance = new BDao();
	DataSource dataSource = null;
	int listCount = 10; // 한 페이지당 보여줄 게시물의 갯수
	int pageCount = 10; // 하단에 보여줄 페이지 리스트의 갯수

	public BDao() {
		try {

			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static BDao getInstance() {
		return instance;

	}

	public void write(String bName, String bTitle, String bContent, String filename, String password) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into mvc_board"
				+ "(bId, bName,bTitle,bContent,bHit,bGroup,bStep,bIndent,filename,password)" + "values"
				+ "(mvc_board_seq.nextval,?,?,?,0,mvc_board_seq.currval,0,0,?,?)";
		try {
//         
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);

			pstmt.setString(3, bContent);
			pstmt.setString(4, filename);
			pstmt.setString(5, password);
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

	}

//   private Connection getConnection() {
//      Context context = null;
//      DataSource dataSource = null;
//      Connection con = null;
//      try {
//
//         context = new InitialContext();
//         dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
//         con = dataSource.getConnection();
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return con;
//
//   }

	public ArrayList<BDto> list(int curPage, String search, String option) { // 목록 10개씩 분리

		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		int nStart = (curPage - 1) * listCount + 1;
		int nEnd = (curPage - 1) * listCount + listCount;

		try {
			con = dataSource.getConnection();

			if (option == null) {
				String query = "select * " + "  from ( " + "	   select rownum num, A.* " + "	     from ( "
						+ "	        select * " + "	          from mvc_board "
						+ "	         order by bgroup desc, bstep asc ) A " + "	    where rownum <= ? ) B "
						+ "	where B.num >= ? ";

				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, nEnd);
				pstmt.setInt(2, nStart);
			} else if (option.equals("")) {
				String query = "select * " + "  from ( " + "	   select rownum num, A.* " + "	     from ( "
						+ "	        select * " + "	          from mvc_board "
						+ "	         order by bgroup desc, bstep asc ) A " + "	    where rownum <= ? ) B "
						+ "	where B.num >= ? ";

				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, nEnd);
				pstmt.setInt(2, nStart);
			} else if (option.equals("1")) {
				String query = "select * " + "  from ( " + "	   select rownum num, A.* " + "	     from ( "
						+ "	        select * " + "	          from mvc_board " + "             where bTitle like ? "
						+ "	         order by bgroup desc, bstep asc ) A " + "	    where rownum <= ? ) B "
						+ "	where B.num >= ? ";

				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
			} else if (option.equals("2")) {
				String query = "select * " + "  from ( " + "	   select rownum num, A.* " + "	     from ( "
						+ "	        select * " + "	          from mvc_board " + "             where bContent like ? "
						+ "	         order by bgroup desc, bstep asc ) A " + "	    where rownum <= ? ) B "
						+ "	where B.num >= ? ";

				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
			} else if (option.equals("3")) {
				String query = "select * " + "  from ( " + "	   select rownum num, A.* " + "	     from ( "
						+ "	        select * " + "	          from mvc_board " + "             where bName like ? "
						+ "	         order by bgroup desc, bstep asc ) A " + "	    where rownum <= ? ) B "
						+ "	where B.num >= ? ";

				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, nEnd);
				pstmt.setInt(3, nStart);
			}
			resultSet = pstmt.executeQuery();

			while (resultSet.next()) {
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				String filename = resultSet.getString("filename");
				String password = resultSet.getString("password");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");

				BDto dto = new BDto(bId, bName, bTitle, bContent, filename, bDate, bIndent, bHit, bGroup, bStep,
						password);
				dtos.add(dto);

			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (resultSet != null)
					resultSet.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return dtos;
	}

	public BPageInfo articlePage(int curPage, String search, String option) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		int totalCount = 0; // 총 게시물의 갯수
		try {
			con = dataSource.getConnection();

			if (option == null) {
				String query = "select count(*) as total from mvc_board";
				pstmt = con.prepareStatement(query);
			} else if (option.equals("")) {
				String query = "select count(*) as total from mvc_board";
				pstmt = con.prepareStatement(query);
			}

			else if (option.equals("1")) {
				String query = "select count(*) as total from mvc_board where bTitle like ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
			} else if (option.equals("2")) {
				String query = "select count(*) as total from mvc_board where bContent like ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
			} else if (option.equals("3")) {
				String query = "select count(*) as total from mvc_board where bName like ?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "%" + search + "%");
			}

			resultSet = pstmt.executeQuery();

			if (resultSet.next()) {
				totalCount = resultSet.getInt("total");
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (resultSet != null)
					resultSet.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

//      총 페이지 수
		int totalPage = totalCount / listCount;
		if (totalCount % listCount > 0)
			totalPage++;

//      현재 페이지
		int myCurPage = curPage;
		if (myCurPage > totalPage)
			myCurPage = totalPage;
		if (myCurPage < 1)
			myCurPage = 1;

//      시작 페이지
		int startPage = ((myCurPage - 1) / pageCount) * pageCount + 1;

//      끝 페이지
		int endPage = startPage + pageCount - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		BPageInfo pinfo = new BPageInfo();
		pinfo.setTotalCount(totalCount);
		pinfo.setListCount(listCount);
		pinfo.setTotalPage(totalPage);
		pinfo.setCurPage(myCurPage);
		;
		pinfo.setPageCount(pageCount);
		pinfo.setStartPage(startPage);
		pinfo.setEndPage(endPage);

		return pinfo;
	}

	public BDto contentView(String strID) {
		upHit(strID);

		BDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			con = dataSource.getConnection();

			String query = "select * from mvc_board where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(strID));
			resultSet = pstmt.executeQuery();

			if (resultSet.next()) {
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				String filename = resultSet.getString("filename");
				String password = resultSet.getString("password");
				Timestamp bDate = resultSet.getTimestamp("bDate");

				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");

				dto = new BDto(bId, bName, bTitle, bContent, filename, bDate, bIndent, bHit, bGroup, bStep, password);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (resultSet != null)
					resultSet.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public void modify(String bId, String bName, String bTitle, String bContent) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update mvc_board " + "set bName = ?, " + "    bTitle = ?, " + "   bContent = ? "
				+ " where bId = ?";
		try {
//         
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, bId);

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

	}

	private void upHit(String bId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String query = "update mvc_board set bHit = bHit + 1 where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bId);

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

	}

	public void delete(String bId) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String query = "delete from mvc_board where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(bId));

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

	}

	public BDto reply_view(String str) {
		BDto dto = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;

		try {
			con = dataSource.getConnection();

			String query = "select * from mvc_board where bId = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(str));
			resultSet = pstmt.executeQuery();

			if (resultSet.next()) {
				int bId = resultSet.getInt("bId");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				String filename = resultSet.getString("filename");

				String password = resultSet.getString("password");
				Timestamp bDate = resultSet.getTimestamp("bDate");

				int bHit = resultSet.getInt("bHit");
				int bGroup = resultSet.getInt("bGroup");
				int bStep = resultSet.getInt("bStep");
				int bIndent = resultSet.getInt("bIndent");

				dto = new BDto(bId, bName, bTitle, bContent, filename, bDate, bIndent, bHit, bGroup, bStep, password);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
				if (resultSet != null)
					resultSet.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}

	public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep,
			String bIndent) {
		replyShape(bGroup, bStep);

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String query = "insert into mvc_board " + " (bId, bName, bTitle, bContent, bGroup, bStep, bIndent) "
					+ " values (mvc_board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bGroup));
			pstmt.setInt(5, Integer.parseInt(bStep) + 1);
			pstmt.setInt(6, Integer.parseInt(bIndent) + 1);

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
	}

	private void replyShape(String strGroup, String strStep) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = dataSource.getConnection();
			String query = "update mvc_board " + " set bStep = bStep + 1 " + " where bGroup = ? and bStep > ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(strGroup));
			pstmt.setInt(2, Integer.parseInt(strStep));

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

	}

}
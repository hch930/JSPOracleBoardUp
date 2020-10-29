package com.hch.boardup.dao;

import java.sql.*;
import java.util.*;

import com.hch.boardup.dto.BoardBean;
import com.hch.db.ConnectionPool;

public class BoardQuery {
	String board = "boardUp";
	String idxNum = "boardUp_idx_seq.nextval";
	ConnectionPool pool = null;

	public BoardQuery() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("연결 실패");
		}
	}

	public void boardInsert(BoardBean boardBean) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String query = "";

		String name = boardBean.getName();
		String email = boardBean.getEmail();
		String homepage = boardBean.getHomepage();
		String title = boardBean.getTitle();
		String content = boardBean.getContent();
		String pwd = boardBean.getPwd();
		String filename = boardBean.getFilename();
		int filesize = boardBean.getFilesize();
		try {
			query = "insert into " + board + " values(" + idxNum + ",'" + name + "','" + email + "','" + homepage
					+ "','" + title + "','" + content + "','" + pwd + "',sysdate,'" + filename + "'," + filesize
					+ ",0)";
			// for(int i = 0; i < 1000; i++)
			stmt.executeUpdate(query);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			stmt.close();
			pool.releaseConnection(conn);
		}
	}

	public int boardCount() throws SQLException {
		int cnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select count(*) from " + board + " ";

			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("boardCount() : " + e);
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return cnt;
	}

	public Vector getBoardList(int offset, int limit) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector boardList = new Vector();

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select a.* " + " from ( " + " select ROWNUM as RNUM, b.* " + " from ( " + " select * " + " from "
					+ board + " " + " order by idx desc " + " ) b" + " ) a" + " where a.RNUM > " + offset + " "
					+ " and a.RNUM <= " + (offset + limit) + " ";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setHit(rs.getInt("hit"));
				boardBean.setName(rs.getString("name"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setHomepage(rs.getString("homepage"));
				boardBean.setTitle(rs.getString("title"));
				String content = rs.getString("content");
				content = content.replaceAll("\n", "<br>");
				boardBean.setWdate(rs.getString("wdate").substring(0, 10));
				boardBean.setFilename(rs.getString("filename"));
				boardList.add(boardBean);
			}
		} catch (Exception e) {
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return boardList;
	}

	public void boardHitUP(int idx) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();

		try {
			String sql = "update " + board + " set hit=hit+'1' where idx='" + idx + "'";
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			stmt.close();
			pool.releaseConnection(conn);
		}
	}

	public BoardBean boardView(int idx) throws SQLException {
		BoardBean boardBean = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select * from " + board + " where idx=" + idx;
			rs = stmt.executeQuery(sql);
			boardBean = new BoardBean();
			if (rs.next()) {
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setHit(rs.getInt("hit"));
				boardBean.setName(rs.getString("name"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setHomepage(rs.getString("homepage"));
				boardBean.setTitle(rs.getString("title"));
				String content = rs.getString("content");
				content = content.replaceAll("\n", "<br>");
				boardBean.setContent(content);
				boardBean.setWdate(rs.getString("wdate"));
				boardBean.setFilename(rs.getString("filename"));
				boardBean.setFilesize(rs.getInt("filesize"));
				boardBean.setPwd(rs.getString("pwd"));
			}
		} catch (Exception e) {
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return boardBean;
	}

	public boolean passwordCheck(int idx, String pwd) throws SQLException {
		boolean chk = false;

		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();

		ResultSet rs = null;
		String sql = "";
		String pwd2 = "";

		try {
			sql = "select pwd from " + board + " where idx=" + idx;
			rs = stmt.executeQuery(sql);
			rs.next();
			pwd2 = rs.getString(1);

			pwd = pwd.trim();
			pwd2 = pwd2.trim();

			if (pwd.equals(pwd2)) {
				chk = true;
			}
		} catch (Exception e) {
			System.out.println("passwordCheck : " + e);
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return chk;
	}

	public boolean boardUpdate(BoardBean boardBean) throws SQLException {
		boolean result = false;

		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();

		String sql = "";
		int idx = boardBean.getIdx();
		String name = boardBean.getName();
		String email = boardBean.getEmail();
		String homepage = boardBean.getHomepage();
		String title = boardBean.getTitle();
		String content = boardBean.getContent();
		String pwd = boardBean.getPwd();
		String filename = boardBean.getFilename();
		int filesize = boardBean.getFilesize();

		try {
			if (passwordCheck(idx, pwd)) {
				sql = "update " + board + " set name='" + name + "',email='" + email + "',homepage='" + homepage
						+ "',title='" + title + "',content='" + content + "',filename='" + filename + "',filesize="
						+ filesize + " where idx=" + idx;
				// sql = new String(sql.getBytes("8859_1"),"euc-kr");
				stmt.executeQuery(sql);
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			System.out.println("boardUpdate : " + e);
		} finally {
			stmt.close();
			pool.releaseConnection(conn);
		}
		return result;
	}

	public boolean boardDelete(int idx, String pwd) throws SQLException {
		boolean result = false;
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "";

		try {
			if (passwordCheck(idx, pwd)) {
				sql = "delete from " + board + " where idx=" + idx;
				stmt.executeUpdate(sql);
				result = true;
			} else {
				result = false;
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			stmt.close();
			pool.releaseConnection(conn);
		}
		return result;
	}

	public int boardCount(String find, String search) throws SQLException {
		int cnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select count(*) from " + board + " where " + find + " like " + "'%" + search + "%'";
			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("boardCount : " + e);
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return cnt;
	}

	public Vector getSearchList(int offset, int limit, String find, String search) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector searchList = new Vector();

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select a.* " + "from(" + "select ROWNUM as RNUM, b.*" + " from(" + "select *" + " from " + board
					+ " " + " where " + find + " like " + "'%" + search + "%' order by idx desc" + ")b" + ")a"
					+ " where a.RNUM > " + offset + " " + "and a.RNUM <= " + (offset + limit) + " ";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setIdx(rs.getInt("idx"));
				boardBean.setHit(rs.getInt("hit"));
				boardBean.setName(rs.getString("name"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setHomepage(rs.getString("homepage"));
				boardBean.setTitle(rs.getString("title"));
				String content = rs.getString("content");
				content = content.replaceAll("\n", "<br>");
				boardBean.setContent(content);
				boardBean.setWdate(rs.getString("wdate").substring(0, 10));
				searchList.add(boardBean);
			}
		} catch (Exception e) {
			System.out.println("getSearchList : " + e);
		} finally {
			rs.close();
			stmt.close();
			pool.releaseConnection(conn);
		}
		return searchList;
	}
}

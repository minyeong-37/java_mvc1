package mvc01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance;
	
	private MemberDao() {}
	
	public static MemberDao getInstance() {
		if (instance == null) instance = new MemberDao();
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int check(String id, String pwd) throws SQLException {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet existId = null;
		
		String sql = "select * from member2 where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			existId = pstmt.executeQuery();
			
			if (existId.next()) {
				if (existId.getString("passwd").equals(pwd)) result = 1;
				else result = 0;
			} else result = -1;
					
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getStackTrace()[0].getLineNumber() + ": " + e.getMessage());
		} finally {
			if (existId != null) existId.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public int insert(Member member) throws SQLException {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into member2 values(?, ?, ?, ?, ?, sysdate)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getTel());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public int confirm(String id) throws SQLException {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet existId = null;
		
		String sql = "select id from member2 where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			existId = pstmt.executeQuery();
			
			if(existId.next()) result = 1;
			else result = 0;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (existId != null) existId.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
	
	public List<Member> list() throws SQLException {
		List<Member> members = new ArrayList<Member>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet existMembers = null;
		
		String sql = "select * from member2";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			existMembers = pstmt.executeQuery();
			
			while(existMembers.next()) {
				Member mem = new Member();
				mem.setId(existMembers.getString("id"));
				mem.setName(existMembers.getString("name"));
				mem.setAddress(existMembers.getString("address"));
				mem.setTel(existMembers.getString("tel"));
				mem.setRegDate(existMembers.getDate("reg_date"));
				
				members.add(mem);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (existMembers != null) existMembers.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return members;
	}
	
	public Member select(String id) throws SQLException {
		Member member = new Member();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet existMember = null;
		
		String sql = "select * from member2 where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			existMember = pstmt.executeQuery();
			if(existMember.next()) {
				member.setId(id);
				member.setName(existMember.getString("name"));
				member.setAddress(existMember.getString("address"));
				member.setTel(existMember.getString("tel"));
				member.setRegDate(existMember.getDate("reg_date"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (existMember != null) existMember.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return member;
	}
	
	public int update(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update member2 set passwd=?, name=?, address=?, tel=? where id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getPwd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getTel());
			pstmt.setString(5, member.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}

		return result;
	}
	
	public int delete(String id, String pwd) throws SQLException {
		int result = 0;
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		try {
			result = check(id, pwd);
			
			if (result == 1) {
				String sql = "delete member2 where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				result = pstmt.executeUpdate();
				if (result == 0) result = -1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		
		return result;
	}
}

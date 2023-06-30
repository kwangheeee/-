package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.library.common.ConnectionUtil_b;

/**
 * DB에 연결 데이터 입출력 처리
 * @author user
 *
 */
public class RentDao {
	public static void main(String[] args) {
		RentDao dao = new RentDao();
		// 반납테스트
		System.out.println(dao.update(3));
		
		// 입력테스트
//		System.out.println(dao.insert("user", 3));
		// 대여여부 테스트
//		System.out.println(dao.getRentYN(3));
		
		RentDao d = new RentDao();
		d.rentList();
	}
	/**
	 * 도서가 대출 상태를 확인
	 * 
	 * @param no
	 * @return 대출중 : Y
	 * 		   대출가능 : N
	 */
	public String getRentYN(int no) {
		String rentYN="N";
		
//		StringBuffer sb = new StringBuffer();
//		sb.append("select 대여여부 ");
//		sb.append("from 대여 ");
//		sb.append("where 도서번호 = 3 and 대여여부 = 'Y'");
		
		
		String sql = "select tb.*, rownum rn from(select no, 대여일, 반납일 from 대여 full outer join book on 도서번호 = no)tb order by no";
		
		
		try (Connection conn = ConnectionUtil_b.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);){
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rentYN = rs.getString(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return rentYN;
	}
	
	public int insert(String id, int no) {
		int res = 0;
		
		String sql = 
				"insert into 대여 "
				+ "values (seq_대여.nextval, ?,?,'Y'"
				+ "			,sysdate,null,sysdate+7,null)";
		try (Connection conn = ConnectionUtil_b.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			pstmt.setInt(2, no);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int update(int no) {
		int res = 0;
		String sql = 
				"update 대여 "
				+ "set 반납일 = sysdate, 대여여부='N' "
				+ "where 도서번호=?";
		try (Connection conn = ConnectionUtil_b.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
			pstmt.setInt(1, no);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
	public Map<String, Object> rentList() {
		Map<String, Object> map = new HashMap<>();
		String sql = "select tb.*, rownum rn from(select no, 대여일, 반납일 from 대여 full outer join book on 도서번호 = no)tb order by no";
		System.out.println(sql);
		try (Connection conn = ConnectionUtil_b.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();){
			
			while(rs.next()) {
				String no = rs.getString(1);
				String rentDay = rs.getString(2);
				String returnDay = rs.getString(3);
				map.put("no",no);
				map.put("rentDay",rentDay);
				map.put("returnDay",returnDay);
			}
			for(Map.Entry<String, Object> mp : map.entrySet()) {
				System.out.println(mp.getValue());
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
}
















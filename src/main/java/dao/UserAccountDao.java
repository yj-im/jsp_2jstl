package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.UserAccountVO;

// sql 실행을 위한 메소드로만 구성 --> 객체는 한번만 생성해도 됨.(싱글톤 패턴)
// 참고 : vo는 데이터를 저장하는 것이 목적 --> 데이터가 달라질 때 객체 생성하여 저장
public class UserAccountDao {
	private static UserAccountDao dao=new UserAccountDao();
	private UserAccountDao() { }
	public static UserAccountDao getInstance() {
		return dao;
	}
	
	private static final String URL = "jdbc:oracle:thin:@//localhost:1521/xe";
	private static final String USERNAME = "c##idev";
	private static final String PASSWORD = "1234";
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	    
	private Connection getConnection() throws SQLException{
	    	try {
	    		Class.forName(DRIVER);	
	    	}catch(ClassNotFoundException e) {
	    		System.out.println("예외 : "+e.getMessage());
	    	}
	        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	    }
	// 회원가입 - db 테이블에 insert
	//		  - db 테이블의 not null 컬럼 5개 값은 반드시 vo에 저장되어있어야 함.
	//							ㄴ 값이 null 이면 예외 발생(무결성조건 어쩌구)
	//							ㄴ 사용자가 입력한 내용을 유효 여부 검증 -> 자바스크립트
	public int insert(UserAccountVO vo) {
		int result=0;
		 String sql = "INSERT INTO tbl_user_account(userid, username, password, birth, gender, email)" + 
                 "VALUES(?, ?, ?, ?, ?, ?)";
 try (Connection connection = getConnection();
     PreparedStatement pstmt = connection.prepareStatement(sql);
     ) {
         pstmt.setString(1, vo.getUserid());
         pstmt.setString(2, vo.getUsername());
         pstmt.setString(3, vo.getPassword());
         pstmt.setString(4, vo.getBirth());
         pstmt.setString(5, vo.getGender());
         pstmt.setString(6, vo.getEmail());

         result = pstmt.executeUpdate();
     
 } catch (Exception e) {
     System.out.println("예외 : " + e.getMessage());
 }
		return result;
	}


public UserAccountVO selectForLogin(String userid, String password) {
	   
    String sql = "SELECT * FROM TBL_USER_ACCOUNT " + " where userid=? and password=?"; 
                 
    UserAccountVO vo=null;

 try (Connection connection = getConnection();
     PreparedStatement pstmt = connection.prepareStatement(sql);
     ) {
         pstmt.setString(1, userid);
         pstmt.setString(2, password);
         
           ResultSet rs = pstmt.executeQuery();
   if(rs.next()){
	   	
	   				// 모든 컬럼 매핑
//                    vo = new UserAccountVO(
//                    					  rs.getString(1),
//                                          rs.getString(2),
//                                          rs.getString(3),
//                                          rs.getString(4),
//                                          rs.getString(5),
//                                          rs.getString(6));}
	   					vo = new UserAccountVO(
	   										rs.getString(1),
	   										rs.getString(2),
	   										null,
	   										null,
	   										null,
	   										rs.getString(6));}
     
 } catch (Exception e) {
     System.out.println("예외 : " + e.getMessage());
 }
      return vo;
   }
}

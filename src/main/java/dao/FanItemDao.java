package dao;

import java.awt.event.ItemEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.FanItemVO;
import vo.Product;


public class FanItemDao {

	private static FanItemDao dao=new FanItemDao();
	private FanItemDao() {}
	public static FanItemDao getInstance() {
		return dao;
	}
	
	private static final String URL="jdbc:oracle:thin:@//localhost:1521/xe";
	private static final String USERNAME="c##idev";
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
	
	// 1개 행만 조회 : list 사용 안해서 list 관련된거 다지움 반복할필요도없어서 while문 대신 if문 씀
	public FanItemVO selectByPk(int seq) {
		FanItemVO vo=null;
		String sql="SELECT * FROM tbl_fanitem WHERE seq=?";
		
		 try (Connection connection = getConnection();
		            PreparedStatement pstmt = connection.prepareStatement(sql);
		            ) {
			 
			 		pstmt.setInt(1, seq);
			 		ResultSet rs = pstmt.executeQuery();
		            if(rs.next()) {
		                vo = new FanItemVO(rs.getInt(1),
		                                      rs.getString(2),
		                                      rs.getInt(3),
		                                      rs.getInt(4),
		                                      rs.getInt(5),
		                                      rs.getString(6));
		           
		            }
		           
		        } catch (Exception e) {
		            System.out.println("예외 : " + e.getMessage());
		        }
		 return vo;
	}
	
	
	
	// 여러개 행 조회 : list 사용한다.
	public List<FanItemVO> selectAllitems(){
		String sql="SELECT * FROM tbl_fanitem ORDER BY seq";
		 List<FanItemVO> list = null;
	        try (Connection connection = getConnection();
	            PreparedStatement pstmt = connection.prepareStatement(sql);
	            ) {
	               list=new ArrayList<>();

	                ResultSet rs = pstmt.executeQuery();
	                FanItemVO vo = null;
	            while (rs.next()) {
	                vo = new FanItemVO(rs.getInt(1),
	                                      rs.getString(2),
	                                      rs.getInt(3),
	                                      rs.getInt(4),
	                                      rs.getInt(5),
	                                      rs.getString(6));
	                list.add(vo);
	            }
	           
	        } catch (Exception e) {
	            System.out.println("예외 : " + e.getMessage());
	        }
	        return list;
	}
	
	
}

	

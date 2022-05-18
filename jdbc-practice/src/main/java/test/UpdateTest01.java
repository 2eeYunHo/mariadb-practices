package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateTest01 {

	public static void main(String[] args) {
		//update(4L, "전략기획팀");
		DepartmentVo vo = new DepartmentVo();
		vo.setNo(4L);
		vo.setName("기획팀");
		
		update(vo);
	}

	private static boolean update(DepartmentVo vo) {
		Connection connection = null;
		boolean result = false;
		Statement stmt = null;
		try {
			// 1. JDBC DRIVER 로딩 == (JDBC Class 로딩 : class loader)
			Class.forName("org.mariadb.jdbc.Driver");
			// 2. 연결하기
			String url = "jdbc:mysql://192.168.0.146:3306/webdb?charset=utf8";
			connection = DriverManager.getConnection(url, "webdb", "webdb");
			// 2-1. 연결성공시 출력
			// System.out.println("connected!");
			// 3. Statement 생성
			stmt = connection.createStatement();
			// 4. SQL 실행
			String sql = "update department" 
			           + "   set name = '" + vo.getName() 
			           + "'" + "where no = " + vo.getNo();
			int count = stmt.executeUpdate(sql);
			result = count == 1;
		} catch (ClassNotFoundException e) { // 찾을수 없음
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) { // sql 오류
			System.out.println("드라이버 로딩 실패 : " + e);
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				System.out.println("드라이버 로딩 실패 : " + e);
			}
		}
		return result;
	}

}
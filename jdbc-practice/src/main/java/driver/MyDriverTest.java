package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDriverTest {

	public static void main(String[] args) {
		Connection connection = null;
		try {
			// 1. JDBC DRIVER 로딩 == (JDBC Class 로딩 : class loader)
			Class.forName("driver.MyDriver");
			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:4404/webdb";
			connection = DriverManager.getConnection(url, "webdb", "webdb");
			// 2-1. 연결성공시 출력
			System.out.println("connected!");
		} catch (ClassNotFoundException e) { // 찾을수 없음
			System.out.println("드라이버 로딩 실패 : " + e);
		} catch (SQLException e) { // sql 오류
			System.out.println("Error : " + e);
		} finally {
			try {
				if(connection !=null) {
					connection.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}

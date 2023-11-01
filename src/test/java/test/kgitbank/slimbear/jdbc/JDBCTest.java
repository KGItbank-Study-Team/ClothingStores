package test.kgitbank.slimbear.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbcp2.BasicDataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/app/app-context.xml")
public class JDBCTest {
	
	@Autowired
	private BasicDataSource ds;
	
	@Test
	public void getConnection() throws SQLException {
		try{
			ds.getConnection();
			System.out.println("¼º°ø!");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

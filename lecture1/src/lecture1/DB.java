package lecture1;


import java.sql.Connection;	
import java.sql.SQLException;	
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DB {

    static DataSource dataSource = null;

    /*connetion 객체를 생성하여 리턴,
     *  Connection 객체는 DB에 연결하기 위한 JDBC 객체
     *  context.xml 파일에 등록된 정보로 DB에 연결하고, 그 DB연결 객체를 리턴
     *  DB.getConnection 메소드의 파라미터는 DB 이름   
     *  그 이름의 DB 연결 정보가 context.xml 파일에 등록되어 있어야 한다. 
     */
    public static Connection getConnection(String databaseName) throws SQLException, NamingException {
        if (dataSource == null) {
            InitialContext context = new InitialContext();
            dataSource = (DataSource)context.lookup("java:comp/env/jdbc/" + databaseName);
        }
        return dataSource.getConnection();
    }
}

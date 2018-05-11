package lecture1.jdbc1;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lecture1.DB;

public class StudentDAO {

    public static List<Student> findAll() throws Exception { //db의 student 테이블에서 조회한 데이터를 student 객체에 채우고, student 객체들을 ArrayList 에 채워서 리턴
        String sql = "SELECT s.*, d.departmentName " +
                     "FROM student s LEFT JOIN department d ON s.departmentId = d.id";
        //아래에 try with resource 문법 사용(try에서 new ) 
        try (Connection connection = DB.getConnection("student1");	//db에 연결하기 위한 객체
             PreparedStatement statement = connection.prepareStatement(sql);	//sql 명령을 실행하기 위한 객체
             ResultSet resultSet = statement.executeQuery()) {	//statement.executeQuery() 을 실행하면 DB에서 sql명령이 실행되고 결과가 resultset에 채워져 전달
            ArrayList<Student> list = new ArrayList<Student>();
            while (resultSet.next()) {//조회결과 레코드 수 만큼 while문 반복
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setStudentNumber(resultSet.getString("studentNumber"));
                student.setName(resultSet.getString("name"));
                student.setDepartmentId(resultSet.getInt("departmentId"));
                student.setYear(resultSet.getInt("year"));
                student.setDepartmentName(resultSet.getString("departmentName"));
                list.add(student);
            }
            return list;
        }
    }
}

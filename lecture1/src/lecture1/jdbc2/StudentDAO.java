
package lecture1.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import lecture1.DB;

public class StudentDAO {

    public static List<Student> findAll(int currentPage, int pageSize) throws Exception {
        String sql = "SELECT s.*, d.departmentName" +
                     " FROM student s LEFT JOIN department d ON s.departmentId = d.id" +
                     " LIMIT ?, ?";//sql문을 실행하기 전에 물음표 부분에 파라미터 값이 삽입되야함
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, (currentPage - 1) * pageSize);	//물음표 첫번째 위치에 삽입
            statement.setInt(2, pageSize);	//물음표 두번째 위치에 삽입
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Student> list = new ArrayList<Student>();
                while (resultSet.next()) {
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

    public static int count() throws Exception {	//student 테이블의 전체 레코드 수 조회 -리턴하는 메소드
        String sql = "SELECT COUNT(*) FROM student";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
        }
        return 0;
    }
}

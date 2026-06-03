import java.sql.*;

public class ex32{

    static Connection getConnection() throws Exception {
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/studentdb",
                "root",
                "Mamatha22@");
    }

    static void insertStudent(int id, String name) throws Exception {
        Connection con = getConnection();

        String sql = "INSERT INTO students VALUES(?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.setString(2, name);

        ps.executeUpdate();
        con.close();
    }

    static void updateStudent(int id, String name) throws Exception {
        Connection con = getConnection();

        String sql = "UPDATE students SET name=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, id);

        ps.executeUpdate();
        con.close();
    }

    public static void main(String[] args) throws Exception {
        insertStudent(103, "Ram");
        updateStudent(103, "Ravi");
    }
}
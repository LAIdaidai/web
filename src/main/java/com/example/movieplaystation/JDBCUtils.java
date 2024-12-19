package com.example.movieplaystation;

import java.sql.*;

public class JDBCUtils {

    public static Connection getConnection() throws SQLException {
        // 使用连接池或直接连接数据库的代码
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/webs", "xukeli", "root");
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


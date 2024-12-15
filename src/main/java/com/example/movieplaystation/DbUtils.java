package com.example.movieplaystation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DbUtils {

    private static final String URL = "jdbc:mysql://localhost:3306/web"; // 请替换为你的数据库 URL
    private static final String USER = "laiyuci";  // 数据库用户名
    private static final String PASSWORD = "1"; // 数据库密码

    static {
        try {
            // 加载数据库驱动（通常情况下不需要，因为大部分 JDBC 驱动类会自动加载）
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 插入评论的方法
    public static boolean insertComment(String videoId, String username, String content) {
        String sql = "INSERT INTO comments (video_id, username, comment_text) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, videoId);
            stmt.setString(2, username);
            stmt.setString(3, content);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

package com.example.movieplaystation.Comments;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertComment {

    private static final String URL = "jdbc:mysql://localhost:3306/web";
    private static final String USER = "laiyuci";
    private static final String PASSWORD = "1";

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
        String sql = "INSERT INTO comments (video_id, username, comment_text, comment_time) VALUES (?, ?, ?, NOW())";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(videoId));
            stmt.setString(2, username);
            stmt.setString(3, content);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();  // 打印出详细的错误信息，便于调试
            return false;
        } catch (NumberFormatException e) {
            // 处理 videoId 转换为 int 失败的情况
            e.printStackTrace();
            return false;
        }
    }
}

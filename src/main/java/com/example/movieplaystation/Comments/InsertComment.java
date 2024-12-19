package com.example.movieplaystation.Comments;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.example.movieplaystation.JDBCUtils;

public class InsertComment {


    static {
        try {
            // 加载数据库驱动（通常情况下不需要，因为大部分 JDBC 驱动类会自动加载）
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }



    // 插入评论的方法
    public static boolean insertComment(String videoId, String username, String content) {
        String sql = "INSERT INTO comments (video_id, username, comment_text, comment_time) VALUES (?, ?, ?, NOW())";
        try (Connection conn = JDBCUtils.getConnection();
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

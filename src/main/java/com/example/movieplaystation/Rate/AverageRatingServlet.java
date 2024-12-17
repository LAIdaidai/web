package com.example.movieplaystation.Rate;

import java.sql.*;

public class AverageRatingServlet {

    // 获取视频平均评分的方法
    public static double getAverageRatingByVideoId(int videoId) {
        double averageRating = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 数据库连接
            String dbURL = "jdbc:mysql://localhost:3306/web";
            String dbUsername = "laiyuci";
            String dbPassword = "1";
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // 查询视频的平均评分
            String sql = "SELECT average_rating FROM videos WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, videoId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                averageRating = rs.getDouble("average_rating");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return averageRating;
    }
}

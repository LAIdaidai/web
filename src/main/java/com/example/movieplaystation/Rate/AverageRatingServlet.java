package com.example.movieplaystation.Rate;

import com.example.movieplaystation.JDBCUtils;
import jakarta.servlet.http.HttpServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AverageRatingServlet extends HttpServlet{

    // 获取视频平均评分的方法
    public static double getAverageRatingByVideoId(int videoId) {
        double averageRating = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 数据库连接
            conn = JDBCUtils.getConnection();

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

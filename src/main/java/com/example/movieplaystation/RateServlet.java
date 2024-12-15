package com.example.movieplaystation;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
//计算平均分
@WebServlet("/RateServlet")
public class RateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取请求参数
        String videoId = request.getParameter("videoId");
        String username = request.getParameter("username");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // 存储评分到数据库
        try (Connection conn = DbUtils.getConnection()) {
            String sql = "INSERT INTO ratings (video_id, username, rating) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, Integer.parseInt(videoId));
                stmt.setString(2, username);
                stmt.setInt(3, rating);
                stmt.executeUpdate();
            }

            // 更新视频的平均评分
            updateAverageRating(Integer.parseInt(videoId));

            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void updateAverageRating(int videoId) throws SQLException {
        try (Connection conn = DbUtils.getConnection()) {
            // 获取该视频的所有评分
            String sql = "SELECT AVG(rating) FROM ratings WHERE video_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, videoId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    double averageRating = rs.getDouble(1);
                    // 更新视频的平均评分
                    String updateSql = "UPDATE videos SET average_rating = ? WHERE id = ?";
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setDouble(1, averageRating);
                        updateStmt.setInt(2, videoId);
                        updateStmt.executeUpdate();
                    }
                }
            }
        }
    }
}

package com.example.movieplaystation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdatePlayHistoryServlet")
public class UpdatePlayHistoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");
        String username = request.getParameter("username");

        if (videoId != null && username != null) {
            // 将 videoId 和 username 转换为合适的类型
            int videoIdInt = Integer.parseInt(videoId);

            // 先检查是否已存在播放历史记录
            String checkHistoryQuery = "SELECT * FROM play_history WHERE video_id = ? AND username = ?";
            try (Connection connection = JDBCUtils.getConnection();
                 PreparedStatement checkStmt = connection.prepareStatement(checkHistoryQuery)) {
                checkStmt.setInt(1, videoIdInt);
                checkStmt.setString(2, username);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // 如果存在，更新记录
                    String updateHistoryQuery = "UPDATE play_history SET play_time = NOW() WHERE video_id = ? AND username = ?";
                    try (PreparedStatement updateStmt = connection.prepareStatement(updateHistoryQuery)) {
                        updateStmt.setInt(1, videoIdInt);
                        updateStmt.setString(2, username);
                        updateStmt.executeUpdate();
                    }
                } else {
                    // 如果不存在，插入新记录
                    String insertHistoryQuery = "INSERT INTO play_history (username, video_id, play_time) VALUES (?, ?, NOW())";
                    try (PreparedStatement insertStmt = connection.prepareStatement(insertHistoryQuery)) {
                        insertStmt.setString(1, username);
                        insertStmt.setInt(2, videoIdInt);
                        insertStmt.executeUpdate();
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


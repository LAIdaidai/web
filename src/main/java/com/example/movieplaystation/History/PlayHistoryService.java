package com.example.movieplaystation.History;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.*;
import java.util.*;

import com.example.movieplaystation.JDBCUtils;

public class PlayHistoryService {
    public Map<String, List<History>> getPlayHistoryByUsername(String username) {
        Map<String, List<History>> groupedHistory = new TreeMap<>();  // 使用 TreeMap 按日期排序

        try (Connection connection = JDBCUtils.getConnection()) {
            String sql = "SELECT p.video_id, v.cover_image_path, p.username, v.title, p.play_time " +
                    "FROM play_history p " +
                    "JOIN videos v ON p.video_id = v.id " +
                    "WHERE p.username = ?";

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, username);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        int videoId = rs.getInt("video_id");
                        String coverImagePath = rs.getString("cover_image_path");
                        String user = rs.getString("username");
                        String title = rs.getString("title");
                        LocalDateTime playTime = rs.getTimestamp("play_time").toLocalDateTime();

                        History playHistory = new History(videoId, coverImagePath, user, title, playTime);

                        // 按日期分组
                        String dateKey = playTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                        groupedHistory.computeIfAbsent(dateKey, k -> new ArrayList<>()).add(playHistory);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return groupedHistory;
    }
}

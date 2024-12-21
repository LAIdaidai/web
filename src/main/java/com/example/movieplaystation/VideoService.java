package com.example.movieplaystation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoService {
    public static List<Video> getAllVideos() {
        List<Video> videoList = new ArrayList<>();
        String sql = "SELECT * FROM videos";

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Video video = new Video(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("video_path"),
                        rs.getDouble("average_rating"),
                        rs.getString("region"),
                        rs.getString("cover_image_path")
                );
                videoList.add(video);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return videoList;
    }
}

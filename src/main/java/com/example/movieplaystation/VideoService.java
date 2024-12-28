package com.example.movieplaystation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideoService {
    // 获取所有视频
    public static List<Video> getAllVideos() {
        List<Video> videoList = new ArrayList<>();
        String sql = "SELECT * FROM videos";  // 确保表名和字段名正确

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // 检查查询结果
            if (rs == null) {
                System.out.println("查询结果为空");
                return videoList;
            }

            while (rs.next()) {
                // 根据数据库字段创建 Video 对象
                Video video = new Video(
                        rs.getInt("id"),                          // 确保 "id" 列名正确
                        rs.getString("title"),                    // 确保 "title" 列名正确
                        rs.getString("video_path"),               // 确保 "video_path" 列名正确
                        rs.getDouble("average_rating"),           // 确保 "average_rating" 列名正确
                        rs.getString("region"),                   // 确保 "region" 列名正确
                        rs.getString("cover_image_path"),         // 确保 "cover_image_path" 列名正确
                        rs.getString("type")                      // 添加获取 "type" 字段
                );
                videoList.add(video);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接或查询出错: " + e.getMessage());
        }
        return videoList;
    }

    // 删除视频的方法
    public static boolean deleteVideo(int videoId) {
        String sql = "DELETE FROM videos WHERE id = ?";  // 删除指定视频ID的SQL语句
        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, videoId);  // 设置视频ID

            int rowsAffected = stmt.executeUpdate();  // 执行删除操作
            return rowsAffected > 0;  // 如果有记录被删除，返回 true

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("删除视频时发生错误: " + e.getMessage());
            return false;  // 如果删除失败，返回 false
        }
    }
}

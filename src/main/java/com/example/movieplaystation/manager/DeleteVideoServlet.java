package com.example.movieplaystation.manager;

import com.example.movieplaystation.JDBCUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.io.File;

@WebServlet("/DeleteVideoServlet")
public class DeleteVideoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int videoId = Integer.parseInt(request.getParameter("videoId"));

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // 获取数据库连接
            connection = JDBCUtils.getConnection();

            // 获取视频文件的路径
            String sql = "SELECT video_path, cover_image_path FROM videos WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, videoId);
            ResultSet resultSet = statement.executeQuery();

            String videoPath = null;
            String coverImagePath = null;

            if (resultSet.next()) {
                videoPath = resultSet.getString("video_path");
                coverImagePath = resultSet.getString("cover_image_path");
            }

            // 删除视频记录
            sql = "DELETE FROM videos WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, videoId);
            statement.executeUpdate();

            // 删除文件
            if (videoPath != null && coverImagePath != null) {
                // 删除视频文件
                File videoFile = new File(getServletContext().getRealPath(videoPath));
                if (videoFile.exists()) {
                    videoFile.delete(); // 删除视频文件
                }

                // 删除封面图片文件
                File coverImageFile = new File(getServletContext().getRealPath(coverImagePath));
                if (coverImageFile.exists()) {
                    coverImageFile.delete(); // 删除封面图片文件
                }
            }

            request.setAttribute("message", "视频删除成功！");

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "数据库错误，请稍后重试！");
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 重定向到搜索结果页面或其他页面
        RequestDispatcher dispatcher = request.getRequestDispatcher("/SearchServlet");
        dispatcher.forward(request, response);
    }
}


package com.example.movieplaystation.manager;

import com.example.movieplaystation.JDBCUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteVideoServlet")
public class DeleteVideoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int videoId = Integer.parseInt(request.getParameter("videoId"));

        Connection connection = null;
        PreparedStatement statement = null;
        PreparedStatement selectStatement = null;

        try {
            // 获取数据库连接
            connection = JDBCUtils.getConnection();

            // 查询视频文件和封面文件路径的 SQL 语句
            String selectSql = "SELECT video_path, cover_image_path FROM videos WHERE id = ?";
            selectStatement = connection.prepareStatement(selectSql);
            selectStatement.setInt(1, videoId);

            ResultSet resultSet = selectStatement.executeQuery();

            String videoPath = null;
            String coverImagePath = null;

            if (resultSet.next()) {
                videoPath = resultSet.getString("video_path");
                coverImagePath = resultSet.getString("cover_image_path");
            }

            // 如果未找到视频记录，返回错误
            if (videoPath == null || coverImagePath == null) {
                request.setAttribute("errorMessage", "未找到视频记录，删除失败！");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/SearchServlet");
                dispatcher.forward(request, response);
                return;
            }

            // 删除文件系统中的视频文件
            File videoFile = new File(getServletContext().getRealPath(videoPath));
            File coverFile = new File(getServletContext().getRealPath(coverImagePath));

            boolean videoDeleted = true;
            boolean coverDeleted = true;

            if (videoFile.exists()) {
                videoDeleted = videoFile.delete(); // 删除视频文件
            }

            if (coverFile.exists()) {
                coverDeleted = coverFile.delete(); // 删除封面文件
            }

            // 打印删除状态日志
            if (!videoDeleted) {
                System.err.println("视频文件删除失败: " + videoPath);
            }
            if (!coverDeleted) {
                System.err.println("封面文件删除失败: " + coverImagePath);
            }

            // 删除数据库记录的 SQL 语句
            String deleteSql = "DELETE FROM videos WHERE id = ?";
            statement = connection.prepareStatement(deleteSql);
            statement.setInt(1, videoId);

            // 执行删除操作
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("message", "视频删除成功！");
            } else {
                request.setAttribute("errorMessage", "未找到视频记录，删除失败！");
            }
        } catch (SQLException e) {
            // 数据库错误处理
            e.printStackTrace();
            request.setAttribute("errorMessage", "数据库错误，请稍后重试！");
        } finally {
            // 关闭数据库连接
            try {
                if (selectStatement != null) selectStatement.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 无论成功或失败，最终都重定向到 /SearchServlet
        RequestDispatcher dispatcher = request.getRequestDispatcher("/SearchServlet");
        dispatcher.forward(request, response);
    }
}

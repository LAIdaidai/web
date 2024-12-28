package com.example.movieplaystation.page;

import com.example.movieplaystation.JDBCUtils;
import com.example.movieplaystation.Video;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/TopRatedVideosServlet")
public class TopRatedVideosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = JDBCUtils.getConnection();
            String sql = "SELECT id, title, cover_image_path, average_rating FROM videos ORDER BY average_rating DESC LIMIT 4";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            List<Video> topRatedVideos = new ArrayList<>();
            while (resultSet.next()) {
                Video video = new Video();
                video.setId(resultSet.getInt("id"));
                video.setTitle(resultSet.getString("title"));
                video.setCoverImagePath(resultSet.getString("cover_image_path"));
                video.setAverageRating(resultSet.getDouble("average_rating"));
                topRatedVideos.add(video);
            }

            // 将视频列表传递到 JSP 页面
            request.setAttribute("topRatedVideos", topRatedVideos);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "数据库查询出错");
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


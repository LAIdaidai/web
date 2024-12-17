package com.example.movieplaystation;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户输入的搜索关键词
        String searchQuery = request.getParameter("searchQuery");

        // 创建数据库连接
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // 假设你已经在 web.xml 配置了数据库连接
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web", "laiyuci", "1");

            // 查询视频表，根据搜索关键词模糊查找视频标题
            String sql = "SELECT * FROM videos WHERE title LIKE ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchQuery + "%");
            resultSet = statement.executeQuery();

            // 将查询结果保存到 request 中
            List<Video> videoList = new ArrayList<>();
            while (resultSet.next()) {
                Video video = new Video();
                video.setId(resultSet.getInt("id"));
                video.setTitle(resultSet.getString("title"));
                video.setVideoPath(resultSet.getString("cover_image_path"));
                videoList.add(video);
            }

            // 将视频列表传递到 JSP 页面
            request.setAttribute("videoList", videoList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/searchResults.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
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

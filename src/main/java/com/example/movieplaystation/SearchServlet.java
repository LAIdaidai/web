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
        // 获取用户选择的搜索方式
        String searchBy = request.getParameter("searchBy");
        // 获取搜索内容
        String searchQuery = request.getParameter("searchQuery");

        // 创建数据库连接
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = JDBCUtils.getConnection();

            // 构建 SQL 查询语句
            String sql = "";
            List<String> params = new ArrayList<>();

            // 根据用户选择的搜索方式构建 SQL
            if ("title".equals(searchBy)) {
                sql = "SELECT * FROM videos WHERE title LIKE ?";
                params.add("%" + searchQuery + "%");
            } else if ("category".equals(searchBy)) {
                sql = "SELECT * FROM videos WHERE type LIKE ?";
                params.add("%" + searchQuery + "%");
            } else if ("region".equals(searchBy)) {
                sql = "SELECT * FROM videos WHERE region LIKE ?";
                params.add("%" + searchQuery + "%");
            }

            // 准备 SQL 语句
            statement = connection.prepareStatement(sql);

            // 设置查询参数
            for (int i = 0; i < params.size(); i++) {
                statement.setString(i + 1, params.get(i));
            }

            // 执行查询
            resultSet = statement.executeQuery();

            // 将查询结果保存到 request 中
            List<Video> videoList = new ArrayList<>();
            while (resultSet.next()) {
                Video video = new Video();
                video.setId(resultSet.getInt("id"));
                video.setTitle(resultSet.getString("title"));
                video.setVideoPath(resultSet.getString("cover_image_path"));
                video.setType(resultSet.getString("type"));
                video.setRegion(resultSet.getString("region"));
                videoList.add(video);
            }

            // 将视频列表传递到 JSP 页面
            request.setAttribute("videoList", videoList);
            // 也将搜索条件传递给 JSP 页面，以便显示和维持查询
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("searchBy", searchBy);

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

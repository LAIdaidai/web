package com.example.movieplaystation;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteVideoServlet")
public class DeleteVideoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int videoId = Integer.parseInt(request.getParameter("videoId"));

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // 获取数据库连接
            connection = JDBCUtils.getConnection();

            // 删除视频的 SQL 语句
            String sql = "DELETE FROM videos WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, videoId);

            // 执行删除操作
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                // 删除成功
                request.setAttribute("message", "视频删除成功！");
            } else {
                // 删除失败
                request.setAttribute("errorMessage", "未找到视频，删除失败！");
            }
        } catch (SQLException e) {
            // 数据库错误处理
            e.printStackTrace();
            request.setAttribute("errorMessage", "数据库错误，请稍后重试！");
        } finally {
            // 关闭数据库连接
            try {
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

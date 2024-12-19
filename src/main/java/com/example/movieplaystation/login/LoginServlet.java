package com.example.movieplaystation.login;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取前端传来的用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 数据库连接信息
        String dbURL = "jdbc:mysql://localhost:3306/webs";
        String dbUsername = "xukeli";
        String dbPassword = "root";

        // 数据库验证逻辑
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // 连接到数据库
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL 查询语句，检查用户是否存在且密码是否正确
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            resultSet = preparedStatement.executeQuery();

            // 判断是否找到匹配的用户
            if (resultSet.next()) {
                // 登录成功，跳转到 index.jsp
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
                // 登录失败，返回错误信息
                request.setAttribute("errorMessage", "用户名或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "数据库连接错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

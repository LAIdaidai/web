package com.example.movieplaystation.login;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import com.example.movieplaystation.JDBCUtils;
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取前端提交的用户名、密码和确认密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        // 数据库连接对象
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        // 判断密码和确认密码是否一致
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "两次输入的密码不一致！");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            // 连接到数据库
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = JDBCUtils.getConnection();

            // SQL 查询，检查用户名是否已存在
            String checkUserSQL = "SELECT * FROM users WHERE username = ?";
            preparedStatement = connection.prepareStatement(checkUserSQL);
            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();

            // 如果用户名已经存在，返回提示信息
            if (resultSet.next()) {
                request.setAttribute("errorMessage", "用户名已存在！");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // 否则，将用户信息插入到数据库
                String insertSQL = "INSERT INTO users (username, password,register_time) VALUES (?, ?,NOw())";
                preparedStatement = connection.prepareStatement(insertSQL);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    // 注册成功，设置成功消息并转发到注册页面
                    request.setAttribute("successMessage", "注册成功！请登录。");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "注册失败，请重试！");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "数据库连接错误");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

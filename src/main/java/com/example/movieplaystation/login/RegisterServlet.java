package com.example.movieplaystation.login;

import com.example.movieplaystation.JDBCUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取前端提交的用户名、手机号、密码和确认密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phone = request.getParameter("phone"); // 获取手机号

        // 数据库连接对象
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        // 判断密码和确认密码是否一致
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "两次输入的密码不一致！");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // 验证手机号格式 (可以根据需求调整)
        if (phone == null || !phone.matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("errorMessage", "请输入有效的手机号！");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            // 连接到数据库
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = JDBCUtils.getConnection();

            // SQL 查询，检查用户名和手机号是否已存在
            String checkUserSQL = "SELECT * FROM users WHERE username = ? OR phonenumber = ?";
            preparedStatement = connection.prepareStatement(checkUserSQL);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, phone);

            ResultSet resultSet = preparedStatement.executeQuery();

            // 如果用户名或手机号已存在，返回提示信息
            if (resultSet.next()) {
                if (resultSet.getString("username").equals(username)) {
                    request.setAttribute("errorMessage", "用户名已存在！");
                } else {
                    request.setAttribute("errorMessage", "手机号已注册！");
                }
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // 否则，将用户信息（包括手机号）插入到数据库
                String insertSQL = "INSERT INTO users (username, password, phonenumber, register_time) VALUES (?, ?, ?, NOW())";
                preparedStatement = connection.prepareStatement(insertSQL);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, phone);

                int rowsAffected = preparedStatement.executeUpdate();
                if (rowsAffected > 0) {
                    // 注册成功，设置成功消息
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

package com.example.movieplaystation.login;

import com.example.movieplaystation.JDBCUtils;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/forgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");

        // 去除手机号中的空格及其它非数字字符
        phone = phone.replaceAll("[^0-9]", "");

        // 检查手机号格式是否有效
        if (!isPhoneValid(phone)) {
            request.setAttribute("errorMessage", "手机号格式不正确，请重新输入！");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        // 查询数据库，验证用户名和手机号是否匹配
        String password = checkUserExists(username, phone);

        if (password != null) {
            // 验证成功，返回重置密码页面
            request.setAttribute("message", "验证成功！您的密码是：");
            request.setAttribute("password", password);  // 设置密码信息
        } else {
            // 验证失败
            request.setAttribute("errorMessage", "验证失败：用户名或手机号不匹配！");
        }

        // 转发到当前页面显示消息
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    // 检查手机号格式是否合法
    private boolean isPhoneValid(String phone) {
        String regex = "^1[3-9]\\d{9}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(phone);
        return matcher.matches();
    }

    // 查询数据库验证用户名和手机号，并返回密码
    private String checkUserExists(String username, String phone) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // 使用 JDBCUtils 获取数据库连接
            conn = JDBCUtils.getConnection();
            // 打印调试信息
            System.out.println("查询用户名: " + username + "，手机号: " + phone);

            String sql = "SELECT password FROM users WHERE username = ? AND phonenumber = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, phone);
            rs = stmt.executeQuery();

            // 打印查询返回的信息
            if (rs.next()) {
                System.out.println("查询成功，密码: " + rs.getString("password"));
                return rs.getString("password");
            } else {
                System.out.println("用户名或手机号不匹配");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 使用 JDBCUtils 的 close 方法关闭资源
            JDBCUtils.close(rs, stmt, conn);
        }

        return null;
    }
}

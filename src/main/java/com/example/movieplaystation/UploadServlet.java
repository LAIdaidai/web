package com.example.movieplaystation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单数据
        String title = request.getParameter("title");
        String region = request.getParameter("region");
        String type = request.getParameter("type");  // 获取影视类型
        Part videoPart = request.getPart("videoFile");
        Part imagePart = request.getPart("coverImage");

        // 文件保存路径
        String videoPath = getServletContext().getRealPath("/videos/") + title + ".mp4";
        String imagePath = getServletContext().getRealPath("/images/") + title + ".png";

        // 保存文件
        videoPart.write(videoPath);
        imagePart.write(imagePath);

        // 保存数据到数据库
        try (Connection conn = JDBCUtils.getConnection()) {
            String sql = "INSERT INTO videos (title, video_path, region, cover_image_path, type) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, title);
                stmt.setString(2, "/videos/" + title + ".mp4");
                stmt.setString(3, region);
                stmt.setString(4, "/images/" + title + ".png");
                stmt.setString(5, type);  // 插入类型
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 重定向到首页
        response.sendRedirect("index.jsp");
    }
}

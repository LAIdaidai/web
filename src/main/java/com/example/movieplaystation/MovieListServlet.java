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
import com.example.movieplaystation.JDBCUtils;

@WebServlet("/movieList")
public class MovieListServlet extends HttpServlet {

    // 静态代码块加载JDBC驱动
    static {
        try {
            // 加载MySQL数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace(); // 打印异常信息
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // 使用 JDBCUtils 获取数据库连接
            conn = JDBCUtils.getConnection();
            if (conn == null) {
                System.out.println("数据库连接失败！");
            } else {
                System.out.println("成功连接到数据库！");
            }

            // SQL 查询所有视频
            String sql = "SELECT id, title, cover_image_path FROM videos";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            // 检查是否有返回的结果
            if (!rs.next()) {
                System.out.println("没有从数据库中获取到视频数据！");
            } else {
                // 将查询到的结果映射为 Video 对象并存入一个 List
                List<Video> videoList = new ArrayList<>();
                do {
                    Video video = new Video();
                    video.setId(rs.getInt("id"));
                    video.setTitle(rs.getString("title"));
                    video.setVideoPath(rs.getString("cover_image_path"));

                    videoList.add(video);
                } while (rs.next());

                // 将 Video 列表传递给 JSP 页面
                request.setAttribute("videoList", videoList);

                // 转发到 JSP 页面
                RequestDispatcher dispatcher = request.getRequestDispatcher("/movies.jsp");
                dispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

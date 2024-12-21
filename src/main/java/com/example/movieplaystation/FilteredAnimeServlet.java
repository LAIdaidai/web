package com.example.movieplaystation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilteredAnimeServlet", value = "/FilteredAnimeServlet")
public class FilteredAnimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        String region = request.getParameter("region");
        String sort = request.getParameter("sort");

        if (region == null) region = "all";
        if (sort == null) sort = "rating";

        List<Video> videoList = new ArrayList<>();  // 修改为 Video 类型

        StringBuilder sql = new StringBuilder("SELECT * FROM videos WHERE 1=1");
        if (!region.equals("all")) {
            sql.append(" AND region = ?");
        }
        if ("rating".equals(sort)) {
            sql.append(" ORDER BY average_rating DESC");
        } else if ("newest".equals(sort)) {
            sql.append(" ORDER BY id DESC");
        }

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (!region.equals("all")) {
                stmt.setString(paramIndex++, region);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // 确保从 ResultSet 中读取的列名正确
                    Video video = new Video(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("video_path"),
                            rs.getDouble("average_rating"),
                            rs.getString("region"),
                            rs.getString("cover_image_path"),
                            rs.getString("type")
                    );
                    videoList.add(video);
                }
            } catch (SQLException e) {
                System.err.println("读取结果集错误：" + e.getMessage());
                e.printStackTrace();
            }
        } catch (SQLException e) {
            System.err.println("数据库查询执行失败：" + e.getMessage());
            e.printStackTrace();
        }


        request.setAttribute("videoList", videoList);  // 设置 videoList 到 request
        request.getRequestDispatcher("/anime.jsp").forward(request, response);  // 跳转到 JSP 页面
    }
}

package com.example.movieplaystation.page;

import com.example.movieplaystation.JDBCUtils;
import com.example.movieplaystation.Video;
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

        // 获取请求参数
        String region = request.getParameter("region");
        String sort = request.getParameter("sort");
        String type = request.getParameter("type");

        // 设置默认值
        if (region == null) region = "all";
        if (sort == null) sort = "rating";
        if (type == null) type = "all";  // 默认为所有类型

        List<Video> videoList = new ArrayList<>();  // 存储查询到的视频

        // 构建 SQL 查询
        StringBuilder sql = new StringBuilder("SELECT * FROM videos WHERE 1=1");
        if (!region.equals("all")) {
            sql.append(" AND region = ?");
        }
        if (!type.equals("all")) {
            sql.append(" AND type = ?");
        }
        if ("rating".equals(sort)) {
            sql.append(" ORDER BY average_rating DESC");
        } else if ("newest".equals(sort)) {
            sql.append(" ORDER BY id DESC");
        }

        try (Connection conn = JDBCUtils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;

            // 设置 region 参数
            if (!region.equals("all")) {
                stmt.setString(paramIndex++, region);
            }

            // 设置 type 参数
            if (!type.equals("all")) {
                stmt.setString(paramIndex++, type);
            }

            // 执行查询
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // 从 ResultSet 中获取数据并创建 Video 对象
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

        // 将查询结果传递到 JSP 页面
        request.setAttribute("videoList", videoList);
        request.setAttribute("region", region);
        request.setAttribute("sort", sort);
        request.setAttribute("type", type);  // 设置 type 参数

        request.getRequestDispatcher("/anime.jsp").forward(request, response);
    }
}


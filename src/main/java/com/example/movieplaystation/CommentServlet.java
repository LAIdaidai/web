package com.example.movieplaystation;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class CommentServlet extends HttpServlet {

    // 处理评论提交
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String videoId = request.getParameter("videoId");  // 获取视频ID
        String commentText = request.getParameter("commentText");  // 获取评论内容
        String username = (String) request.getSession().getAttribute("username");  // 获取当前用户的用户名

        // 如果用户没有登录，默认使用 "匿名"
        if (username == null) {
            username = "匿名";
        }

        // 插入评论到数据库
        try {
            boolean success = DbUtils.insertComment(videoId, username, commentText);
            if (success) {
                // 评论提交成功后，重定向到视频页面并带上视频ID
                response.sendRedirect("video.jsp?videoId=" + videoId);
            } else {
                response.getWriter().write("评论提交失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("数据库错误！");
        }
    }


    // 获取视频的所有评论
    public static List<Comment> getCommentsByVideoId(int videoId) {
        List<Comment> commentList = new ArrayList<>();
        try (Connection conn = DbUtils.getConnection()) {
            String sql = "SELECT username, comment_text, comment_time FROM comments WHERE video_id = ? ORDER BY comment_time DESC";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, videoId);  // 使用视频ID查询评论
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        String username = rs.getString("username");
                        String commentText = rs.getString("comment_text");
                        Timestamp commentTime = rs.getTimestamp("comment_time");
                        commentList.add(new Comment(username, commentText, commentTime));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }
}

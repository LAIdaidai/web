package com.example.movieplaystation.Comments;

import com.example.movieplaystation.JDBCUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentId = request.getParameter("commentId");

        if (commentId != null) {
            try (Connection conn = JDBCUtils.getConnection()) {
                String sql = "DELETE FROM comments WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, Integer.parseInt(commentId));
                    int rows = stmt.executeUpdate();
                    if (rows > 0) {
                        System.out.println("删除评论成功，ID: " + commentId);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "评论删除失败");
                return;
            }
        }

        // 重定向回视频页面
        String videoId = request.getParameter("videoId");
        response.sendRedirect("video.jsp?videoId=" + videoId);
    }
}

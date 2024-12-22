package com.example.movieplaystation;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/viewHistory")
public class ViewHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");

        if (username != null) {
            PlayHistoryService playHistoryService = new PlayHistoryService();
            // 获取按日期分组的历史记录
            Map<String, List<PlayHistory>> groupedHistory = playHistoryService.getPlayHistoryByUsername(username);

            // 将分组后的历史记录传递给 JSP 页面
            request.setAttribute("groupedHistory", groupedHistory);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/viewHistory.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");  // 如果没有登录，跳转到登录页面
        }
    }
}

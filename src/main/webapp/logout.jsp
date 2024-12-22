<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 销毁会话
    session.invalidate();
    // 重定向到主页或登录页
    response.sendRedirect("index.jsp");
%>

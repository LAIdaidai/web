<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>找回密码</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="网站Logo" />
        找回密码
    </div>
</header>

<main>
    <h1>找回密码</h1>
    <p>请输入您的用户名和手机号以验证身份。</p>
    <form action="forgotPasswordServlet" method="POST">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名" required />
        </div>

        <div class="form-group">
            <label for="phone">手机号：</label>
            <input type="text" id="phone" name="phone" placeholder="请输入手机号" required />
        </div>

        <div class="form-group">
            <button type="submit" class="login-btn">验证身份</button>
        </div>

        <div class="form-group">
            <p>
                <a href="login.jsp">返回登录</a>
            </p>
        </div>
    </form>

    <%-- 显示成功消息 --%>
    <%
        String message = (String) request.getAttribute("message");
        String password = (String) request.getAttribute("password");
        if (message != null && !message.isEmpty()) {
    %>
    <p style="color: green;"><%= message %></p>
    <p>找回的密码是：<%= password %></p>  <!-- 显示密码 -->
    <% } %>

    <%-- 显示错误消息 --%>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
    <p style="color: red;"><%= errorMessage %></p>
    <% } %>

</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

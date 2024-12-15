<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>用户登录</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="网站Logo" />欢迎登录
    </div>
</header>

<main>
    <h1>用户登录</h1>
    <!-- 显示错误信息 -->
    <c:if test="${not empty errorMessage}">
        <p style="color:red">${errorMessage}</p>
    </c:if>
    <form action="loginServlet.jsp" method="POST">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名" required />
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required />
        </div>

        <div class="form-group">
            <button type="submit" class="login-btn">登录</button>
        </div>

        <div class="form-group">
            <p>没有账号？<a href="register.jsp">立即注册</a></p>
        </div>
    </form>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

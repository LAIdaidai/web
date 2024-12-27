<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>用户注册</title>
    <link rel="stylesheet" href="css/register.css">

</head>
<body>

<!-- 头部导航栏 -->
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="网站Logo" />欢迎注册
    </div>
</header>

<!-- 注册表单 -->
<main>
    <h1>用户注册</h1>

    <form action="RegisterServlet" method="POST" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" id="username" name="username" placeholder="请输入用户名" required />
        </div>

        <div class="form-group">
            <label for="phone">手机号：</label>
            <input type="text" id="phone" name="phone" placeholder="请输入手机号" />
        </div>

        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" placeholder="请输入密码" required />
        </div>

        <div class="form-group">
            <label for="confirmPassword">确认密码：</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="确认密码" required />
        </div>

        <div class="form-group">
            <button type="submit" class="register-btn">注册</button>
        </div>

        <div class="form-group">
            <p>已经有账号？<a href="login.jsp">立即登录</a></p>
        </div>

    </form>

    <!-- 显示注册结果消息 -->
    <div class="message">
        <c:choose>
            <c:when test="${not empty successMessage}">
                <p class="success">${successMessage}</p>
                <a href="login.jsp">返回登录</a>
            </c:when>
            <c:otherwise>
                <p class="error">${errorMessage}</p>
            </c:otherwise>
        </c:choose>
    </div>

</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>

<script src="js/register.js"></script>
</body>
</html>

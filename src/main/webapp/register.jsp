<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>用户注册</title>
    <link rel="stylesheet" href="css/register.css">
    <script>
        // 表单验证函数
        function validateForm() {
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;

            if (username === "" || password === "" || confirmPassword === "") {
                alert("所有字段均为必填项！");
                return false;
            }

            if (password !== confirmPassword) {
                alert("两次输入的密码不一致！");
                return false;
            }

            return true;
        }
    </script>
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

        <%-- 显示错误信息 --%>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <%-- 显示注册成功信息 --%>
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                <p>${successMessage}</p>
                <a href="login.jsp">点击登录</a>
            </div>
        </c:if>

    </form>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>

</body>
</html>

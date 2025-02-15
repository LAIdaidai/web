<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>个人主页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/index.jpg" type="image/jpg">
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>
<!-- 头部导航栏 -->
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />
        <span>白嫖动漫我最爽</span>
    </div>
    <nav>
        <ul>
            <li><a href="TopRatedVideosServlet">首页</a></li>
            <li><a href="movieList">电影</a></li>
            <li><a href="FilteredAnimeServlet">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
</header>

<!-- 个人主页内容 -->
<main>
    <section class="profile-header">
        <h1>个人主页</h1>
        <p>
            <%
                String username = (String) session.getAttribute("username");
                if (username != null) {
            %>
            欢迎回来，亲爱的<%= username %>
            <%
            } else {
            %>
            请登录 <a href="login.jsp">登录</a>
            <%
                }
            %>
            ！
        </p>

        <%-- 如果已经登录，显示退出登录按钮 --%>
        <%
            if (username != null) {
        %>
        <a href="logout.jsp" class="logout-btn">退出登录</a>
        <%
            }
        %>
    </section>

    <section class="profile-info">
        <div class="avatar-container">
            <img src="images/index.jpg" alt="用户头像" class="avatar">
        </div>
        <div class="profile-details">
            <h2>个人信息</h2>
            <p><strong>用户名：</strong>
                <%= session.getAttribute("username") != null ? session.getAttribute("username") : "未登录" %>
            </p>
            <p><strong>观看历史：</strong>
                <%
                    if (session.getAttribute("username") != null) {
                %>
                <a href="viewHistory">查看观看历史</a>
                <%
                } else {
                %>
                请登录后查看观看历史
                <%
                    }
                %>
            </p>
        </div>
    </section>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>动漫</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/anime.css">
    <script>
        function goToVideo(videoId) {
            window.location.href = "video.jsp?videoId=" + videoId;
        }
    </script>
</head>
<body>
<!-- 头部导航栏 -->
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />白嫖动漫我最爽
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="movies.jsp">电影</a></li>
            <li><a href="anime.jsp">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
    <div class="user-info">
        <%
            String username = (String) session.getAttribute("username");
            if (username != null && !username.isEmpty()) {
        %>
        <span>欢迎，<%= username %>！</span>
        <%
        } else {
        %>
        <a href="login.jsp">登录</a>
        <%
            }
        %>
    </div>
</header>

<!-- 动漫内容区域 -->
<main>
    <h1>热门动漫</h1>

    <!-- 动漫展示区域 -->
    <section class="anime-grid" >
        <div class="anime-item" onclick="goToVideo(1)">
            <img src="${pageContext.request.contextPath}/images/仙逆.jpg" alt="鬼灭之刃">
            <div class="anime-info">
                <h2>仙逆</h2>
                <p>导演：李富源</p>
                <p>评分：8.8</p>
            </div>
        </div>

        <div class="anime-item" onclick="goToVideo(9)">
            <img src="${pageContext.request.contextPath}/images/完美世界.png" alt="完美世界">
            <div class="anime-info">
                <h2>完美世界</h2>
                <p>导演：周鹏</p>
                <p>评分：8.5</p>
            </div>
        </div>

        <div class="anime-item" onclick="goToVideo(10)">
            <img src="${pageContext.request.contextPath}/images/诛仙.png" alt="诛仙">
            <div class="anime-info">
                <h2>诛仙</h2>
                <p>导演：林楠</p>
                <p>评分：8.7</p>
            </div>
        </div>

        <div class="anime-item" onclick="goToVideo(4)">
            <img src="${pageContext.request.contextPath}/images/吞噬星空剧场版%20血洛大陆.jpg" alt="吞噬星空剧场版 血洛大陆">
            <div class="anime-info">
                <h2>吞噬星空：血洛大陆</h2>
                <p>导演：沈浩</p>
                <p>评分：8.4</p>
            </div>
        </div>

        <div class="anime-item" onclick="goToVideo(3)">
            <img src="${pageContext.request.contextPath}/images/斗破苍穹.png" alt="斗破苍穹">
            <div class="anime-info">
                <h2>斗破苍穹</h2>
                <p>导演：钟琰</p>
                <p>评分：8.6</p>
            </div>
        </div>

    </section>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 腾讯视频。版权所有。</p>
</footer>
<script src="js/anime.js"></script>
</body>
</html>

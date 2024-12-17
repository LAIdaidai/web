<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>白嫖动漫我最爽-首页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/index.jpg" type="image/jpg">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/movies.css">
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
    <div class="search-box">
        <form action="SearchServlet" method="POST">
            <input type="text" name="searchQuery" placeholder="搜索动漫、电影..." />
            <button type="submit">搜索</button>
        </form>
    </div>
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

<!-- 电影内容区域 -->
<main>
    <h1>热门电影</h1>

    <!-- 电影展示区域 -->
    <section class="movie-grid">
        <div class="movie-item" onclick="goToVideo(5)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：风起云涌的丛林冒险.png" alt="电影1">
            <h2>蜡笔小新：风起云涌的丛林冒险</h2>
            <p>主演：徐一铚</p>
        </div>
        <div class="movie-item" onclick="goToVideo(6)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.png" alt="电影2">
            <h2>蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～</h2>
            <p>主演：杨冉</p>
        </div>
        <div class="movie-item" onclick="goToVideo(7)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：幽灵忍者珍风传.png" alt="电影3">
            <h2>蜡笔小新：幽灵忍者珍风传</h2>
            <p>主演：樊怡成</p>
        </div>
        <div class="movie-item" onclick="goToVideo(8)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：我的超时空新娘.png" alt="电影4">
            <h2>蜡笔小新：我的超时空新娘</h2>
            <p>主演：赖俞慈</p>
        </div>
        <!-- 更多电影项 -->
    </section>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

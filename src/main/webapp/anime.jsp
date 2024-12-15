<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>动漫</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/anime.css">

    <script src="js/swiper-bundle.min.js"></script>
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

<!-- 动漫首页大图轮播 -->
<section class="anime-carousel">
    <div class="carousel-container">
        <div class="carousel-slide">
            <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="动漫1">
            <img src="${pageContext.request.contextPath}/images/movie2.jpg" alt="动漫2">
            <img src="${pageContext.request.contextPath}/images/movie3.jpg" alt="动漫3">
            <img src="${pageContext.request.contextPath}/images/movie4.jpg" alt="动漫4">
        </div>
    </div>
    <button class="carousel-prev">&#10094;</button>
    <button class="carousel-next">&#10095;</button>
</section>


<!-- 动漫内容区域 -->
<main>
    <h1>热门动漫</h1>

    <!-- 动漫展示区域 -->
    <section class="anime-grid">
        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="鬼灭之刃">
            <div class="anime-info">
                <h2>鬼灭之刃</h2>
                <p>导演：外崎春雄</p>
                <p>评分：9.5</p>
                <a href="anime-detail.jsp?id=1">查看详情</a>
            </div>
        </div>

        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie2.jpg" alt="进击的巨人">
            <div class="anime-info">
                <h2>进击的巨人</h2>
                <p>导演：荒木哲郎</p>
                <p>评分：9.0</p>
                <a href="anime-detail.jsp?id=2">查看详情</a>
            </div>
        </div>

        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie3.jpg" alt="我的英雄学院">
            <div class="anime-info">
                <h2>我的英雄学院</h2>
                <p>导演：长崎健司</p>
                <p>评分：8.8</p>
                <a href="anime-detail.jsp?id=3">查看详情</a>
            </div>
        </div>

        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie4.jpg" alt="名侦探柯南">
            <div class="anime-info">
                <h2>名侦探柯南</h2>
                <p>导演：山本泰一郎</p>
                <p>评分：8.4</p>
                <a href="anime-detail.jsp?id=4">查看详情</a>
            </div>
        </div>

        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="火影忍者">
            <div class="anime-info">
                <h2>火影忍者</h2>
                <p>导演：岸本齐史</p>
                <p>评分：9.3</p>
                <a href="anime-detail.jsp?id=5">查看详情</a>
            </div>
        </div>

        <div class="anime-item">
            <img src="${pageContext.request.contextPath}/images/movie2.jpg" alt="海贼王">
            <div class="anime-info">
                <h2>海贼王</h2>
                <p>导演：尾田荣一郎</p>
                <p>评分：8.7</p>
                <a href="anime-detail.jsp?id=6">查看详情</a>
            </div>
        </div>

        <!-- 更多动漫项... -->
    </section>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 腾讯视频。版权所有。</p>
</footer>

<script src="js/swiper-bundle.min.js"></script>
<script src="js/anime.js"></script>
</body>
</html>

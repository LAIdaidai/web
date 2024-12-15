<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>白嫖动漫我最爽-首页</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/movies.css">
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
</header>

<!-- 电影内容区域 -->
<main>
    <h1>热门电影</h1>

    <!-- 电影筛选功能（可选）-->
    <section class="filters">
        <form action="movies.jsp" method="get">
            <label for="genre">选择电影类型：</label>
            <select id="genre" name="genre">
                <option value="all">全部</option>
                <option value="action">动作</option>
                <option value="comedy">喜剧</option>
                <option value="drama">剧情</option>
                <option value="horror">恐怖</option>
            </select>

            <label for="sort">排序：</label>
            <select id="sort" name="sort">
                <option value="newest">最新上映</option>
                <option value="rating">评分高低</option>
                <option value="popularity">人气</option>
            </select>

            <button type="submit">筛选</button>
        </form>
    </section>

    <!-- 电影展示区域 -->
    <section class="movie-grid">
        <div class="movie-item">
            <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="电影1">
            <h2>仙逆</h2>
            <p>主演：某演员</p>
            <p>评分：8.5</p>
            <a href="movie-detail.jsp?id=1">查看详情</a>
        </div>
        <div class="movie-item">
            <img src="${pageContext.request.contextPath}/images/movie2.jpg" alt="电影2">
            <h2>剑来</h2>
            <p>主演：某演员</p>
            <p>评分：9.0</p>
            <a href="movie-detail.jsp?id=2">查看详情</a>
        </div>
        <div class="movie-item">
            <img src="${pageContext.request.contextPath}/images/movie3.jpg" alt="电影3">
            <h2>吞噬星空</h2>
            <p>主演：某演员</p>
            <p>评分：7.8</p>
            <a href="movie-detail.jsp?id=3">查看详情</a>
        </div>
        <div class="movie-item">
            <img src="${pageContext.request.contextPath}/images/movie4.jpg" alt="电影4">
            <h2>斗破苍穹</h2>
            <p>主演：某演员</p>
            <p>评分：8.2</p>
            <a href="movie-detail.jsp?id=4">查看详情</a>
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

<%@ page import="com.example.movieplaystation.Video" %>
<%@ page import="java.util.List" %>
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
            <li><a href="movieList">电影</a></li>
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
    <div class="video-grid">
        <%
            // 获取 Servlet 中传递的 videoList
            List<Video> videoList = (List<Video>) request.getAttribute("videoList");

            // 判断 videoList 是否为空
            if (videoList != null && !videoList.isEmpty()) {
                // 遍历 videoList 显示每一部视频
                for (Video video : videoList) {
        %>
        <div class="video-item" onclick="window.location.href='video.jsp?videoId=<%= video.getId() %>'">
            <!-- 显示视频封面 -->
            <img src="<%= video.getVideoPath() %>" alt="<%= video.getTitle() %>">
            <!-- 显示视频标题 -->
            <p><%= video.getTitle() %></p>
        </div>
        <%
            }
        } else {
        %>
        <!-- 如果没有找到相关视频 -->
        <p>未找到相关视频。</p>
        <%
            }
        %>
    </div>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

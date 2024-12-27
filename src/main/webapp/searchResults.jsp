<%@ page import="com.example.movieplaystation.Video" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索结果</title>
    <link rel="stylesheet" href="css/history.css">
    <link rel="">
</head>
<body>
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />白嫖动漫我最爽
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="movieList">电影</a></li>
            <li><a href="FilteredAnimeServlet">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
    <div class="search-box">
        <form action="SearchServlet" method="POST">
            <input type="text" name="searchQuery" placeholder="搜索动漫、电影..." />
            <button type="submit">搜索</button>
        </form>
    </div>
</header>

<main>
    <h1>搜索结果</h1>
    <div class="video-grid">
        <%
            List<Video> videoList = (List<Video>) request.getAttribute("videoList");
            if (videoList != null && !videoList.isEmpty()) {
                for (Video video : videoList) {
        %>
        <div class="video-item" onclick="window.location.href='video.jsp?videoId=<%= video.getId() %>'">
            <img src="<%= video.getVideoPath() %>" alt="<%= video.getTitle() %>">
            <p><%= video.getTitle() %></p>
        </div>
        <%
            }
        } else {
        %>
        <p>未找到相关视频。</p>
        <%
            }
        %>
    </div>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

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
            <div id="searchFields">
                <!-- 保持搜索查询和搜索方式 -->
                <input type="text" id="searchQuery" name="searchQuery" value="<%= request.getAttribute("searchQuery") != null ? request.getAttribute("searchQuery") : "" %>" placeholder="请输入搜索内容..." />
            </div>
            <button type="submit">搜索</button>
            <select id="searchBy" name="searchBy" onchange="toggleSearchFields()">
                <option value="title" <%= "title".equals(request.getAttribute("searchBy")) ? "selected" : "" %>>按名称搜索</option>
                <option value="category" <%= "category".equals(request.getAttribute("searchBy")) ? "selected" : "" %>>按类别搜索</option>
                <option value="region" <%= "region".equals(request.getAttribute("searchBy")) ? "selected" : "" %>>按地区搜索</option>
            </select>
        </form>
    </div>
</header>

<main>
    <h1>搜索结果</h1>

    <!-- 成功或错误消息显示 -->
    <% if (request.getAttribute("message") != null) { %>
    <script>
        alert("<%= request.getAttribute("message") %>");
    </script>
    <% } %>

    <% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert("<%= request.getAttribute("errorMessage") %>");
    </script>
    <% } %>

    <div class="video-grid">
        <%
            List<Video> videoList = (List<Video>) request.getAttribute("videoList");
            if (videoList != null && !videoList.isEmpty()) {
                for (Video video : videoList) {
        %>
        <div class="video-item" onclick="window.location.href='video.jsp?videoId=<%= video.getId() %>'">
            <img src="<%= video.getVideoPath() %>" alt="<%= video.getTitle() %>">
            <p><%= video.getTitle() %></p>

            <!-- 判断当前用户是否为管理员 -->
            <%
                String username = (String) session.getAttribute("username");  // 获取当前登录的用户名
                if ("admin".equals(username)) {  // 如果当前用户名是admin
            %>
            <!-- 添加删除按钮 -->
            <form action="DeleteVideoServlet" method="POST" onsubmit="return confirm('确定要删除这个视频吗？');">
                <input type="hidden" name="videoId" value="<%= video.getId() %>" />
                <!-- 传递搜索查询和搜索方式 -->
                <input type="hidden" name="searchQuery" value="<%= request.getAttribute("searchQuery") %>" />
                <input type="hidden" name="searchBy" value="<%= request.getAttribute("searchBy") %>" />
                <button type="submit" class="delete-button">删除视频</button>
            </form>
            <% } %>  <!-- 结束管理员判断 -->
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
<script src="js/search.js"></script>
</body>
</html>

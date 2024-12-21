<%@ page import="com.example.movieplaystation.Anime" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>动漫</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/anime.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />白嫖动漫我最爽
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="moviesList">电影</a></li>
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

<main>
    <h1>筛选动漫</h1>
    <!-- 筛选表单 -->
    <form method="get" action="FilteredAnimeServlet">
        <label for="region">地区:</label>
        <select name="region" id="region">
            <option value="all" <%= "all".equals(request.getAttribute("region")) ? "selected" : "" %>>所有地区</option>
            <option value="中国" <%= "中国".equals(request.getAttribute("region")) ? "selected" : "" %>>中国</option>
            <option value="日本" <%= "日本".equals(request.getAttribute("region")) ? "selected" : "" %>>日本</option>
            <option value="欧美" <%= "欧美".equals(request.getAttribute("region")) ? "selected" : "" %>>欧美</option>
            <option value="未知" <%= "未知".equals(request.getAttribute("region")) ? "selected" : "" %>>未知</option>
        </select>
        <label for="sort">排序:</label>
        <select name="sort" id="sort">
            <option value="rating" <%= "rating".equals(request.getAttribute("sort")) ? "selected" : "" %>>评分</option>
            <option value="newest" <%= "newest".equals(request.getAttribute("sort")) ? "selected" : "" %>>最新</option>
        </select>
        <button type="submit">筛选</button>
    </form>



    <!-- 动漫展示区域 -->
    <div class="anime-grid">
        <% List<Anime> animeList = (List<Anime>) request.getAttribute("animeList"); %>
        <c:choose>
            <c:when test="${not empty animeList}">
                <c:forEach var="anime" items="${animeList}">
                    <div class="anime-item">
                        <img src="${anime.coverImagePath}" alt="${anime.title}">
                        <p>${anime.title}</p>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>未找到符合条件的动漫。</p>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

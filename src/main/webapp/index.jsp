<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.movieplaystation.Video" %>

<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <title>白嫖动漫我最爽-首页</title>
  <link rel="stylesheet" href="css/index.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/index.jpg" type="image/jpg">
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
      <li><a href="TopRatedVideosServlet">首页</a></li>
      <li><a href="movieList">电影</a></li>
      <li><a href="FilteredAnimeServlet">动漫</a></li>
      <li><a href="profile.jsp">个人主页</a></li>
    </ul>
  </nav>
  <div class="search-box">
    <form action="SearchServlet" method="POST">
      <!-- 输入框 -->
      <div id="searchFields">
        <input type="text" id="searchQuery" name="searchQuery" placeholder="请输入搜索内容..." />
      </div>
      <button type="submit">搜索</button>
      <!-- 搜索方式选择 -->
      <select id="searchBy" name="searchBy" onchange="toggleSearchFields()">
        <option value="title">按名称搜索</option>
        <option value="category">按类别搜索</option>
        <option value="region">按地区搜索</option>
      </select>
    </form>
  </div>
  <div class="user-info">
    <%
      String username = (String) session.getAttribute("username");
      String role = (String) session.getAttribute("role"); // 假设 session 中存储了用户角色
      if (username != null && !username.isEmpty()) {
    %>
    <span>欢迎，<%= username %>！</span>
    <%
      if ("admin".equals(username)) { // 如果用户是管理员
    %>
    <button class="upload-button" onclick="location.href='upload.jsp'">上传视频</button>
    <%
      }
    } else {
    %>
    <a href="login.jsp">登录</a>
    <%
      }
    %>
  </div>

</header>

<!-- 主页内容 -->
<main>
  <h1>欢迎来到白嫖动漫我最爽首页</h1>
  <p>这里是电影、电视剧、动漫的播放平台。请选择你感兴趣的内容。</p>

  <h2>推荐观看</h2>
  <div class="video-grid">
    <%
      List<Video> topRatedVideos = (List<Video>) request.getAttribute("topRatedVideos");
      if (topRatedVideos != null && !topRatedVideos.isEmpty()) {
        for (Video video : topRatedVideos) {
    %>
    <div class="video-item" onclick="goToVideo(<%= video.getId() %>)">
      <img src="<%= video.getCoverImagePath() %>" alt="<%= video.getTitle() %>">
      <p><%= video.getTitle() %></p>
      <p>评分: <%= video.getAverageRating() %></p>
    </div>
    <%
      }
    } else {
    %>
    <p>暂时没有评分最高的视频。</p>
    <% } %>
  </div>
</main>

<!-- 底部信息 -->
<footer>
  <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
<!-- 引用外部 JavaScript 文件 -->
<script src="js/search.js"></script>
</body>
</html>

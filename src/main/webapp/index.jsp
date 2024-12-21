<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
  <div class="video-grid">
    <div class="video-item" onclick="goToVideo(1)">
      <img src="${pageContext.request.contextPath}/images/仙逆.jpg" alt="电影1">
      <p>仙逆</p>
    </div>
    <div class="video-item" onclick="goToVideo(2)">
      <img src="${pageContext.request.contextPath}/images/剑来.jpg" alt="电影2">
      <p>剑来</p>
    </div>
    <div class="video-item" onclick="goToVideo(3)">
      <img src="${pageContext.request.contextPath}/images/斗破苍穹.png" alt="电影4">
      <p>斗破苍穹</p>
    </div>
    <div class="video-item" onclick="goToVideo(4)">
      <img src="${pageContext.request.contextPath}/images/吞噬星空剧场版%20血洛大陆.jpg" alt="电影3">
      <p>吞噬星空剧场版 血洛大陆</p>
    </div>
  </div>
</main>

<!-- 底部信息 -->
<footer>
  <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

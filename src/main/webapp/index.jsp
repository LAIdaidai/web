<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>白嫖动漫我最爽-首页</title>
  <link rel="stylesheet" href="css/index.css">
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

<!-- 主页内容 -->
<main>
  <h1>欢迎来到白嫖动漫我最爽首页</h1>
  <p>这里是电影、电视剧、动漫的播放平台。请选择你感兴趣的内容。</p>
  <div class="video-grid">
    <div class="video-item">
      <img src="${pageContext.request.contextPath}/images/movie1.jpg" alt="电影1">
      <a href="video.jsp?video=仙逆">仙逆</a>
    </div>
    <div class="video-item">
      <img src="${pageContext.request.contextPath}/images/movie2.jpg" alt="电影2">
      <a href="video.jsp?video=剑来">剑来</a>
    </div>
    <div class="video-item">
      <img src="${pageContext.request.contextPath}/images/movie3.jpg" alt="电影3">
      <a href="video.jsp?video=吞噬星空剧场版 血洛大陆">吞噬星空剧场版 血洛大陆</a>
    </div>
    <div class="video-item">
      <img src="${pageContext.request.contextPath}/images/movie4.jpg" alt="电影4">
      <a href="video.jsp?video=斗破苍穹">斗破苍穹</a>
    </div>
  </div>
</main>
<!-- 底部信息 -->
<footer>
  <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

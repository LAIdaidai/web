<%@ page import="java.util.*, com.example.movieplaystation.History.History" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.movieplaystation.History.History" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>观看历史</title>
    <link rel="stylesheet" href="css/history.css">
</head>
<body>
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />
        <span>白嫖动漫我最爽</span>
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="movieList">电影</a></li>
            <li><a href="FilteredAnimeServlet">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
</header>

<main>
    <h1>观看历史</h1>
    <%
        // 获取历史记录按日期分组
        Map<String, List<History>> groupedHistory = (Map<String, List<History>>) request.getAttribute("groupedHistory");

        if (groupedHistory == null || groupedHistory.isEmpty()) {
    %>
    <p>您没有观看任何历史记录。</p>
    <%
    } else {
        // 按日期降序排序
        List<Map.Entry<String, List<History>>> sortedEntries = new ArrayList<>(groupedHistory.entrySet());
        sortedEntries.sort((e1, e2) -> e2.getKey().compareTo(e1.getKey())); // 按日期降序排列

        // 遍历每个日期分组
        for (Map.Entry<String, List<History>> entry : sortedEntries) {
            String date = entry.getKey();
            List<History> historyList = entry.getValue();
    %>
    <div class="date-group">
        <h2><%= date %></h2>
        <div class="video-grid">
            <%
                // 按播放时间排序
                historyList.sort((h1, h2) -> h2.getPlayTime().compareTo(h1.getPlayTime())); // 按播放时间降序排列

                // 遍历该日期下的视频历史记录
                for (History history : historyList) {
                    int videoId = history.getVideoId();
                    String coverImagePath = history.getCoverImagePath();
                    String title = history.getTitle();
                    String playtime = history.getFormattedPlayTime();
            %>
            <div class="video-item" onclick="window.location.href='video.jsp?videoId=<%= videoId %>'">
                <img src="<%= coverImagePath %>" alt="视频封面">
                <p><%= title %></p>
                <p>上次观看时间：<%= playtime %></p>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <%
            }
        }
    %>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

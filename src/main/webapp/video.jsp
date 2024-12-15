<%@ page import="java.util.List" %>
<%@ page import="com.example.movieplaystation.Comment" %>
<%@ page import="com.example.movieplaystation.CommentServlet" %>
<%@ page import="com.example.movieplaystation.AverageRatingServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>视频播放 - 白嫖动漫我最爽</title>
    <link rel="stylesheet" href="css/video.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<!-- 视频播放区 -->
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />白嫖动漫我最爽
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
    <nav>
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="movies.jsp">电影</a></li>
            <li><a href="anime.jsp">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
</header>

<main>
    <h1 id="videoTitle">视频</h1>
    <%
        String videoId = request.getParameter("videoId");
        double averageRating = 0;
        if (videoId != null) {
            // 调用 AverageRatingServlet 获取平均评分
            averageRating = AverageRatingServlet.getAverageRatingByVideoId(Integer.parseInt(videoId));
        }
    %>
    <!-- 显示平均评分 -->
    <div id="averageRating">
        平均评分: <%= averageRating %>
    </div>
    <video id="videoPlayer" controls>
        <source id="videoSource" src="" type="video/mp4">
        你的浏览器不支持播放此视频。
    </video>

    <script>
        // 获取 URL 中的 videoId 参数
        const urlParams = new URLSearchParams(window.location.search);
        const videoId = urlParams.get('videoId');

        // 获取页面元素
        const videoTitle = document.getElementById('videoTitle');
        const videoSource = document.getElementById('videoSource');
        const averageRatingElement = document.getElementById('averageRating'); // 用于显示评分的元素

        // 定义视频数据
        const videoData = {
            '1': { title: '仙逆', src: '/videos/仙逆.mp4' },
            '2': { title: '剑来', src: '/videos/剑来.mp4' },
            '3': { title: '斗破苍穹', src: '/videos/斗破苍穹.mp4' },
            '4': { title: '吞噬星空剧场版 血洛大陆', src: '/videos/吞噬星空剧场版 血洛大陆.mp4' },
            '5': { title: '逆转人生', src: '/videos/仙逆.mp4' },
            '6': { title: '云边有个小卖部', src: '/videos/剑来.mp4' },
            '7': { title: '孤注一掷', src: '/videos/仙逆.mp4' },
            '8': { title: '流浪地球2', src: '/videos/剑来.mp4' }
        };

        // 根据 videoId 设置视频标题和视频源
        if (videoData[videoId]) {
            videoTitle.textContent = videoData[videoId].title;
            videoSource.src = videoData[videoId].src;
        } else {
            videoTitle.textContent = '视频';
            videoSource.src = '/videos/default.mp4';  // 默认视频
        }

        // 刷新视频源
        document.getElementById('videoPlayer').load();
    </script>


    <!-- 评分区 -->
    <div class="rating">
        <h3>给这个视频评分</h3>
        <div class="stars">
            <span class="star" onclick="setRating(1)">&#9733;</span>
            <span class="star" onclick="setRating(2)">&#9733;</span>
            <span class="star" onclick="setRating(3)">&#9733;</span>
            <span class="star" onclick="setRating(4)">&#9733;</span>
            <span class="star" onclick="setRating(5)">&#9733;</span>
        </div>
        <p id="ratingMessage"></p>
    </div>

        <!-- 评论区 -->
        <div class="comments">
            <h3>评论区</h3>
            <form action="${pageContext.request.contextPath}/CommentServlet" method="POST" onsubmit="return validateComment()">
                <textarea id="commentText" name="commentText" placeholder="发表评论..."></textarea>
                <input type="hidden" name="videoId" value="<%= request.getParameter("videoId") %>">
                <input type="hidden" name="username" value="<%= session.getAttribute("username") != null ? session.getAttribute("username") : "匿名" %>">
                <button type="submit">提交评论</button>
            </form>

            <div id="commentList">
                <!-- 评论列表 -->
                <%
                    if (videoId != null) {
                        List<Comment> comments = CommentServlet.getCommentsByVideoId(Integer.parseInt(videoId));
                        for (Comment comment : comments) {
                %>
                <div class="comment-item">
                    <p><strong><%= comment.getUsername() %>：</strong><%= comment.getCommentText() %></p>
                    <p><small><%= comment.getFormattedTime() %></small></p>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>

<script>
    // 设置评分
    function setRating(star) {
        let ratingMessage = '';
        let ratingValue = 2 * star; // 每颗星2分
        switch (star) {
            case 1:
                ratingMessage = '非常差';
                break;
            case 2:
                ratingMessage = '差';
                break;
            case 3:
                ratingMessage = '一般';
                break;
            case 4:
                ratingMessage = '好';
                break;
            case 5:
                ratingMessage = '非常好';
                break;
        }
        document.getElementById("ratingMessage").innerText = '你给此视频打了 ' + ratingMessage + ' 的评分！';

        // 获取所有星星元素
        const stars = document.querySelectorAll(".star");

        // 清除之前的选择
        stars.forEach(starElement => starElement.classList.remove("selected"));

        // 亮起相应数量的星星
        for (let i = 0; i < star; i++) {
            stars[i].classList.add("selected");
        }

        // 获取视频ID
        const urlParams = new URLSearchParams(window.location.search);
        const videoId = urlParams.get('videoId');

        // 获取当前用户
        const username = "<%= session.getAttribute("username") != null ? session.getAttribute("username") : "匿名" %>";

        // 调用Ajax提交评分
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "RateServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // 成功后进行相应处理
                alert("评分成功！");
            }
        };
        xhr.send("videoId=" + videoId + "&username=" + username + "&rating=" + ratingValue);
    }

    // 鼠标悬停效果
    document.querySelectorAll(".star").forEach((starElement, index) => {
        starElement.addEventListener("mouseenter", function() {
            const stars = document.querySelectorAll(".star");
            stars.forEach((star, i) => {
                if (i <= index) {
                    star.classList.add("selected");
                } else {
                    star.classList.remove("selected");
                }
            });
        });

        starElement.addEventListener("mouseleave", function() {
            const stars = document.querySelectorAll(".star");
            stars.forEach(star => {
                star.classList.remove("selected");
            });
        });
    });
        // 验证评论是否为空
        function validateComment() {
        const commentText = document.getElementById("commentText").value.trim();

        if (commentText === "") {
        alert("评论内容不能为空喵~");  // 提示用户评论不能为空
        return false;  // 阻止表单提交
    }

        return true;  // 允许表单提交
    }

</script>

</body>
</html>

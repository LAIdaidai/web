<%@ page import="java.util.List" %>
<%@ page import="com.example.movieplaystation.Comments.Comment" %>
<%@ page import="com.example.movieplaystation.Comments.ShowCommentServlet" %>
<%@ page import="com.example.movieplaystation.Rate.AverageRatingServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.movieplaystation.VideoService" %>
<%@ page import="com.example.movieplaystation.Video" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>视频播放 - 白嫖动漫我最爽</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/index.jpg" type="image/jpg">
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
            <li><a href="movieList">电影</a></li>
            <li><a href="FilteredAnimeServlet">动漫</a></li>
            <li><a href="profile.jsp">个人主页</a></li>
        </ul>
    </nav>
</header>

<main>
    <h1 id="videoTitle">视频</h1>
    <%
        String videoIdParam = request.getParameter("videoId");
        int videoId = -1; // 默认值为 -1，表示无效 ID
        double averageRating = 0;

        if (videoIdParam != null && !videoIdParam.isEmpty()) {
            try {
                videoId = Integer.parseInt(videoIdParam);
                // 调用 AverageRatingServlet 获取平均评分
                averageRating = AverageRatingServlet.getAverageRatingByVideoId(videoId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
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
        const videoData = {};
        <%
            List<Video> videoList = VideoService.getAllVideos();
            for (Video video : videoList) {
        %>
        videoData['<%= video.getId() %>'] = {
            title: '<%= video.getTitle() %>',
            src: '<%= video.getVideoPath() %>'
        };
        <%
            }
        %>


        // 获取页面元素
        const urlParams = new URLSearchParams(window.location.search);
        const videoId = urlParams.get('videoId');

        // 获取页面元素
        const videoTitle = document.getElementById('videoTitle');
        const videoSource = document.getElementById('videoSource');
        const videoPlayer = document.getElementById('videoPlayer');

        // 定义备用视频路径
        const fallbackVideo = '/videos/fail.flv';

        // 检查视频文件是否存在的函数
        async function checkVideoExists(videoPath) {
            try {
                const response = await fetch(videoPath, { method: 'HEAD' });
                return response.ok; // 如果响应状态是 200，则文件存在
            } catch (error) {
                console.error('检查视频文件出错:', error);
                return false; // 如果请求失败，则认为文件不存在
            }
        }

        // 设置视频标题和路径
        if (videoData[videoId]) {
            videoTitle.textContent = videoData[videoId].title;

            // 检查视频文件是否存在
            checkVideoExists(videoData[videoId].src).then(exists => {
                if (exists) {
                    // 如果视频存在，设置路径
                    videoSource.src = videoData[videoId].src;
                } else {
                    // 如果视频不存在，设置备用视频路径
                    console.warn('视频文件不存在，切换到备用视频');
                    videoSource.src = fallbackVideo;
                }

                // 加载视频
                videoPlayer.load();
                // 在视频加载时发送播放历史记录到后端
                window.onload = function() {
                    const videoId = urlParams.get('videoId');
                    const username = "<%= session.getAttribute("username") != null ? session.getAttribute("username") : "匿名" %>";

                    if (videoId && username) {
                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "UpdatePlayHistoryServlet", true);  // 发送请求到后端 Servlet
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function() {
                            if (xhr.readyState == 4 && xhr.status == 200) {
                                console.log("播放历史记录更新成功！");
                            }
                        };
                        xhr.send("videoId=" + videoId + "&username=" + username);
                    }
                };
            });
        } else {
            // 如果 videoId 不存在，设置默认视频
            videoTitle.textContent = '视频';
            videoSource.src = fallbackVideo; // 使用备用视频作为默认视频
            videoPlayer.load();
        }


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
        <form name="submit-comment" action="${pageContext.request.contextPath}/CommentServlet" method="POST" onsubmit="return validateComment()">
            <textarea id="commentText" name="commentText" placeholder="发表评论..."></textarea>
            <input type="hidden" name="videoId" value="<%= request.getParameter("videoId") %>">
            <input type="hidden" name="username" value="<%= session.getAttribute("username") != null ? session.getAttribute("username") : "匿名" %>">
            <button type="submit" class="submit">提交评论</button>
        </form>

        <div id="commentList">
            <!-- 评论列表 -->
            <%
                if (videoId != -1) {
                    List<Comment> comments = ShowCommentServlet.getCommentsByVideoId(videoId);
                    if (comments != null && !comments.isEmpty()) {
                        for (Comment comment : comments) {
            %>
            <div class="comment-item">
                <!-- 左侧评论内容 -->
                <div class="comment-text">
                    <p><strong><%= comment.getUsername() %>：</strong><%= comment.getCommentText() %></p>
                    <p><small><%= comment.getFormattedTime() %></small></p>
                </div>
                <!-- 右侧删除按钮（仅管理员可见） -->
                <%
                    String userRole = (String) session.getAttribute("role");
                    if ("admin".equals(username)) {
                %>
                <form action="DeleteCommentServlet" method="POST" class="delform">
                    <input type="hidden" name="commentId" value="<%= comment.getId() %>">
                    <input type="hidden" name="videoId" value="<%= videoId %>">
                    <button type="submit" class="delete-button">删除</button>
                </form>
                <%
                    }
                %>
            </div>
            <%
                }
            } else {
            %>
            <p>暂无评论。</p>
            <%
                }
            } else {
            %>
            <p>未找到视频或无效的视频ID。</p>
            <%
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

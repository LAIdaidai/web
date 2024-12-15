<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>视频播放 - 白嫖动漫我最爽</title>
    <link rel="stylesheet" href="css/video.css">
</head>
<body>
<!-- 视频播放区 -->
<header>
    <div class="logo">
        <img src="images/index.jpg" alt="腾讯视频" />白嫖动漫我最爽
    </div>
</header>

<main>
    <div class="video-container">
        <h1 id="videoTitle">仙逆</h1> <!-- 视频标题 -->
        <video id="videoPlayer" controls>
            <source src="${pageContext.request.contextPath}/videos/仙逆.mp4" type="video/mp4">
            你的浏览器不支持播放此视频。
        </video>

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
            <div class="comment-form">
                <textarea id="commentText" placeholder="发表评论..."></textarea>
                <button onclick="submitComment()">提交评论</button>
            </div>

            <div id="commentList">
                <!-- 评论列表 -->
            </div>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>

<script>
    // 设置视频评分
    function setRating(star) {
        let ratingMessage = '';
        switch (star) {
            case 1: ratingMessage = '非常差'; break;
            case 2: ratingMessage = '差'; break;
            case 3: ratingMessage = '一般'; break;
            case 4: ratingMessage = '好'; break;
            case 5: ratingMessage = '非常好'; break;
        }
        document.getElementById("ratingMessage").innerText = '你给此视频打了 ' + ratingMessage + ' 的评分！';
    }

    // 提交评论
    function submitComment() {
        const commentText = document.getElementById("commentText").value;
        if (commentText.trim() === "") {
            alert("评论内容不能为空！");
            return;
        }

        const commentList = document.getElementById("commentList");
        const newComment = document.createElement("div");
        newComment.classList.add("comment-item");
        newComment.innerHTML = "<p><strong>匿名：</strong>" + commentText + "</p>";
        commentList.appendChild(newComment);

        // 清空评论框
        document.getElementById("commentText").value = "";
    }
</script>
</body>
</html>

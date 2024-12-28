<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上传视频</title>
    <link rel="stylesheet" href="css/upload.css">
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || !"admin".equals(username)) {
%>
<script>
    alert("非法访问！请登录管理员账户。");
    window.location.href = "index.jsp";
</script>
<%
        return;}
%>

<h1>上传视频</h1>
<div class="upload-form-container">
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="title">视频名称:</label>
        <input type="text" id="title" name="title" placeholder="请输入视频名称" required>

        <label for="region">地区:</label>
        <select id="region" name="region" required>
            <option value="中国">中国</option>
            <option value="日本">日本</option>
            <option value="欧美">欧美</option>
            <option value="未知">未知</option>
        </select>

        <label for="type">影视类型:</label>
        <select id="type" name="type" required>
            <option value="动漫">动漫</option>
            <option value="电影">电影</option>
            <option value="电视剧">电视剧</option>
            <option value="综艺">综艺</option>
        </select>

        <label for="videoFile">上传视频文件:</label>
        <input type="file" id="videoFile" name="videoFile" accept="video/*" required>

        <label for="coverImage">上传封面图片:</label>
        <input type="file" id="coverImage" name="coverImage" accept="image/*" required>

        <button type="submit">提交上传</button>
    </form>
    <a href="index.jsp">
        <button type="button">返回</button>
    </a>
</div>
<footer>
    <p>&copy; 2024 白嫖动漫我最爽。版权所有。</p>
</footer>
</body>
</html>

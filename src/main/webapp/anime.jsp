<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>动漫</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/index.jpg" type="image/jpg">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/anime.css">
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
            <li><a href="movies.jsp">电影</a></li>
            <li><a href="anime.jsp">动漫</a></li>
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

<!-- 动漫内容区域 -->
<main>
    <h1>热门动漫</h1>
    <form method="get" action="filteredAnime.jsp">
        <label for="region">地区:</label>
        <select name="region" id="region">
            <option value="all">所有地区</option>
            <option value="中国">中国</option>
            <option value="日本">日本</option>
            <option value="欧美">欧美</option>
            <option value="未知">未知</option>
        </select>
        <label for="sort">排序:</label>
        <select name="sort" id="sort">
            <option value="rating">评分</option>
            <option value="newest">最新</option>
        </select>
        <button type="submit">筛选</button>
    </form>


    <!-- 动漫展示区域 -->
    <section class="anime-grid" >
        <div class="anime-item" onclick="goToVideo(1)">
            <img src="${pageContext.request.contextPath}/images/仙逆.jpg" alt="仙逆">
            <div class="anime-info">
                <h2>仙逆</h2>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(9)">
            <img src="${pageContext.request.contextPath}/images/完美世界.png" alt="完美世界">
            <div class="anime-info">
                <h2>完美世界</h2>
                <p>导演：周鹏</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(10)">
            <img src="${pageContext.request.contextPath}/images/诛仙.png" alt="诛仙">
            <div class="anime-info">
                <h2>诛仙</h2>
                <p>导演：林楠</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(4)">
            <img src="${pageContext.request.contextPath}/images/吞噬星空剧场版%20血洛大陆.jpg" alt="吞噬星空剧场版 血洛大陆">
            <div class="anime-info">
                <h2>吞噬星空：血洛大陆</h2>
                <p>导演：沈浩</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(3)">
            <img src="${pageContext.request.contextPath}/images/斗破苍穹.png" alt="斗破苍穹">
            <div class="anime-info">
                <h2>斗破苍穹</h2>
                <p>导演：钟琰</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(5)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：风起云涌的丛林冒险.png" alt="蜡笔小新：风起云涌的丛林冒险">
            <div class="anime-info">
            <h2>蜡笔小新：风起云涌的丛林冒险</h2>
            <p>主演：徐一铚</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(6)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～.png" alt="蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～">
            <div class="anime-info">
            <h2>蜡笔小新剧场版：新婚旅行风暴～夺回广志大作战～</h2>
            <p>主演：杨冉</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(7)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：幽灵忍者珍风传.png" alt="蜡笔小新：幽灵忍者珍风传">
            <div class="anime-info">
            <h2>蜡笔小新：幽灵忍者珍风传</h2>
            <p>主演：樊怡成</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(8)">
            <img src="${pageContext.request.contextPath}/images/蜡笔小新：我的超时空新娘.png" alt="蜡笔小新：我的超时空新娘">
            <div class="anime-info">
            <h2>蜡笔小新：我的超时空新娘</h2>
            <p>主演：赖俞慈</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(8)">
            <img src="${pageContext.request.contextPath}/images/百变小樱.png" alt="百变小樱">
            <div class="anime-info">
                <h2>百变小樱</h2>
                <p>主演：杨冉</p>
            </div>
        </div>

        <div class="anime-item" onclick="goToVideo(5)">
            <img src="${pageContext.request.contextPath}/images/寻梦环游记.png" alt="寻梦环游记">
            <div class="anime-info">
                <h2>寻梦环游记</h2>
                <p>主演：徐一铚</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(6)">
            <img src="${pageContext.request.contextPath}/images/海底总动员.jpg" alt="海底总动员">
            <div class="anime-info">
                <h2>海底总动员</h2>
                <p>主演：杨冉</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(7)">
            <img src="${pageContext.request.contextPath}/images/玩具总动员.png" alt="玩具总动员">
            <div class="anime-info">
                <h2>玩具总动员</h2>
                <p>主演：樊怡成</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(8)">
            <img src="${pageContext.request.contextPath}/images/疯狂元素城.png" alt="疯狂元素城">
            <div class="anime-info">
                <h2>蜡笔小新：我的超时空新娘</h2>
                <p>主演：赖俞慈</p>
            </div>
        </div>
        <div class="anime-item" onclick="goToVideo(8)">
            <img src="${pageContext.request.contextPath}/images/赛车总动员.png" alt="赛车总动员">
            <div class="anime-info">
                <h2>赛车总动员</h2>
                <p>主演：杨冉</p>
            </div>
        </div>
    </section>
</main>

<!-- 底部信息 -->
<footer>
    <p>&copy; 2024 腾讯视频。版权所有。</p>
</footer>
<script src="js/anime.js"></script>
</body>
</html>

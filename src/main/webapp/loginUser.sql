show databases ;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,  -- 自动增长的主键
                       username VARCHAR(50) NOT NULL,      -- 用户名，最大长度为 50
                       password VARCHAR(255) NOT NULL      -- 密码，最大长度为 255
);

INSERT INTO users (username, password) VALUES ('admin', '123');

select * from users;

CREATE USER 'laiyuci'@'localhost' IDENTIFIED BY '1';

GRANT ALL PRIVILEGES ON web.* TO 'laiyuci'@'localhost';

select * from users;

CREATE TABLE videos (
                        id INT AUTO_INCREMENT PRIMARY KEY,      -- 视频ID，自增
                        title VARCHAR(255) NOT NULL,             -- 视频标题
                        video_path VARCHAR(255) NOT NULL         -- 视频文件路径
);


CREATE TABLE comments (
                          id INT AUTO_INCREMENT PRIMARY KEY,      -- 评论ID，自增
                          video_id INT NOT NULL,                  -- 关联的视频ID
                          username VARCHAR(50) NOT NULL,          -- 评论人的用户名
                          comment_text TEXT NOT NULL,             -- 评论内容
                          comment_time DATETIME DEFAULT CURRENT_TIMESTAMP, -- 评论时间，默认为当前时间
                          FOREIGN KEY (video_id) REFERENCES videos(id) -- 关联视频ID
);

show tables;

INSERT INTO videos (title, video_path) VALUES
                                           ('剑来', '/videos/剑来.mp4'),
                                           ('斗破苍穹', '/videos/斗破苍穹.mp4'),
                                           ('吞噬星空剧场版 血洛大陆', '/videos/吞噬星空剧场版 血洛大陆.mp4'),
                                           ('仙逆', '/videos/仙逆.mp4');

INSERT INTO comments (video_id, username, comment_text, comment_time)
VALUES (2, 'admin', '国漫巅峰无疑！', NOW());

select * from comments;

select * from videos;

DELETE FROM comments WHERE comment_text = '张煜是啥鸟';

CREATE TABLE ratings (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         video_id INT NOT NULL,
                         username VARCHAR(255) NOT NULL,
                         rating INT NOT NULL,  -- 存储2到10之间的评分值
                         FOREIGN KEY (video_id) REFERENCES videos(id)
);

ALTER TABLE videos
    ADD COLUMN average_rating DOUBLE DEFAULT 0;

select * from videos;

select * from ratings;

























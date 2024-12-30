CREATE DATABASE web;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,         -- 自动增长的主键
                       username VARCHAR(50) NOT NULL,              -- 用户名，最大长度为 50
                       password VARCHAR(255) NOT NULL,             -- 密码，最大长度为 255
                       phonenumber VARCHAR(15) NOT NULL,          -- 电话号码，最大长度为 15
                       register_time DATETIME DEFAULT CURRENT_TIMESTAMP  -- 注册时间，默认当前时间
);
CREATE TABLE videos (
                        id INT AUTO_INCREMENT PRIMARY KEY,      -- 视频ID，自增
                        title VARCHAR(255) NOT NULL,            -- 视频标题
                        video_path VARCHAR(255) NOT NULL,       -- 视频文件路径
                        average_rating DOUBLE DEFAULT 0,        -- 平均评分
                        region VARCHAR(100) NOT NULL DEFAULT '未知', -- 地区
                        cover_image_path VARCHAR(255) NOT NULL DEFAULT 'default_cover.jpg', -- 封面路径
                        type VARCHAR(50) NOT NULL DEFAULT '动漫'  -- 视频类型，默认值为动漫
);
CREATE TABLE comments (
                          id INT AUTO_INCREMENT PRIMARY KEY,      -- 评论ID，自增
                          video_id INT NOT NULL,                  -- 关联的视频ID
                          username VARCHAR(50) NOT NULL,          -- 评论人的用户名
                          comment_text TEXT NOT NULL,             -- 评论内容
                          comment_time DATETIME DEFAULT CURRENT_TIMESTAMP, -- 评论时间，默认为当前时间
                          FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE  -- 关联视频ID，删除视频时级联删除评论
);
CREATE TABLE ratings (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         video_id INT NOT NULL,
                         username VARCHAR(255) NOT NULL,
                         rating INT NOT NULL,  -- 存储2到10之间的评分值
                         FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE  -- 关联视频ID，删除视频时级联删除评分
);
CREATE TABLE play_history (
                              id INT AUTO_INCREMENT PRIMARY KEY,              -- 历史记录ID，自增
                              username VARCHAR(255) NOT NULL,                  -- 用户名，替代之前的 user_id
                              video_id INT NOT NULL,                           -- 视频ID，关联 videos 表
                              play_time DATETIME DEFAULT CURRENT_TIMESTAMP,    -- 播放时间，默认为当前时间
                              FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE  -- 关联视频ID，删除视频时级联删除播放历史
);

CREATE USER 'laiyuci'@'localhost' IDENTIFIED BY '1';

GRANT ALL PRIVILEGES ON web.* TO 'laiyuci'@'localhost';

show tables ;
select * from users;
select * from comments;
select * from videos;
select * from ratings;
select * from play_history;

#插入数据
INSERT INTO videos (title, video_path,region) VALUES
    ('赛车总动员', '/videos/赛车总动员.mp4','欧美');
INSERT INTO comments (video_id, username, comment_text, comment_time)VALUES
    (2, 'admin', '国漫巅峰无疑！', NOW());
INSERT INTO users (username, password) VALUES ('admin', '123');
#插入一列(地区)
ALTER TABLE videos
    ADD COLUMN region VARCHAR(100) NOT NULL DEFAULT '未知';
#（封面）
ALTER TABLE videos
    ADD COLUMN cover_image_path VARCHAR(255) NOT NULL DEFAULT 'default_cover.jpg';
ALTER TABLE videos
    ADD COLUMN type VARCHAR(50) DEFAULT '动漫';

#删除
DELETE FROM videos WHERE id= 17;

-- 备份评论、评分和播放历史表的数据
CREATE TABLE backup_users AS SELECT * FROM users;
CREATE TABLE backup_comments AS SELECT * FROM comments;
CREATE TABLE backup_ratings AS SELECT * FROM ratings;
CREATE TABLE backup_play_history AS SELECT * FROM play_history;
CREATE TABLE backup_backup_videos AS SELECT * FROM videos;

# 还原备份
INSERT INTO videos (id, title, video_path, average_rating, region, cover_image_path)
SELECT id, title, video_path, average_rating, region, cover_image_path
FROM backup_backup_videos;

INSERT INTO comments (video_id, username, comment_text, comment_time)
SELECT video_id, username, comment_text, comment_time
FROM backup_comments;

INSERT INTO ratings (video_id, username, rating)
SELECT video_id, username, rating
FROM backup_ratings;

INSERT INTO play_history (username, video_id, play_time)
SELECT username, video_id, play_time
FROM backup_play_history;

INSERT INTO users (username, password,register_time, phonenumber)
SELECT username,password,register_time,phonenumber
FROM backup_users;












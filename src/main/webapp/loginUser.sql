CREATE DATABASE web;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,  -- 自动增长的主键
                       username VARCHAR(50) NOT NULL,      -- 用户名，最大长度为 50
                       password VARCHAR(255) NOT NULL      -- 密码，最大长度为 255
);
CREATE TABLE videos (
                        id INT AUTO_INCREMENT PRIMARY KEY,      -- 视频ID，自增
                        title VARCHAR(255) NOT NULL,             -- 视频标题
                        video_path VARCHAR(255) NOT NULL,        -- 视频文件路径
                        average_rating DOUBLE DEFAULT 0,
                        region VARCHAR(100) NOT NULL DEFAULT '未知',
                        cover_image_path VARCHAR(255) NOT NULL DEFAULT 'default_cover.jpg'
);
CREATE TABLE comments (
                          id INT AUTO_INCREMENT PRIMARY KEY,      -- 评论ID，自增
                          video_id INT NOT NULL,                  -- 关联的视频ID
                          username VARCHAR(50) NOT NULL,          -- 评论人的用户名
                          comment_text TEXT NOT NULL,             -- 评论内容
                          comment_time DATETIME DEFAULT CURRENT_TIMESTAMP, -- 评论时间，默认为当前时间
                          FOREIGN KEY (video_id) REFERENCES videos(id) -- 关联视频ID
);
CREATE TABLE ratings (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         video_id INT NOT NULL,
                         username VARCHAR(255) NOT NULL,
                         rating INT NOT NULL,  -- 存储2到10之间的评分值
                         FOREIGN KEY (video_id) REFERENCES videos(id)
);
CREATE USER 'laiyuci'@'localhost' IDENTIFIED BY '1';

GRANT ALL PRIVILEGES ON web.* TO 'laiyuci'@'localhost';

select * from users;
select * from comments;
select * from videos;
select * from ratings;

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
DELETE FROM comments WHERE comment_text = '张煜是啥鸟';
#更新数据
UPDATE videos SET videos.region='欧美' WHERE id = 9;

UPDATE videos
SET cover_image_path = 'images/吞噬星空剧场版 血洛大陆.jpg'
WHERE title = '吞噬星空剧场版 血洛大陆';


































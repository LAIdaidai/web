CREATE USER 'laiyuci'@'localhost' IDENTIFIED BY '1';

GRANT ALL PRIVILEGES ON web.* TO 'laiyuci'@'localhost';

show databases ;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,  -- 自动增长的主键
                       username VARCHAR(50) NOT NULL,      -- 用户名，最大长度为 50
                       password VARCHAR(255) NOT NULL      -- 密码，最大长度为 255
);

INSERT INTO users (username, password) VALUES ('admin', '123');

select * from users;

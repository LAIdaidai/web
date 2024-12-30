package com.example.movieplaystation.Comments;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Comment {
    private int id; // 新增 id 属性
    private String username;
    private String commentText;
    private Timestamp commentTime;

    // 构造函数
    public Comment(int id, String username, String commentText, Timestamp commentTime) {
        this.id = id;
        this.username = username;
        this.commentText = commentText;
        this.commentTime = commentTime;
    }

    // Getter 和 Setter 方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getFormattedTime() {
        // 格式化时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(commentTime);
    }
}

package com.example.movieplaystation.Comments;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Comment {
    private String username;
    private String commentText;
    private Timestamp commentTime;

    // 构造函数
    public Comment(String username, String commentText, Timestamp commentTime) {
        this.username = username;
        this.commentText = commentText;
        this.commentTime = commentTime;
    }

    // Getter 方法
    public String getUsername() {
        return username;
    }

    public String getCommentText() {
        return commentText;
    }

    public String getFormattedTime() {
        // 格式化时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(commentTime);
    }
}



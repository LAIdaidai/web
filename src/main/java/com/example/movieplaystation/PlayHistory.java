package com.example.movieplaystation;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class PlayHistory {
    private int videoId;               // 视频ID
    private String coverImagePath;     // 视频封面路径
    private String username;           // 用户名
    private String title;              // 视频标题
    private LocalDateTime playTime;    // 播放时间

    // 构造方法
    public PlayHistory(int videoId, String coverImagePath, String username, String title, LocalDateTime playTime) {
        this.videoId = videoId;
        this.coverImagePath = coverImagePath;
        this.username = username;
        this.title = title;
        this.playTime = playTime;
    }

    // Getter 和 Setter 方法
    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getCoverImagePath() {
        return coverImagePath;
    }

    public void setCoverImagePath(String coverImagePath) {
        this.coverImagePath = coverImagePath;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDateTime getPlayTime() {
        return playTime;
    }

    public void setPlayTime(LocalDateTime playTime) {
        this.playTime = playTime;
    }
    // 格式化播放时间
    public String getFormattedPlayTime() {
        if (playTime != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return playTime.format(formatter);
        }
        return "未知时间";
    }

    @Override
    public String toString() {
        return "PlayHistory{" +
                "videoId=" + videoId +
                ", coverImagePath='" + coverImagePath + '\'' +
                ", username='" + username + '\'' +
                ", title='" + title + '\'' +
                ", playTime=" + playTime +
                '}';
    }
}

package com.example.movieplaystation;

public class Video {
    private int id;
    private String title;
    private String videoPath;
    private double averageRating;
    private String region;
    private String coverImagePath;
    private String type;


    public Video() {}

    public Video(int id, String title, String videoPath, double averageRating, String region, String coverImagePath, String type) {
        this.id = id;
        this.title = title;
        this.videoPath = videoPath;
        this.averageRating = averageRating;
        this.region = region;
        this.coverImagePath = coverImagePath;
        this.type = type;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCoverImagePath() {
        return coverImagePath;
    }

    public void setCoverImagePath(String coverImagePath) {
        this.coverImagePath = coverImagePath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    // Override toString() 方法
    @Override
    public String toString() {
        return "Video{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", videoPath='" + videoPath + '\'' +
                ", averageRating=" + averageRating +
                ", region='" + region + '\'' +
                ", coverImagePath='" + coverImagePath + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}

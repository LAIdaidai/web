package com.example.movieplaystation;

public class Anime {
    private int id;
    private String title;
    private String videoPath;
    private double averageRating;
    private String region;
    private String coverImagePath;

    public Anime(int id, String title, String videoPath, double averageRating, String region, String coverImagePath) {
        this.id = id;
        this.title = title;
        this.videoPath = videoPath;
        this.averageRating = averageRating;
        this.region = region;
        this.coverImagePath = coverImagePath;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public String getRegion() {
        return region;
    }

    public String getCoverImagePath() {
        return coverImagePath;
    }
}

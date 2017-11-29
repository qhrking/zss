package com.zss.core.dal.entity;

/**
 * Created by huazhi on 2017/1/10.
 */
public class App extends BaseEntity{
    private String name;
    private String icon;
    private String qrcode;
    private String description;
    private String pics;
    private String tags;
    private String author;
    private String publicQrcode;
    private int score;
    private int isRecommend=0;//默认不推荐
    private int status=1;//默认正常
    private int viewCount;
    private int collectionCount;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getQrcode() {
        return qrcode;
    }

    public void setQrcode(String qrcode) {
        this.qrcode = qrcode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicQrcode() {
        return publicQrcode;
    }

    public void setPublicQrcode(String publicQrcode) {
        this.publicQrcode = publicQrcode;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(int isRecommend) {
        this.isRecommend = isRecommend;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public int getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(int collectionCount) {
        this.collectionCount = collectionCount;
    }
}

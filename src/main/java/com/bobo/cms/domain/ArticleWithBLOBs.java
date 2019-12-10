package com.bobo.cms.domain;

public class ArticleWithBLOBs extends Article {
    private String content;//文章内容

    private String summary;//文章摘要

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }
}
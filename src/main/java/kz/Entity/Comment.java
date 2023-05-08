package kz.Entity;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private int itemId;
    private int userId;
    private String comment;
    private Timestamp date;

    // constructor
    public Comment(int itemId, int userId, String comment, Timestamp date) {
        this.itemId = itemId;
        this.userId = userId;
        this.comment = comment;
        this.date = date;
    }

    // getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
}

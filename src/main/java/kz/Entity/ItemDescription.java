package kz.Entity;

import java.sql.Date;

public class ItemDescription {
    int id;
    int itemId;
    Date year;
    String information;
    String color;
    float diagonal;
    String material;

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

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getDiagonal() {
        return diagonal;
    }

    public void setDiagonal(float diagonal) {
        this.diagonal = diagonal;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public ItemDescription(int id,int itemId, Date year, String information, String color, float diagonal, String material) {
        this.id = id;
        this.itemId = itemId;
        this.year = year;
        this.information = information;
        this.color = color;
        this.diagonal = diagonal;
        this.material = material;
    }
}

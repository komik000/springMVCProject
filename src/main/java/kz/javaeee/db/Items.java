package kz.javaeee.db;

public class Items {

    private Long id;
    private String name;
    private int price;
    private int amount;

    private String link;
    public Items(){}
    public Items(Long id, String name, int price, int amount,String link) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.link = link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getLink() {
        return link;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }


    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

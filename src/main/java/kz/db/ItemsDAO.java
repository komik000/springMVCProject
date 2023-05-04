package kz.db;

import kz.Entity.Items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ItemsDAO {

    private static Connection connection;
    static {

            connection = DBManager.getInstance().getConnection();

    }
    public static boolean addItem(Items item) {
        int rows = 0;

        try{

            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO items (id,name,price,amount,link) " +
                    "VALUES (NULL,?,?,?,?)" +
                    "");
            statement.setString(1,item.getName());
            statement.setInt(2,item.getPrice());
            statement.setInt(3,item.getAmount());
            statement.setString(4,item.getLink());

            rows = statement.executeUpdate();
            statement.close();

        }catch (Exception e) {
            e.printStackTrace();
        }

        return rows>0;
    }

    public static ArrayList<Items> getItems(){
        ArrayList<Items> item = new ArrayList<>();

        try{

            PreparedStatement statement = connection.prepareStatement(""+
                    "SELECT id,name,price,amount,link" +
                    " FROM items ORDER BY price DESC"
            );


            ResultSet resultSet = statement.executeQuery();

            while(resultSet.next()) {

                item.add(new Items(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getInt("price"),
                        resultSet.getInt("amount"),
                        resultSet.getString("link")
                ));
            }

            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return item;
    }

    public static Items getItem(Long id){

        Items item = null;

        try{

            PreparedStatement statement = connection.prepareStatement(""+
                    "SELECT * FROM items WHERE id = ?"
            );
            statement.setLong(1,id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                item = new Items(
                        resultSet.getLong("id"),
                        resultSet.getString("name"),
                        resultSet.getInt("price"),
                        resultSet.getInt("amount"),
                        resultSet.getString("link")
                );
            }

            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return item;
    }

    public static boolean saveItem(Items item) {
        int rows = 0;

        try{
            String sql = "UPDATE items SET name = ?, price = ?, amount = ?,link = ? WHERE id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1,item.getName());
            statement.setInt(2,item.getPrice());
            statement.setInt(3,item.getAmount());
            statement.setString(4,item.getLink());
            statement.setLong(5,item.getId());

            rows = statement.executeUpdate();
            statement.close();


        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows>0;
    }
    public static boolean deleteItem(Items item) {
        int rows = 0;

        try{
            String sql = "DELETE FROM items WHERE id = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setLong(1,item.getId());

            rows = statement.executeUpdate();
            statement.close();


        } catch (Exception e) {
            e.printStackTrace();
        }

        return rows>0;
    }
//    public static boolean checkUser(String email,String password) {
//        boolean isUser = false;
//        try{
//            String sql = "DELETE FROM items WHERE id = ?";
//
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setLong(1,item.getId());
//
//            statement.close();
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return isUser;
//    }
}

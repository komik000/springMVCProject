package kz.db;

import kz.Entity.ItemDescription;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ItemDescriptionDAO {

    private static Connection connection;

    static {

        connection = DBManager.getInstance().getConnection();

    }

    public List<ItemDescription> getAllItemDescriptions() throws SQLException {
        List<ItemDescription> itemDescriptions = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM item_description")) {
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    ItemDescription itemDescription = new ItemDescription(
                            result.getInt("id"),
                            result.getInt("itemId"),
                            result.getDate("year"),
                            result.getString("information"),
                            result.getString("color"),
                            result.getFloat("diagonal"),
                            result.getString("material"));
                    itemDescriptions.add(itemDescription);
                }
            }
        }
        return itemDescriptions;
    }

    public ItemDescription getItemDescriptionById(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("SELECT * FROM item_description WHERE id = ?")) {
            statement.setInt(1, id);
            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    return new ItemDescription(
                            result.getInt("id"),
                            result.getInt("itemId"),
                            result.getDate("year"),
                            result.getString("information"),
                            result.getString("color"),
                            result.getFloat("diagonal"),
                            result.getString("material"));
                } else {
                    return null;
                }
            }
        }
    }

    public void createItemDescription(ItemDescription itemDescription) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("INSERT INTO item_description (item_id, year, information, color, diagonal, material) VALUES (?, ?, ?, ?, ?, ?)")) {
            statement.setInt(1, itemDescription.getItemId());
            statement.setDate(2, new java.sql.Date(itemDescription.getYear().getTime()));
            statement.setString(3, itemDescription.getInformation());
            statement.setString(4, itemDescription.getColor());
            statement.setFloat(5, itemDescription.getDiagonal());
            statement.setString(6, itemDescription.getMaterial());
            statement.executeUpdate();
        }
    }

    public void updateItemDescription(ItemDescription itemDescription) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("UPDATE item_description SET item_id = ?, year = ?, information = ?, color = ?, diagonal = ?, material = ? WHERE id = ?")) {
            statement.setInt(1, itemDescription.getItemId());
            statement.setDate(2, new java.sql.Date(itemDescription.getYear().getTime()));
            statement.setString(3, itemDescription.getInformation());
            statement.setString(4, itemDescription.getColor());
            statement.setFloat(5, itemDescription.getDiagonal());
            statement.setString(6, itemDescription.getMaterial());
            statement.setInt(7, itemDescription.getId());
            statement.executeUpdate();
        }
    }

    public void deleteItemDescription(int id) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement("DELETE FROM item_description WHERE id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
}
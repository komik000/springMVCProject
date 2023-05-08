package kz.db;

import kz.Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private static final Connection connection = DBManager.getInstance().getConnection();

    public List<User> getAllUsers(){
        List<User> users = new ArrayList<>();

        try {


            String sql = "SELECT * FROM users";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");
                boolean isAdmin = resultSet.getBoolean("is_admin");

                User user = new User(id, email, password, fullName,isAdmin);
                users.add(user);
            }
            resultSet.close();
            statement.close();
        }catch (SQLException e) {
            e.printStackTrace();
        }
            return users;

    }

    // Method to retrieve a single user from the database by their ID
    public User getUserByID(int id) {
        User user = null;

        try {


            String sql = "SELECT * FROM users WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int usid = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("fullname");
                boolean isAdmin = resultSet.getBoolean("is_admin");

                user = new User(usid, email, password, fullName,isAdmin);
            }

            resultSet.close();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        User user = null;

        try {


            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int id = resultSet.getInt("id");
                String mail = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("fullname");
                boolean isAdmin = resultSet.getBoolean("is_admin");

                user = new User(id, mail, password, fullName,isAdmin);
            }

            resultSet.close();
            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    // Method to create a new user in the database
    public void createUser(User user) {
        try {


            String sql = "INSERT INTO users (email, password, fullname,is_admin) VALUES (?, ?, ?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setBoolean(4, user.isAdmin());
            statement.executeUpdate();

            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    // Method to delete a user from the database
    public void deleteUser(int id) {
        try {
            String sql = "DELETE FROM users WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();

            statement.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void updateUser(User user){
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE users SET email = ?, password = ?, fullname = ?,is_admin = ? WHERE id = ?");
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            stmt.setInt(4, user.getId());
            stmt.setBoolean(5, user.isAdmin());
            stmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


}

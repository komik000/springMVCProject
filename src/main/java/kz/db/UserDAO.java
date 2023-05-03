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


            String sql = "SELECT id, email, password, fullname FROM users";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");

                User user = new User(id, email, password, fullName);
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


            String sql = "SELECT email, password, fullname FROM users WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("fullname");

                user = new User(id, email, password, fullName);
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


            String sql = "SELECT email, password, fullname FROM users WHERE email = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String mail = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("fullname");

                user = new User(0, mail, password, fullName);
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


            String sql = "INSERT INTO users (email, password, fullname) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());

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
            PreparedStatement stmt = connection.prepareStatement("UPDATE users SET email = ?, password = ?, fullname = ? WHERE id = ?");
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            stmt.setInt(4, user.getId());
            stmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


}

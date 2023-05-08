package kz.db;

import kz.Entity.Items;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {

    private static DBManager instance;

    private static Connection connection;

    private DBManager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3303/first_MVC_project?useUnicode=true&serverTimezone=UTC", "root", "");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static synchronized DBManager getInstance(){
        if (instance == null) {
            instance = new DBManager();
        }
        return instance;
    }

    public Connection getConnection(){
        return connection;
    }

}

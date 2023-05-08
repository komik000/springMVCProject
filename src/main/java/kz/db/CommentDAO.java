package kz.db;

import kz.Entity.Comment;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private Connection connection;

    public CommentDAO(){
        this.connection = DBManager.getInstance().getConnection();
    }
    public List<Comment> getCommentsByItemId(int itemId) {
        List<Comment> comments = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM comments WHERE item_id = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, itemId);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                String comment = rs.getString("comment");
                Timestamp date = rs.getTimestamp("date");
                Comment c = new Comment(itemId, userId, comment, date);
                c.setId(id);
                comments.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return comments;
    }

    public void addComment(Comment comment) {
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String sql = "INSERT INTO comments (item_id, user_id, comment, date) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, comment.getItemId());
            stmt.setInt(2, comment.getUserId());
            stmt.setString(3, comment.getComment());
            stmt.setTimestamp(4, comment.getDate());
            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                comment.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}


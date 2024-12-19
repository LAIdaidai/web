package com.example.movieplaystation;

import java.sql.*;
import java.io.*;
import java.util.Properties;

public class JDBCUtils {

    // 读取配置文件并获取数据库连接
    public static Connection getConnection() throws SQLException {
        Properties properties = new Properties();

        // 使用 ClassLoader 加载配置文件
        try (InputStream input = JDBCUtils.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new FileNotFoundException("db.properties file not found in classpath");
            }
            properties.load(input);  // 加载配置文件

            // 获取数据库连接配置
            String url = properties.getProperty("db.url");
            String username = properties.getProperty("db.username");
            String password = properties.getProperty("db.password");

            // 返回数据库连接
            return DriverManager.getConnection(url, username, password);
        } catch (IOException e) {
            e.printStackTrace();
            throw new SQLException("Failed to load db.properties file.");
        }
    }


    // 关闭数据库连接
    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

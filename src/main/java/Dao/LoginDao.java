package Dao;


import Connect.connect;
import Entity.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    public Account checkLogin(String user, String pass){
        try {
            String query = "SELECT * FORM account WHERE username = ? and password = ?";
            conn = new connect().getconConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()){
                Account a = new Account(rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6));
                return a;
            }
        }catch (Exception e){

        }
        return null;
    }
}

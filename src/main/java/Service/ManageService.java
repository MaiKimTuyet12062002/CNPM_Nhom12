package Service;

import Connect.DBConnect;
import Connect.connect;
import Entity.category;
import Entity.products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManageService {
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;

    public static List<products> getAllProduct() {
        List<products> list = new ArrayList<>();
        String query = "select * from products";
        try {
            conn = new connect().getconConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                products pro = new products(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                list.add(pro);
            }
        } catch (Exception e) {
            System.out.println("fail");
        }
        return list;
    }

    public static List<category> getAllCategory() {
        List<category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            conn = new connect().getconConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                category cat = new category(rs.getInt(1),
                        rs.getString(2));
                list.add(cat);
            }
        } catch (Exception e) {
            System.out.println("fail");
        }
        return list;
    }

    public static void addProduct(products pro) {
        String query = "INSERT INTO products (IdProduct, IdCat, NameProduct, Image, Price, Description)\n" +
                "VALUES (?,?,?,?,?,?);";
        try {
            conn = new connect().getconConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pro.getIdProduct());
            ps.setInt(2, pro.getIdCat());
            ps.setString(3, pro.getNameProduct());
            ps.setString(4, pro.getImage());
            ps.setInt(5, pro.getPrice());
            ps.setString(6, pro.getDescription());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("fail");
        }
    }
}

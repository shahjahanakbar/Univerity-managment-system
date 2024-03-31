/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.*;
import java.sql.*;

/**
 *
 * @author Shahjahan Akbar
 */
public class DAOForm {

    Connection con = null;

    public void Connection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/aoop";
            con = DriverManager.getConnection(url, "root", "");
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

    public int Insert(Form s) {
        int res = 0;
        try {
            Connection();
            String qry;
//            qry = "insert into tblform values (name = ?,father = ?,cnic=?,contact_no=?,email=?,gender=?,nationality=?)";
              
               qry = "insert into tblform (name,father,cnic,contact_no,email,gender,nationality) values (?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(qry);
             pst.setString(1, s.Name);
            pst.setString(2, s.Father);
            pst.setString(3, s.Cnic);
            pst.setString(4, s.Contact);
            pst.setString(5, s.UserName);
            pst.setString(6, s.Gender);
            pst.setString(7, s.Nationality);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public int Update(Form s) {
        int res = 0;
        try {
            Connection();
            String qry = "update tblform set name = ?, father = ?, cnic = ?, contact_no = ?, email = ?, gender = ?, nationality = ? where email = ?";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.Name);
            pst.setString(2, s.Father);
            pst.setString(3, s.Cnic);
            pst.setString(4, s.Contact);
            pst.setString(5, s.UserName);
            pst.setString(6, s.Gender);
            pst.setString(7, s.Nationality);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public int Delete(Form s) {
        int res = 0;
        try {
            Connection();
            String qry = "delete from tblform where email = ?";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public ArrayList<Form> SelectAll() {
        ArrayList<Form> list = new ArrayList<Form>();
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblform";
            Statement st = con.createStatement();
            rs = st.executeQuery(qry);
            while (rs.next()) {
                Form s = new Form();
                s.id = Integer.parseInt(rs.getString(1));
                s.Name = rs.getString(2);
                s.Father = rs.getString(3);
                s.Cnic = rs.getString(4);
                s.Contact = rs.getString(5);
                s.UserName = rs.getString(6);
                s.Gender = rs.getString(7);
                s.Nationality = rs.getString(8);
                list.add(s);
            }
        } catch (Exception ex) {
        }
        return list;
    }

    public Form SelectById(Form s) {
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblform where email = ? ";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            rs = pst.executeQuery();
            while (rs.next()) {
                s.Name = rs.getString(1);
                s.Father = rs.getString(2);
                s.Cnic = rs.getString(3);
                s.Contact = rs.getString(4);
                s.UserName = rs.getString(5);
                s.Gender = rs.getString(6);
                s.Nationality = rs.getString(7);
            }
        } catch (Exception ex) {
        }
        return s;
    }

    public Boolean validateUser(Form s) {
        Boolean found = false;
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblform where email = ? ";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            rs = pst.executeQuery();
            while (rs.next()) {
                found = true;
            }
        } catch (Exception ex) {
        }
        return found;
    }

//    public Boolean validatePassword(Form s) {
//        Boolean found = false;
//        ResultSet rs = null;
//        try {
//            Connection();
//            String qry = "Select * from tblform where password = ? ";
//            PreparedStatement pst = con.prepareStatement(qry);
//            pst.setString(1, s.Password);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                found = true;
//            }
//        } catch (Exception ex) {
//        }
//        return found;
//    }

}


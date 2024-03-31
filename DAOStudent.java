package classes;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.*;
import java.sql.*;

/**
 *
 * @author Shahjahan Akbar
 */
public class DAOStudent {

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

    public int Insert(Student s) {
        int res = 0;
        try {
            Connection();
            String qry;
            qry = "insert into tblstudent values (?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            pst.setString(2, s.Name);
            pst.setString(3, s.Cnic);
            pst.setString(4, s.Contact);
            pst.setString(5, s.Password);
            pst.setString(6, s.Gender);
            pst.setString(7, s.Nationality);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public int Update(Student s) {
        int res = 0;
        try {
            Connection();
            String qry = "update tblstudent set name = ?, cnic = ?, contact_no = ?, password = ?, gender = ?, nationality = ? where email = ?";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.Name);
            pst.setString(2, s.Cnic);
            pst.setString(3, s.Contact);
            pst.setString(4, s.Password);
            pst.setString(5, s.Gender);
            pst.setString(6, s.Nationality);
            pst.setString(7, s.UserName);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public int Delete(Student s) {
        int res = 0;
        try {
            Connection();
            String qry = "delete from tblstudent where email = ?";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            res = pst.executeUpdate();
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
        return res;
    }

    public ArrayList<Student> SelectAll() {
        ArrayList<Student> list = new ArrayList<Student>();
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblstudent";
            Statement st = con.createStatement();
            rs = st.executeQuery(qry);
            while (rs.next()) {
                Student s = new Student();
                s.UserName = rs.getString(1);
                s.Name = rs.getString(2);
                s.Cnic = rs.getString(3);
                s.Contact = rs.getString(4);
                s.Password = rs.getString(5);
                s.Gender = rs.getString(6);
                s.Nationality = rs.getString(7);
                list.add(s);
            }
        } catch (Exception ex) {
        }
        return list;
    }

    public Student SelectById(Student s) {
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblstudent where email = ? ";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.UserName);
            rs = pst.executeQuery();
            while (rs.next()) {
                s.UserName = rs.getString(1);
                s.Name = rs.getString(2);
                s.Cnic = rs.getString(3);
                s.Contact = rs.getString(4);
                s.Password = rs.getString(5);
                s.Gender = rs.getString(6);
                s.Nationality = rs.getString(7);
            }
        } catch (Exception ex) {
        }
        return s;
    }

    public Boolean validateUser(Student s) {
        Boolean found = false;
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblstudent where email = ? ";
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

    public Boolean validatePassword(Student s) {
        Boolean found = false;
        ResultSet rs = null;
        try {
            Connection();
            String qry = "Select * from tblstudent where password = ? ";
            PreparedStatement pst = con.prepareStatement(qry);
            pst.setString(1, s.Password);
            rs = pst.executeQuery();
            while (rs.next()) {
                found = true;
            }
        } catch (Exception ex) {
        }
        return found;
    }

}

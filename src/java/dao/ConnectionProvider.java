/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
/**
 *
 * @author mayur
 */
public class ConnectionProvider {
    public static Connection getcon(){
        try{
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","mayur013");
//            System.out.println(con);
            return con;
        }
        catch(Exception e){
            return null;
        }
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dao;

import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.Catagory;
import java.sql.*;

/**
 *
 * @author mayur
 */
public class CatagoryDao {

    public static void save(Catagory catagory){
        String query="insert into catagory (name) values ('"+catagory.getName()+"')";
        DbOperations.setDataOrDelete(query,"Catagory Added Successfully!!");
    }
    
    public static ArrayList<Catagory> getAllRecords(){
        ArrayList<Catagory> arrayList = new ArrayList<>();
        try{
            ResultSet rs = DbOperations.getData("select * from catagory");
            while(rs.next()){
                Catagory catagory=new Catagory();
                catagory.setId(rs.getInt("id"));
                catagory.setName(rs.getString("name"));
                arrayList.add(catagory);
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        return arrayList;
    }
    public static void delete(String id){
        String query="delete from catagory where id='"+id+"'";
        DbOperations.setDataOrDelete(query, "Catagory Deleted Successfully!!!");
    }
}

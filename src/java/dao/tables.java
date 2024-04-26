/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dao;

import javax.swing.JOptionPane;

/**
 *
 * @author mayur
 */
public class tables {

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        // TODO code application logic here
        try{
            String userTable="create table user(id int AUTO_INCREMENT primary key, name varchar(200),email varchar (200), mobileNumber varchar(10), address varchar(200), password varchar(200),securityQuestion varchar(200), answer varchar(200), status varchar(20),UNIQUE (email))";
            String admin = "insert into user (name,email,mobileNumber,address,password,securityQuestion,answer,status) values ('Admin','Admin@gmail.com','9664554488','India','Admin','What is your name ?','Mayur','true')";
            String catagoryTable="create table catagory(id int AUTO_INCREMENT primary key, name varchar(200);)";
            String productTable="create table product (id int AUTO_INCREMENT primary key, name varchar(200),catagory varchar(200),price varchar(200))";
            String billTable="Create table bill (id int primary key,name varchar(200),mobileNumber varchar(200), email varchar(200),date varchar(50),total varchar(200),createdBy varchar(200))";
            
            DbOperations.setDataOrDelete(userTable,"User Table created successfully!!!");
            DbOperations.setDataOrDelete(admin,"Admin Details Added Successfully!!!");
            DbOperations.setDataOrDelete(catagoryTable,"Catagory Table Created Successfully!!!");
            DbOperations.setDataOrDelete(productTable,"Product Table created successfully!!!");
            DbOperations.setDataOrDelete(billTable,"bill Table created successfully!!!");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
}

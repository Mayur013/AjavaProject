/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package common;

import java.io.File;
import javax.swing.JOptionPane;

/**
 *
 * @author mayur
 */
public class OpenPdf {

    public static void openById(String id){
        try{
            if((new File("D:\\CafeBills\\"+id+".pdf")).exists()){
                Process p=Runtime
                        .getRuntime()
                        .exec("rundll32 url.dll,FileProtocolHandler D:\\CafeBills\\"+id+".pdf");
            }
            else{
                JOptionPane.showMessageDialog(null, "File is Not Exist");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
}

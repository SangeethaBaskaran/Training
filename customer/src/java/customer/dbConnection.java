package customer;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sangeetha
 */
import java.sql.*;
import com.mysql.jdbc.Driver;


public class dbConnection {
    
    private static final String url = "jdbc:mysql://localhost:3306/cust_details";
    private static final String user = "root";
    private static final String password = "";
    public Connection con = null;
    public Statement stmt = null;
    public static void main(String[] args) throws SQLException {
        System.out.println("Hello world!!");
        
        try {
//                Class.forName("com.mysql.jdbc.Driver");
//                con=DriverManager.getConnection(url, user, password);
//                System.out.println("Success");
//                stmt = con.createStatement();
                
        } catch (Exception e) {
                e.printStackTrace();
        } finally{
            
        }       
    }
    public Connection conn() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        return con;
    }
    public boolean insert() throws SQLException{
        String sql = "INSERT INTO details VALUES ('hello', 'joey')";
                return stmt.execute(sql);
    }
    public  boolean update(String age,String pet,String name) throws Exception{
        Connection con=conn();
        String sql="UPDATE details SET age="+age+",pet='"+pet+"' where name='"+name+"'";
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        con.close();
        return true;
    }
    public String[] select(String name) throws Exception{
        Connection con=conn();
        String age="",pet="";
        String sql="select * from details where name='"+name+"'";
        stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while(rs.next()){
            age=rs.getString("age");
            pet=rs.getString("pet");           
        }
        String result[]={age,pet};
        return result;        
    }
    public boolean validate(String username,String password) throws SQLException, Exception{
        Connection con=conn();
        String sql="SELECT * FROM details WHERE name='"+username+"' and password='"+password+"'";
        stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while(rs.next()){
            return true;
        }
       return false;
        
    }
    public boolean ajaxvalidate(String username) throws SQLException, Exception{
        Connection con=conn();
        String sql="SELECT * FROM details WHERE name='"+username+"'";
        stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        while(rs.next()){
            return true;
        }
       return false;
        
    }
    public void delete(String username) throws SQLException, Exception{
        Connection con=conn();
        String sql="DELETE FROM details WHERE name='"+username+"'";
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        con.close();
    }
    public boolean validateinput(String age,String pet,String name) throws Exception{
        String regex = "[0-9]+";
        if(age.matches(regex)){
            if(Integer.parseInt(age)<100&&pet.length()<10){
                update(age, pet, name);
            }else{
                return false;
            }
    }else{
            return false;
        }
        return true;
}
    public int signup(String name,String pass) throws Exception{
         Connection con=conn();
         if(!name.isEmpty()&&!pass.isEmpty()){
         String sql1="SELECT * FROM details WHERE name='"+name+"'";
         stmt=con.createStatement();
         ResultSet rs=stmt.executeQuery(sql1);
         if(!rs.next()){
             String sql="INSERT INTO details(name,password,age,pet) VALUES ('"+name+"', '"+pass+"',null,null)";
        stmt=con.createStatement();
        stmt.executeUpdate(sql);
        con.close();
        return 1;
         }else{
             return -1;
         }
    }else{
             return 0;
         }
}
}
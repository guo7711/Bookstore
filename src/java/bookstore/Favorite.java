/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package bookstore;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
public class Favorite {
    String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    String UserName,ISBN;
     
    //String DBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
    //String url="jdbc:odbc:bookstore";
    String url = null;
    Vector V_ISBN=new Vector();
    Vector V_UserName=new Vector();
    int i=0;
    Connection conn,con1;
    Statement sql;
    PreparedStatement pstmt;
    ResultSet rs;
    
    public Favorite()
    {
        url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd + "&useUnicode=true&characterEncoding=UTF-8";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url);
            sql = conn.createStatement();
        } catch (ClassNotFoundException ex) {
         
        } catch (SQLException ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Favorite.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Favorite.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Vector getV_ISBN()
    {
        return V_ISBN;
    }

    

    public int addFavorite(String aUserName,String aISBN) throws ClassNotFoundException, SQLException
    {
        boolean flag=true;
        String add="Insert into favorite VALUES(?,?)";
        String inspect="Select ISBN From favorite where UserName="+"'"+aUserName+"'";
        String inspectUserName;
        int favoriteinfo;
      //  Class.forName(DBDriver);
        
        
        conn=DriverManager.getConnection(url);
        con1=DriverManager.getConnection(url);
        sql=conn.createStatement();
        rs=sql.executeQuery(inspect);
        while(rs.next())
        {
            String inspectISBN=rs.getString("ISBN");
            if(inspectISBN.equalsIgnoreCase(aISBN)==true)
            {
                flag=false;
                break;
            }
        }
        if(flag==false) {System.out.println("1 book added to Wish List.");favoriteinfo=0;return favoriteinfo;}
        else
        {
            pstmt=con1.prepareStatement(add);
            pstmt.setString(1, aUserName);
            pstmt.setString(2, aISBN);
            pstmt.executeUpdate();
            favoriteinfo=1;
            return favoriteinfo;
        }
    }

    public void deleteFavorite(String aUserName,String aISBN) throws ClassNotFoundException, SQLException
    {
        String delete="Delete from favorite where UserName="+"'"+aUserName+"'"+ "AND ISBN="+"'"+aISBN+"'";
        //Class.forName(DBDriver);
        conn=DriverManager.getConnection(url);
        sql=conn.createStatement();
        sql.executeUpdate(delete);

    }

    public void deleteAll(String aUserName) throws ClassNotFoundException, SQLException
    {
        String delete="Delete from favorite Where UserName="+"'"+aUserName+"'";
       // Class.forName(DBDriver);
        conn=DriverManager.getConnection(url);
        sql=conn.createStatement();
        sql.executeUpdate(delete);

    }

    public void searchFavorite(String aUserName) throws ClassNotFoundException, SQLException
    {
        String search="Select ISBN From favorite where UserName="+"'"+aUserName+"'";
        //Class.forName(DBDriver);
        conn=DriverManager.getConnection(url);
        sql=conn.createStatement();
        rs=sql.executeQuery(search);
        while(rs.next())
        {
            //String a=rs.getString("ISBN");
            
        }
        
    }

    public void getISBN(String aUserName) throws SQLException, ClassNotFoundException
    {
        String query="Select ISBN from favorite where UserName='"+aUserName+"'";
        //Class.forName(DBDriver);
        conn=DriverManager.getConnection(url);
        sql=conn.createStatement();
        rs=sql.executeQuery(query);
        while(rs.next())
        {
            V_ISBN.add(rs.getString("ISBN"));
        }
    }

   


    public static void main(String[] agrs) throws ClassNotFoundException, SQLException
    {
        
    }
}

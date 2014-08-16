/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package bookstore;
import java.sql.*;
import java.util.Iterator;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class ShopCart {
    
    String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    Vector V_ISBN=new Vector();
    Vector V_UserName=new Vector();
    Vector<Integer> V_Number=new Vector();
    String ISBN,UserName;
    Connection con,con1;
    Statement sql;
    PreparedStatement pstmt;
    ResultSet rs;
    //String DBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
    //String url="jdbc:odbc:bookstore";
    String url;
    
   
    public Vector getV_ISBN()
    {
        return V_ISBN;
    }
    public Vector<Integer> getV_Number()
    {
        return V_Number;
    }

    public ShopCart() throws ClassNotFoundException, SQLException
    {
        //Class.forName(DBDriver);
         url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd + "&useUnicode=true&characterEncoding=UTF-8";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url);
            sql = con.createStatement();
        } catch (ClassNotFoundException ex) {
         
        } catch (SQLException ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Favorite.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Favorite.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public int addtoShopCart(String aUserName,String aISBN) throws SQLException
    {

        int cartInfo;
        boolean flag=true;
        String add="Insert into shopcart VALUES(?,?,?)";
        String inspect="Select ISBN From shopcart where UserName="+"'"+aUserName+"'";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
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
        rs.close();
        sql.close();
        con.close();

        if(flag==false) {System.out.println("1 book added to Wish List.");cartInfo=0;return cartInfo;}
        else
        {
            con1=DriverManager.getConnection(url);
            pstmt=con1.prepareStatement(add);
            pstmt.setString(1, aUserName);
            pstmt.setString(2, aISBN);
            pstmt.setInt(3, 1);
            pstmt.executeUpdate();
            cartInfo=1;
            pstmt.close();
            con1.close();
            return cartInfo;
        }


    }

    public void deleteAll(String aUserName) throws ClassNotFoundException, SQLException
    {
        con=DriverManager.getConnection(url);
        String delete="Delete from shopcart Where UserName="+"'"+aUserName+"'";
        sql=con.createStatement();
        sql.executeUpdate(delete);
        sql.close();
        con.close();
    }
    
    public void deleteShopCart(String name, String deleteISBN) throws SQLException{
        
        String delete="Delete from shopcart where UserName="+"'"+name+"'"+ "AND ISBN="+"'"+deleteISBN+"'";
        //Class.forName(DBDriver);
       // con=DriverManager.getConnection(url);
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        sql.executeUpdate(delete);
    }

    public void getISBN(String aUserName) throws SQLException
    {
        con=DriverManager.getConnection(url);
        String query="Select ISBN,Number from shopcart where UserName='"+aUserName+"'";
        sql=con.createStatement();
        rs=sql.executeQuery(query);
        while(rs.next())
        {
            V_ISBN.add(rs.getString("ISBN"));
            V_Number.add(rs.getInt("Number"));
        }
        sql.close();
        con.close();
    }

    public void updatebooknumber(Vector aISBN,Vector aNumber,String UserName) throws SQLException
    {
        con=DriverManager.getConnection(url);
        for(int i=0;i<aISBN.size();i++)
        {
            String update="Update shopcart Set Number='"+aNumber.get(i)+"' where UserName='"+UserName+"' and ISBN='"+aISBN.get(i)+"'";
            sql=con.createStatement();
            sql.executeUpdate(update);
        }
        sql.close();
        con.close();
    }


    public static void main(String[] agrs) throws ClassNotFoundException, SQLException
    {
        ShopCart s=new ShopCart();
        Vector v=new Vector();
        s.getISBN("su");
        v=s.getV_ISBN();
        Iterator i=v.iterator();
        while(i.hasNext())
        {
            System.out.println(i.next());
        }
    }

}

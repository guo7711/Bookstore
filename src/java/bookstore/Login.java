/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package bookstore;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
public class Login {
    String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    
    String username,password;
    String url;
    //String DBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
    //String url="jdbc:odbc:bookstore";
    Connection con,con1;
    Statement sql;
    PreparedStatement pstmt;
    ResultSet rs;
    
    public Login()
    {
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

    public void setUserName(String sID)
    {
        username=sID;
    }
    public String getUserName()
    {
        return username;
    }

    public void setPassword(String sPw)
    {
        password=sPw;
    }
    public String getPassword()
    {
        return password;
    }



    public int getLoginInfo() throws SQLException, ClassNotFoundException
    {
        int i=0;
        String query="Select Privilege from login where UserName="+"'"+username+"'"+"AND Password="+"'"+password+"'";
       //Class.forName(DBDriver);
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(query);
        while(rs.next())
        {
            i=rs.getInt("Privilege");
        }
        return i;
    }

    public void addUser(String aID,String aPassWord) throws ClassNotFoundException, SQLException
    {
        boolean flag=true;
        String add="Insert into login VALUES(?,?,?)";
        String inspect="Select UserName From login ";
        String inspectUserName;
        //Class.forName(DBDriver);
        con=DriverManager.getConnection(url);
        con1=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(inspect);
        while(rs.next())
        {
            inspectUserName=rs.getString("UserName");
            if(inspectUserName.equalsIgnoreCase(aID)==true)
            {
                flag=false;
                break;
            }
            
        }
        con.close();
        if(flag==false) System.out.println("Exsiting user name.");
        else
        {
            pstmt=con1.prepareStatement(add);
            pstmt.setString(1, aID);
            pstmt.setString(2, aPassWord);
            pstmt.setString(3, "1");
            pstmt.executeUpdate();
        }
    }

    public static void main(String[] agrs) throws ClassNotFoundException, SQLException
    {
        Login f=new Login();
        f.addUser("ss", "ss");
        //f.setUserName("s");
        //f.setPassword("s");
        //int i=f.getLoginInfo();
        //System.out.print(i);
    }

    
}

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
public class Register {
    
     String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    
    private String url;
    private Connection con1,con;
    private Statement sql;
    PreparedStatement pstmt;
    private ResultSet rs;

    public Register() throws ClassNotFoundException
    {
       // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       // url = "jdbc:odbc:bookstore";
        
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

    public int register(String aUserName,String aPassWord) throws SQLException
    {
        int RegisterInfo;
        boolean flag=true;
        String add="Insert into userinfo VALUES(?,?,?,?,?,?,?)";
        String inspect="Select UserName From UserInfo";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(inspect);
        while(rs.next())
        {
            String inspectUserName=rs.getString("UserName");
            if(inspectUserName.equalsIgnoreCase(aUserName)==true)
            {
                flag=false;
                break;
            }

        }
        rs.close();
        sql.close();
        con.close();

        if(flag==false) {System.out.println("Exisiting user name！");RegisterInfo=0;return RegisterInfo;}
        else
        {
            con1=DriverManager.getConnection(url);
            pstmt=con1.prepareStatement(add);
            pstmt.setString(1, aUserName);
            pstmt.setString(2, "");
            pstmt.setString(3, aPassWord);
            pstmt.setString(4, "");
            pstmt.setString(5, "");
            pstmt.setString(6, "");
            pstmt.setString(7, "");
            pstmt.executeUpdate();
            RegisterInfo=1;
            pstmt.close();
            con1.close();
            return RegisterInfo;
        }
    }

    public void changeAddr(String aAddress,String UserName,String MailCode) throws SQLException
    {
        String change="Update userinfo Set Address='"+aAddress+"',MailCode='"+MailCode+"' where UserName='"+UserName+"'";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        sql.executeUpdate(change);
    }

    public void changeRegiPassword(String aPassword,String UserName) throws SQLException
    {
        String change="Update userinfo Set Password='"+aPassword+"' where UserName='"+UserName+"'";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        sql.executeUpdate(change);
    }

    public void changeLoginPassword(String aPassword,String UserName) throws SQLException
    {
        String change="Update login Set Password='"+aPassword+"' where UserName='"+UserName+"'";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        sql.executeUpdate(change);
    }

    public boolean checkPassword(String aPassword,String UserName) throws SQLException
    {
        String inspect="Select Password From login where Username='"+UserName+"'";
        String inspectPassword;
        int flag=2;
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(inspect);
        while(rs.next())
        {
            inspectPassword=rs.getString("Password");
            if(inspectPassword.equalsIgnoreCase(aPassword)==true)
            {
                flag=1;
                break;
            }
        }
        if(flag==1) return true;
        else return false;
    }

    public String getRealName(String UserName) throws SQLException
    {
        String addr="Select RealName From userinfo where UserName='"+UserName+"'";
        String RealName="";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(addr);
        while(rs.next())
        {
            RealName=rs.getString("RealName");
        }
        return RealName;
    }

    public String getSex(String UserName) throws SQLException
    {
        String addr="Select Sex From userinfo where UserName='"+UserName+"'";
        String RealName="";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(addr);
        while(rs.next())
        {
            RealName=rs.getString("Sex");
        }
        return RealName;
    }

    public String getPhone(String UserName) throws SQLException
    {
        String addr="Select Phone From userinfo where UserName='"+UserName+"'";
        String mailcode="";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(addr);
        while(rs.next())
        {
            mailcode=rs.getString("Phone");
        }
        return mailcode;
    }

    public String getAdd(String UserName) throws SQLException
    {
        String addr="Select Address From userinfo where UserName='"+UserName+"'";
        String address="";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(addr);
        while(rs.next())
        {
            address=rs.getString("Address");
        }
        return address;
    }

    public String getmailcode(String UserName) throws SQLException
    {
        String addr="Select MailCode From userinfo where UserName='"+UserName+"'";
        String mailcode="";
        con=DriverManager.getConnection(url);
        sql=con.createStatement();
        rs=sql.executeQuery(addr);
        while(rs.next())
        {
            mailcode=rs.getString("MailCode");
        }
        return mailcode;
    }

    public static void main(String[] args) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        Register r=new Register();
        boolean a=r.checkPassword("sj18078", "jasonrfry@sina.com");
        System.out.print(a);
    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore;

import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author cnu
 */
public class Order {

    //<editor-fold defaultstate="collapsed" desc="变量">
    String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    //用于生成订单号
    private static int serial;
    private static int day;
    //订单类成员
    private String UserName,totalPrice,state;
    private String OrderID;
    Vector V_OrderID = new Vector();
    Vector V_UserName=new Vector();
    Vector V_ISBN = new Vector();
    Vector V_state = new Vector();
    Vector V_Number=new Vector();
    Vector V_totalprice=new Vector();
    //数据库操作
    Connection con, con1;
    Statement sql, sql1;
    PreparedStatement pstmt;
    ResultSet rs;
    String url;
    //String DBDriver = "sun.jdbc.odbc.JdbcOdbcDriver";
    //String url = "jdbc:odbc:bookstore";
    //</editor-fold>
    
   

    public Vector getV_OrderID() {
        return V_OrderID;
    }

    public Vector getV_UserName(){
        return V_UserName;
    }

    public Vector getV_ISBN() {
        return V_ISBN;
    }
    
    public Vector getV_Number()
    {
        return V_Number;
    }
    public Vector getV_totalprice()
    {
        return V_totalprice;
    }
    public String getTotalPrice()
    {
        return totalPrice;
    }
    public String getState()
    {
        return state;
    }
    public Vector getV_state()
    {
        return V_state;
    }

    public Order() throws ClassNotFoundException {
        //<editor-fold defaultstate="collapsed" desc="连接数据库">
     //  Class.forName(DBDriver);
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

    public void addOrderBook(Vector ISBN, Vector<Integer> Number, String OrderID) throws SQLException {
        con = DriverManager.getConnection(url);
        for (int i = 0; i < ISBN.size(); i++) {
            String insert = "Insert Into orderbook VALUES(?,?,?)";
            pstmt = con.prepareStatement(insert);
            pstmt.setString(1, (String) ISBN.get(i));
            pstmt.setInt(2, Number.get(i));
            pstmt.setString(3, OrderID);
            pstmt.executeUpdate();
        }
        pstmt.close();
        con.close();
    }

    public void addOrderUser(String OrderID, String UserName, String totalprice) throws SQLException {
        con = DriverManager.getConnection(url);
        String insert = "Insert Into orderuser VALUES(?,?,?,?)";
        pstmt = con.prepareStatement(insert);
        pstmt.setString(1, OrderID);
        pstmt.setString(2, UserName);
        pstmt.setString(3, "In Process");
        pstmt.setString(4, totalprice);
        pstmt.executeUpdate();
    }

    public String getOrderID() {
        int dd = new GregorianCalendar().get(Calendar.DAY_OF_MONTH);
        if (dd != day) {
            serial = 1;
            day = dd;
        } else {
            serial++;
        }
        OrderID = new SimpleDateFormat("yyyyMMddhhmmss").format(new java.util.Date()) + new DecimalFormat("000").format(serial);
        return OrderID;
    }

    //查询用户订单
    public void queryOrderID(String aUserName) throws SQLException {
        String query = "Select * From orderuser where UserName=" + "'" + aUserName + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            V_OrderID.add(rs.getString("OrderID"));
            V_state.add(rs.getString("state"));
            V_totalprice.add(rs.getString("totalPrice"));
        }
    }

    public void queryOrderID2(String aUserName) throws SQLException {
        String query = "Select * From orderuser where UserName=" + "'" + aUserName + "' and state='In Process'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            V_OrderID.add(rs.getString("OrderID"));
            V_state.add(rs.getString("state"));
            V_totalprice.add(rs.getString("totalPrice"));
        }
    }

   public void queryOrderID3(String aUserName) throws SQLException {
        String query = "Select * From orderuser where UserName=" + "'" + aUserName + "'and state='Shipped'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            V_OrderID.add(rs.getString("OrderID"));
            V_state.add(rs.getString("state"));
            V_totalprice.add(rs.getString("totalPrice"));
        }
    }

    //查询详细订单信息
    public void detailOrder(String aOrderID) throws SQLException {
        String query = "Select * From orderbook where OrderID=" + "'" + aOrderID + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            V_ISBN.add(rs.getString("ISBN"));
            V_Number.add(rs.getString("Amount"));
        }
    }

    public void Order(String aOrderID) throws SQLException {
        String query = "Select * From orderuser where OrderID=" + "'" + aOrderID + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            state=rs.getString("state");
            totalPrice=rs.getString("totalPrice");
        }
    }

    //删除未发货订单
    public void deleteOrder(String UserName, String OrderID) throws SQLException {
        String deleteOrderUser = "delete from orderuser where UserName='" + UserName + "' and OrderID='" + OrderID + "'";
        String deleteOrderBook = "delete from orderbook where OrderID='" + OrderID + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        sql.executeUpdate(deleteOrderUser);
        con1 = DriverManager.getConnection(url);
        sql1 = con.createStatement();
        sql1.executeUpdate(deleteOrderBook);
    }

    public void changeOrder1(String UserName, String OrderID) throws SQLException {
        String changeorder = "Update orderuser Set state='Cancelled' where UserName='" + UserName + "' and OrderID='" + OrderID + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        sql.executeUpdate(changeorder);

    }

    public void changeOrder2(String UserName, String OrderID) throws SQLException {
        String changeorder = "Update orderuser Set state='Dlivered' where UserName='" + UserName + "' and OrderID='" + OrderID + "'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        sql.executeUpdate(changeorder);

    }

    public void AdminOrder() throws SQLException
    {
        String query = "Select * From orderuser where state='In Process'";
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        rs = sql.executeQuery(query);
        while (rs.next()) {
            V_OrderID.add(rs.getString("OrderID"));
            V_UserName.add(rs.getString("UserName"));
            V_state.add(rs.getString("state"));
            V_totalprice.add(rs.getString("totalPrice"));
        }
    }


    //GUAN
        public ArrayList<String[]> showNewOrder() throws SQLException {
        ArrayList<String[]> newOrder = new ArrayList<String[]>();
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        String sql0 = "Select * From orderuser Where state = 'In Process'";
        rs = sql.executeQuery(sql0);
        while (rs.next()) {
            String[] temp = new String[4];
            temp[0] = rs.getString("OrderID");
            temp[1] = rs.getString("UserName");
            temp[2] = rs.getString("state");
            temp[3] = rs.getString("totalPrice");
            newOrder.add(temp);
        }
        con.close();
        return newOrder;
    }

    //GUAN
        public Vector<String[]> getOneOrder(String orderID) throws SQLException {
        //已修改
        Vector<String[]> booklist = new Vector<String[]>();

        String sql0 = "SELECT * FROM orderbook where OrderID ='" + orderID + "'";
            con = DriverManager.getConnection(url);
            sql = con.createStatement();
            rs = sql.executeQuery(sql0);
        while (rs.next()) {
            String[] book = new String[2];
            book[0] = rs.getString("ISBN");
            book[1] = rs.getString("Amount");
            booklist.add(book);
        }
        con.close();
        return booklist;
    }

//guan
    public Vector<String[]> showAllOrder() throws SQLException {
        Vector<String[]> allOrder = new Vector<String[]>();
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        String sql0 = "Select * From orderuser";
        rs = sql.executeQuery(sql0);
        while (rs.next()) {
            String[] temp = new String[4];
            temp[0] = rs.getString("OrderID");
            temp[1] = rs.getString("UserName");
            temp[2] = rs.getString("state");
            temp[3] = rs.getString("totalPrice");
            allOrder.add(temp);
        }
        con.close();
        return allOrder;
    }

    //guan
        public void alterState(String orderID) throws SQLException {
        con = DriverManager.getConnection(url);
        sql = con.createStatement();
        String sql0 = "UPDATE orderUuser SET state = 'Delivered' WHERE OrderID = '" + orderID + "'";
        sql.executeUpdate(sql0);
        con.close();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Order o = new Order();
        o.AdminOrder();
        Vector n=o.getV_UserName();
        System.out.print(n.get(0)+"!!"+n.get(1));
    }
}

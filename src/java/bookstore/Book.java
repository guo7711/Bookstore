/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bookstore;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class Book {
    
    String userName = "root";
    String userPasswd = "";
    String dbName = "bookstore";
    private int bookID;
    private String bookName;
    private String auther;
    private String price;
    private int inventory;
    private int sales;
    private int classID;
    //---------------------
    private Connection conn,conn1;
    private Statement stmt,stmt1;
    private PreparedStatement pstmt;
    private ResultSet res;
    private String url;

    Vector V_ISBN=new Vector();
    Vector V_Name=new Vector();
    Vector V_Author=new Vector();
    Vector V_Version=new Vector();
    Vector V_Introduction=new Vector();
    Vector V_Publish=new Vector();
    Vector V_Price=new Vector();
    Vector V_image=new Vector();
    Vector<Integer> V_Sales=new Vector();
    Vector<Integer> V_Stock=new Vector();
    Vector V_Catelog=new Vector();

    public Book() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
        //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //url = "jdbc:odbc:bookstore";
        
        //mysql
        

        url = "jdbc:mysql://localhost/" + dbName + "?user=" + userName + "&password=" + userPasswd + "&useUnicode=true&characterEncoding=UTF-8";
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url);
            stmt = conn.createStatement();
        } catch (ClassNotFoundException ex) {
         
        } catch (SQLException ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
    public Vector getV_ISBN()
    {
        return V_ISBN;
    }
    public Vector getV_Name()
    {
        return V_Name;
    }
    public Vector getV_Author()
    {
        return V_Author;
    }
    public Vector getV_Version()
    {
        return V_Version;
    }
    public Vector getV_Introduction()
    {
        return V_Introduction;
    }
    public Vector getV_Publish()
    {
        return V_Publish;
    }
    public Vector getV_Price()
    {
        return V_Price;
    }
    public Vector getV_image()
    {
        return V_image;
    }
    public Vector<Integer> getV_Stock()
    {
        return V_Stock;
    }
    public Vector<Integer> getV_Sales()
    {
        return V_Sales;
    }
    public Vector getV_Catelog()
    {
        return V_Catelog;
    }

    //添加书目
    public void addItem(String ISBN,String Name,String Author,String Version,String Publish,String Price,int stock,String Catelog,String image) throws SQLException
    {
        String add="Insert Into book VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        conn = DriverManager.getConnection(url);
        pstmt=conn.prepareStatement(add);
        pstmt.setString(1, ISBN);
        pstmt.setString(2, Name);
        pstmt.setString(3, Author);
        pstmt.setString(4, Version);
        pstmt.setString(5, "");
        pstmt.setString(6, Publish);
        pstmt.setString(7, "$"+Price);
        pstmt.setString(8, image);
        pstmt.setInt(9, 0);
        pstmt.setInt(10, stock);
        pstmt.setString(11, Catelog);
        pstmt.executeUpdate();
    }

    //删除书目
    public void deleteBook() throws SQLException {
        res = stmt.executeQuery("Select ISBN From book where ISBN='" + bookID + "'");
        while (res.next()) {
            if (res.getString("bookName").equalsIgnoreCase(bookName) == true) {
                stmt.executeUpdate("DELETE FROM book WHERE ISBN = '" + bookID + "'");
                break;
            } else {
                System.out.println("Your search did not match any books.");
                break;
            }
        }
        conn.close();
    }

    //修改库存,累计销量，但现在累计销量还不能实现
    public void substock(Vector ISBN,Vector<Integer> Number) throws SQLException {
        conn = DriverManager.getConnection(url);
        conn1=DriverManager.getConnection(url);
        stmt = conn.createStatement();
        stmt1=conn1.createStatement();
        int sale,stock;
        for(int i=0;i<ISBN.size();i++)
        {
            String sql="select * from book where ISBN='"+ISBN.get(i)+"'";
            res = stmt.executeQuery(sql);
            while(res.next())
            {
                sale=res.getInt("Sales");
                stock=res.getInt("Stock");
                sale=sale+Number.get(i);
                stock=stock-Number.get(i);
                String update="Update book Set Sales='"+sale+"' ,Stock='"+stock+"' where ISBN='"+ISBN.get(i)+"'";
                stmt1.executeUpdate(update);
            }
            
        }

    }

    public void modifyBookStock(String ISBN,int number) throws SQLException
    {
        conn = DriverManager.getConnection(url);
        conn1=DriverManager.getConnection(url);
        stmt = conn.createStatement();
        stmt1=conn1.createStatement();
        int sale,stock;

            String sql="select * from book where ISBN='"+ISBN+"'";
            res = stmt.executeQuery(sql);
            while(res.next())
            {
                stock=res.getInt("Stock");
                stock=stock+number;
                String update="Update book Set Stock='"+stock+"'where ISBN='"+ISBN+"'";
                stmt1.executeUpdate(update);
            }


    }

    //详细搜索
    public void detailsearch_1(String aName,String aCatelog) throws SQLException {
        String sql="Select * from book where Catelog='"+aCatelog+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            String isbn=res.getString("ISBN");
            String name=res.getString("Name");
            String author=res.getString("Author");
            String version=res.getString("Version");
            String introduction=res.getString("Introduction");
            String publish=res.getString("Publish");
            String price=res.getString("Price");
            String image=res.getString("image");
            int sales=res.getInt("Sales");
            int stock=res.getInt("Stock");
            String catelog=res.getString("Catelog");
            String convertname1=name.toLowerCase();
            String convertname2=name.toUpperCase();
            if(name.contains(aName)||convertname1.contains(aName)||convertname2.contains(aName)){
            V_ISBN.add(isbn);
            V_Name.add(name);
            V_Author.add(author);
            V_Version.add(version);
            V_Introduction.add(introduction);
            V_Publish.add(publish);
            V_Price.add(price);
            V_image.add(image);
            V_Sales.add(sales);
            V_Stock.add(stock);
            V_Catelog.add(catelog);
            }
        }
    }

    public void detailsearch_2(String aCatelog,String aAuthor) throws SQLException {
        String sql="Select * from book where Catelog='"+aCatelog+"'and Author='"+aAuthor+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            
            
            V_ISBN.add(res.getString("ISBN"));
            V_Name.add(res.getString("Name"));
            V_Author.add(res.getString("Author"));
            V_Version.add(res.getString("Version"));
            V_Introduction.add(res.getString("Introduction"));
            V_Publish.add(res.getString("Publish"));
            V_Price.add(res.getString("Price"));
            V_image.add(res.getString("image"));
            V_Sales.add(res.getInt("Sales"));
            V_Stock.add(res.getInt("Stock"));
            V_Catelog.add(res.getString("Catelog"));
            
        }
    }

    //根据类别搜索
    public void searchBasedCatelog(String aCatelog) throws SQLException {
        String sql="Select * from book where Catelog="+"'"+aCatelog+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        int i=0;
        while (res.next()) {
            V_ISBN.add(res.getString("ISBN"));
            V_Name.add(res.getString("Name"));
            V_Author.add(res.getString("Author"));
            V_Version.add(res.getString("Version"));
            V_Introduction.add(res.getString("Introduction"));
            V_Publish.add(res.getString("Publish"));
            V_Price.add(res.getString("Price"));
            V_image.add(res.getString("image"));
            V_Sales.add(res.getInt("Sales"));
            V_Stock.add(res.getInt("Stock"));
            V_Catelog.add(res.getString("Catelog"));
            i++;
        }
    }

    public void searchBasedISBN(String aISBN) throws SQLException {
        String sql="Select * from book where ISBN="+"'"+aISBN+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            V_ISBN.add(res.getString("ISBN"));
            V_Name.add(res.getString("Name"));
            V_Author.add(res.getString("Author"));
            V_Version.add(res.getString("Version"));
            V_Introduction.add(res.getString("Introduction"));
            V_Publish.add(res.getString("Publish"));
            V_Price.add(res.getString("Price"));
            V_image.add(res.getString("image"));
            V_Sales.add(res.getInt("Sales"));
            V_Stock.add(res.getInt("Stock"));
            V_Catelog.add(res.getString("Catelog"));
           
        }
    }

    //同类产品热销
    public void samecategory(String aCategory) throws SQLException
    {
        String sql="Select * From book Order BY sales DESC";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        int i=0;
        while(res.next())
        {
            String isbn=res.getString("ISBN");
            String name=res.getString("Name");
            String image=res.getString("image");
            String category=res.getString("Catelog");
            if(category.equals(aCategory))
            {
                V_ISBN.add(isbn);
                V_Name.add(name);
                V_image.add(image);
                V_Catelog.add(category);
            }
            
        }
    }


   

    public void getTop() throws SQLException {
        
        String sql = "SELECT * FROM book ORDER BY sales DESC";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        int i = 0;
        while (res.next() && i < 10) {
            V_ISBN.add(res.getString("ISBN"));
            V_Name.add(res.getString("Name"));
            V_Author.add(res.getString("Author"));
            V_Version.add(res.getString("Version"));
            V_Introduction.add(res.getString("Introduction"));
            V_Publish.add(res.getString("Publish"));
            V_Price.add(res.getString("Price"));
            V_image.add(res.getString("image"));
            V_Sales.add(res.getInt("Sales"));
            V_Stock.add(res.getInt("Stock"));
            V_Catelog.add(res.getString("Catelog"));
            i++;
        }
        conn.close();
    }

    public void ShopCartInfo(Vector ISBN) throws SQLException
    {
         conn = DriverManager.getConnection(url);
         stmt = conn.createStatement();
         Iterator iter=ISBN.iterator();
         while(iter.hasNext())
         {
             String sql="Select * from book where ISBN='"+iter.next()+"'";
             res = stmt.executeQuery(sql);
             while(res.next())
             {
                V_Name.add(res.getString("Name"));
                V_Author.add(res.getString("Author"));
                V_Publish.add(res.getString("Publish"));
                V_Price.add(res.getString("Price"));
                V_image.add(res.getString("image"));
                V_Stock.add(res.getInt("Stock"));
                V_Catelog.add(res.getString("Catelog"));
             }
         }
    }

    public Vector<String[]> getClassBook(String _classID) throws SQLException {
        Vector<String[]> classBook = new Vector<String[]>();
        String sql = "SELECT * FROM book WHERE classID =" + _classID;
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            String[] temp = {"《" + res.getString("bookName") + "》 " + res.getString("auther"), res.getString("bookID")};
            classBook.add(temp);
        }
        conn.close();
        return classBook;
    }

    public String getBookClass1(String _classID) throws SQLException {
        String bookClass = null;
        String sql = "SELECT * FROM bookclass WHERE classID =" + _classID;
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            bookClass = res.getString("className");
        }
        conn.close();
        return bookClass;
    }

    public String[] getBookClass2(String _bookID) throws SQLException {
        String[] bookClass = new String[2];
        String sql = "SELECT * FROM bookClass WHERE classID = (SELECT classID FROM book WHERE bookID = " + _bookID + ")";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            bookClass[0] = res.getString("classID");
            bookClass[1] = res.getString("className");
        }
        conn.close();
        return bookClass;
    }

     //guan
    public String getBookPrice(String _bookID) throws SQLException {
        String name = null;
        String sql = "SELECT * FROM book WHERE ISBN ='" + _bookID+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            name = res.getString("Price");
        }
        conn.close();
        return name;
    }

    //guan
        public String getBookName(String _bookID) throws SQLException {
        String name = null;
        String sql = "SELECT * FROM book WHERE ISBN ='" + _bookID+"'";
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            name = res.getString("Name");
        }
        conn.close();
        return name;
    }//返回书名

//guan
    public Vector<String> getClasses() throws SQLException {
        String sql = "SELECT Catelog FROM book";
        Vector<String> classes = new Vector<String>();
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            classes.add(res.getString("Catelog"));
        }
        conn.close();
        return classes;
    } //返回所有图书类别

//guan
    public Vector<String[]> getAllBook() throws SQLException {
        String sql = "SELECT * FROM book ";
        Vector<String[]> allBook = new Vector<String[]>();
        conn = DriverManager.getConnection(url);
        stmt = conn.createStatement();
        res = stmt.executeQuery(sql);
        while (res.next()) {
            String[] temp = {res.getString("ISBN"), res.getString("Name"), res.getString("Author"),
                res.getString("Price"), res.getString("Sales"), res.getString("Stock"),
                res.getString("Catelog")};
            allBook.add(temp);
        }
        conn.close();
        return allBook;
    } //返回所有图书信息

   

    //这以上是我改过的----------------------------------------------------------
    void subStock(String string) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public static void main(String[] args) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        Book b=new Book();
        /*Vector a=new Vector();
        Vector c=new Vector();
        a.add(0,"4332323545657");
        a.add(1,"5678439999");
        b.ShopCartInfo(a);
        c=b.getV_Name();
        System.out.println(c.get(1));*/
        //b.addItem("11", "三国演义", "罗贯中", "34.40", 2, "历史");
    }
}

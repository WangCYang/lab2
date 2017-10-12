package mysql;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CRUD {
	    private String username=null;
	    private String password=null;
	    private String tablename=null;
	    
	    public CRUD(String tablename ,String username,String password){
	    	this.username=username;
	    	this.password=password;
	    	this.tablename=tablename;
	    }
	    //功能一:
        public List<String> getTitlesWithAutherName(String name){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	List<String> list=new ArrayList<String>();
        	
        	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select b.title from book b inner join author a on a.name=\""+name+"\" and a.AuthorID=b.AuthorID;");
				while(rs.next()){
					 String title=rs.getString("title");
					 list.add(title);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return list;
        }
        //功能二:
         public List<String> getALLofBookWithTitle(String title){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	List<String> list=new ArrayList<String>();
        	
        	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select * from book where title=\""+title+"\";");
				while(rs.next()){
						 String s=rs.getString("ISBN")+"|"+rs.getString("Title")+"|"+rs.getString("AuthorID" )+"|"+rs.getString("Publisher")+"|"+
				rs.getString("PublishDate")+"|"+rs.getString("price" );
					     list.add(s);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return list;
        }
         public String getAllofAuthorWithID(int id){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	String s=null;
        	
        	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select * from author where AuthorID="+id+";");
				if(rs.next()){
				     s=rs.getString("AuthorID")+"|"+rs.getString("Name")+"|"+rs.getString("Age" )+"|"+rs.getString("country");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 
           ConnectMysql.disconnect();
		   return s;
        }
        //功能三：
         public Boolean deleteBookWithIBSN(String id){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	Boolean flag=false;
        	
        	try {
				stmt=conn.createStatement();
				int rowsAffected=stmt.executeUpdate("delete from book where ISBN=\""+id+"\";");
				if(rowsAffected>0){
					flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return flag;
        }
         /*功能四:得到图书信息（书号，名字，作者名字，出版社，出版社时间，价钱）
                       根据读者名字查看是否有该作者，如果没有则要求用户输入该作者信息（名字，年龄，国籍），添加作者信息，返回作者号
                       添加图书信息
             */    
         public String checkAuthorWithName(String name){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	String id="";
        	
        	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select AuthorID from author where Name=\""+name+"\";");
				if(rs.next()){
					id=String.valueOf(rs.getInt("AuthorID"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return id;
        }
        
        public Boolean insertAuthor(ArrayList<String> info){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	Boolean flag=false;
        	
        	try {
				stmt=conn.createStatement();
				int rowsAffected=stmt.executeUpdate("insert author values (null,\""+info.get(0)+"\","+Integer.parseInt(info.get(1))+" ,\""+info.get(2)+"\");");
				if(rowsAffected>0){
					flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return flag;
        }
        
        public Boolean insertBook(ArrayList<String> info){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	Boolean flag=false;
        	
        	try {
				stmt=conn.createStatement();
				System.out.println("insert book values (\""+info.get(0)+"\",\""+info.get(1)+"\","+Integer.parseInt(info.get(2))+",\""+info.get(3)+"\",\""+info.get(4)+"\","+Float.parseFloat(info.get(5))+");");
				int rowsAffected=stmt.executeUpdate("insert book values (\""+info.get(0)+"\",\""+info.get(1)+"\","+Integer.parseInt(info.get(2))+" ,\""+info.get(3)+"\",\""+info.get(4)+"\","+Float.parseFloat(info.get(5))+");");
				if(rowsAffected>0){
				flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return flag;
        }
        
        //功能五;更新，就将（作者，出版社，出版日期，价格）全部展示出来，修改后全部提交，一起修改，需用js判断是否有改动
                     //先判断是否存在该作者，否则跳转至修改作者的地方，然后修改（作者id，出版社，出版日期，价格）
        public Boolean UpdateBook(ArrayList<String> info){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	Boolean flag=false;
        	
        	try {
				stmt=conn.createStatement();
				int rowsAffected=stmt.executeUpdate("update book set AuthorID="+Integer.parseInt(info.get(1))+
						                                                             ",Publisher=\""+info.get(2)+"\",PublishDate=\""+info.get(3)+"\" ,price="+Float.parseFloat(info.get(4))+" where ISBN=\""+info.get(0)+"\";");
				if(rowsAffected>0){
					flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return flag;
        }
         public int getTotalOfBook(){
        	Connection conn=ConnectMysql.connect(tablename, username,password);
        	Statement stmt=null; 
        	ResultSet rs=null;
        
        	int num=0;
        	
        	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(" select count(*) from book;");
				 rs.next();  
			    num= rs.getInt(1);  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
           ConnectMysql.disconnect();
		   return num;
        }
       public  int getAuthornum(){
    	   Connection conn=ConnectMysql.connect(tablename, username,password);
       	Statement stmt=null; 
       	ResultSet rs=null;
       
       	int num=0;
       	
       	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery(" select count(*) from author;");
				 rs.next();  
			    num= rs.getInt(1);  
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       	
          ConnectMysql.disconnect();
		   return num;
        }
       public  int getPublishernum(){
    	   Connection conn=ConnectMysql.connect(tablename, username,password);
          	Statement stmt=null; 
          	ResultSet rs=null;
          
          	int num=0;
          	ArrayList<String> list=new ArrayList<>();
          	
          	try {
   				stmt=conn.createStatement();
   				rs=stmt.executeQuery("select Publisher from book;");
   				while(rs.next()){
   					String s=rs.getString("Publisher");
   					if(!list.contains(s)){
   						 num++;
   						 list.add(s);
   					}
   				}
   			  
   			} catch (SQLException e) {
   				// TODO Auto-generated catch block
   				e.printStackTrace();
   			}
          	
             ConnectMysql.disconnect();
   		   return num;
       }
       public float getPricenum(){
    	   Connection conn=ConnectMysql.connect(tablename, username,password);
         	Statement stmt=null; 
         	ResultSet rs=null;
         
         	float num=0;
         	
         	try {
  				stmt=conn.createStatement();
  				rs=stmt.executeQuery("select price  from book;");
  				while(rs.next()){
  					num+=rs.getFloat("price");
  				}
  			  
  			} catch (SQLException e) {
  				// TODO Auto-generated catch block
  				e.printStackTrace();
  			}
         	
            ConnectMysql.disconnect();
            return num;
       }
       public ArrayList<String>  getAllBooks(){
    	   Connection conn=ConnectMysql.connect(tablename, username,password);
           Statement stmt=null; 
       	   ResultSet rs=null;
       
         	ArrayList<String> list=new ArrayList<String>();
       	
       	try {
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select * from book;");
				while(rs.next()){
						 String s=rs.getString("ISBN")+"|"+rs.getString("Title")+"|"+rs.getString("AuthorID" )+"|"+rs.getString("Publisher")+"|"+rs.getString("PublishDate")+"|"+rs.getString("price" );
					     list.add(s);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       	
          ConnectMysql.disconnect();
		   return list;
       }
}

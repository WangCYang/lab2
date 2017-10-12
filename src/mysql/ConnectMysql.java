package mysql;
import java.sql.*;
public class ConnectMysql {
	    private static Connection conn=null;//Connection类
	
	     public static Connection connect(String table,String name,String pwd){ 
	   	  try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  //加载JDBC  driver，注册了JDBC驱动
	   	   
	     	try {
			conn=DriverManager.getConnection(table,name,pwd);//后续操作用这个对象进行就可以
	    	} catch (SQLException e) {
		 	// TODO Auto-generated catch block
			e.printStackTrace();
	    	}
	    	 return conn;
	     }
	     
	     public static void disconnect() { 
	    	    if (conn!= null) { 
	    	      try { 
	    	        conn.close(); 
	    	      } catch (SQLException e) { 
	    	        // TODO Auto-generated catch block 
	    	        e.printStackTrace(); 
	    	      } 
	    	    } 
	    	  } 
	     
            public static void main(String[] args){
            	   Connection conn=null;
            	   Statement stmt=null;//Statement 类：语句对象，保存要执行的语句
            	   ResultSet res=null;//ResultSet类 结果集对象，保存语句执行的结果
            	   
            	   conn=connect("bookdb","root","1234");
            	   try {
					stmt=conn.createStatement();
					res=stmt.executeQuery("select title from book");//得到结果集记录
					while(res.next()){
						 String name=res.getString("title");
						 System.out.println(name);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//得到了一个可以执行sql命令的对象
            }
}

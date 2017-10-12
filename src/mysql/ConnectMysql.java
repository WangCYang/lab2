package mysql;
import java.sql.*;
public class ConnectMysql {
	    private static Connection conn=null;//Connection��
	
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
			}  //����JDBC  driver��ע����JDBC����
	   	   
	     	try {
			conn=DriverManager.getConnection(table,name,pwd);//�������������������оͿ���
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
            	   Statement stmt=null;//Statement �ࣺ�����󣬱���Ҫִ�е����
            	   ResultSet res=null;//ResultSet�� ��������󣬱������ִ�еĽ��
            	   
            	   conn=connect("bookdb","root","1234");
            	   try {
					stmt=conn.createStatement();
					res=stmt.executeQuery("select title from book");//�õ��������¼
					while(res.next()){
						 String name=res.getString("title");
						 System.out.println(name);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//�õ���һ������ִ��sql����Ķ���
            }
}

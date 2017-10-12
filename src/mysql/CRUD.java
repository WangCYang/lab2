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
	    //����һ:
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
        //���ܶ�:
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
        //��������
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
         /*������:�õ�ͼ����Ϣ����ţ����֣��������֣������磬������ʱ�䣬��Ǯ��
                       ���ݶ������ֲ鿴�Ƿ��и����ߣ����û����Ҫ���û������������Ϣ�����֣����䣬�����������������Ϣ���������ߺ�
                       ���ͼ����Ϣ
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
        
        //������;���£��ͽ������ߣ������磬�������ڣ��۸�ȫ��չʾ�������޸ĺ�ȫ���ύ��һ���޸ģ�����js�ж��Ƿ��иĶ�
                     //���ж��Ƿ���ڸ����ߣ�������ת���޸����ߵĵط���Ȼ���޸ģ�����id�������磬�������ڣ��۸�
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

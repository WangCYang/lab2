package action;

import java.util.ArrayList;

import mysql.CRUD;

public class BookAction extends com.opensymphony.xwork2.ActionSupport{
    private int totalnum;
    private int authornum;
    private int  publishernum;
    private float pricenum; 
    private ArrayList<String> booklist;
    
    private String selectedbook;
    
    private String selectedauthor;
    private ArrayList<String> selectedbooks;
    String username = System.getenv("ACCESSKEY");
	String password = System.getenv("SECRETKEY");
	//System.getenv("MYSQL_HOST_S"); 为从库，只读
	 String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
    private CRUD crud=new CRUD(dbUrl,username,password);
    
    private String submitstate;
    private String isbn;
    private String title;
    private String author;
    private String publisher;
    private String publishdate;
    private String price;
    
    private String authorname;
    private String authorage;
    private String authorcountry;
    
    
    private String flag;
   public BookAction(){
	   //System.out.print("cnm");
	   //total();
   }
   public String getFlag (){
   	return  flag ;
   }
   public void setFlag(String flag ){
   	this. flag =flag; 
   }
    public int getTotalnum(){
    	return totalnum;
    }
    public void setTotalnum(int totalnum){
    	this.totalnum=totalnum;
    }
    
    public int getAuthornum(){
    	return  authornum;
    }
    public void setAuthornum(int  authornum){
    	this. authornum= authornum;
    }
    public float getPricenum(){
    	return  pricenum;
    }
    
    public void setPricenum(float  pricenum){
    	this. pricenum=pricenum;
    }
    public int getPublishernum(){
    	return  publishernum;
    }
    public void setPublishernum(int  publishernum){
    	this. publishernum=publishernum;
    }
    public ArrayList<String> getBooklist(){
    	return booklist;
    }
    public void setBooklist(ArrayList<String> booklist){
    	this.booklist=booklist;
    }
   public String getSelectedbook(){
    	return selectedbook;
    }
    public void setSelectedbook(String selectedbook){
    	this.selectedbook=selectedbook;
    }
    public ArrayList<String> getSelectedbooks(){
    	return selectedbooks;
    }
    public void setSelectedbooks(ArrayList<String> selectedbooks){
    	this.selectedbooks=selectedbooks;
    }
    public String getSelectedauthor(){
    	return selectedauthor;
    }
    public void setSelectedauthor(String selectedauthor){
    	this.selectedauthor=selectedauthor;
    }
    public String getSubmitstate(){
    	return selectedauthor;
    }
    public void setSubmitstate(String submitstate){
    	this.submitstate=submitstate;
    }
    public String getIsbn(){
    	return isbn;
    }
    public void setIsbn(String isbn){
    	this.isbn=isbn;
    }
    public String getTitle(){
    	return title;
    }
    public void setTitle(String title){
    	this.title=title;
    } 
    public String getAuthor(){
    	return author;
    }
    public void setAuthor(String author){
    	this.author=author;
    } 
    public String getPublisher(){
    	return publisher;
    }
    public void setPublisher(String publisher){
    	this.publisher=publisher;
    } 
    public String getPublishdate(){
    	return publishdate;
    }
    public void setPublishdate(String publishdate){
    	this.publishdate=publishdate;
    } 
    public String getPrice(){
    	return price;
    }
    public void setPrice(String price){
    	this.price=price;
    }
  public String getAuthorname(){
    	return authorname;
    }
    public void setAuthorname(String authorname){
    	this.authorname=authorname;
    }
    public String getAuthorage(){
    	return authorage;
    }
    public void setAuthorage(String authorage){
    	this.authorage=authorage;
    } public String getAuthorcountry(){
    	return authorcountry;
    }
    public void setAuthorcountry(String authorcountry){
    	this.authorcountry=authorcountry;
    }
    public String total(){ 
    	setTotalnum(crud.getTotalOfBook());
    	setAuthornum(crud.getAuthornum());
    	setPublishernum(crud.getPublishernum());
    	setPricenum(crud.getPricenum());
    	return SUCCESS;
    }
    public String refreshhome(){ 
    	total();
    	showlist();
    	/*System.out.println(booklist.size());*/
    	return SUCCESS;
    }
    public String showlist(){
    	ArrayList<String> l=crud.getAllBooks();
    	ArrayList<String> mylist=new ArrayList<>();
    	for(String s:l){
    		String ss[]=s.split("\\|");
    		String author=crud.getAllofAuthorWithID(Integer.parseInt(ss[2]));
    		String at[]=author.split("\\|");
    		s=ss[0]+"|"+ss[1]+"|"+at[1]+"|"+ss[3]+"|"+ss[4]+"|"+ss[5]+"|"+at[0]+"|"+at[2]+"|"+at[3];
    		
    		mylist.add(s);
    	}
    	setBooklist(mylist);
    	return SUCCESS;
    }
    public String showselectedauthor(){
    	ArrayList<String> booktitles=(ArrayList<String>) crud.getTitlesWithAutherName(selectedauthor);
    	ArrayList<String> mylist=new ArrayList<>();
    	ArrayList<String> finallist=new ArrayList<>();
    	
    	for(String atitle:booktitles){
    		ArrayList<String> thisbooksinfo=(ArrayList<String>) crud.getALLofBookWithTitle(atitle);
    		for(String ainfo:thisbooksinfo){
    			mylist.add(ainfo) ;
    		}
    	}
    	for(String s:mylist){
    		String ss[]=s.split("\\|");
    		String author=crud.getAllofAuthorWithID(Integer.parseInt(ss[2]));
    		String at[]=author.split("\\|");
    		s=ss[0]+"|"+ss[1]+"|"+at[1]+"|"+ss[3]+"|"+ss[4]+"|"+ss[5]+"|"+at[0]+"|"+at[2]+"|"+at[3];
    		
    		finallist.add(s);
    	}
    	setSelectedbooks(finallist);
    	System.out.println(selectedbooks);
       return SUCCESS;
    }
    public String remove(){ 
    	String[] books=selectedbook.split("\\|");
    	for(String b:books){
    		System.out.println(crud.deleteBookWithIBSN(b));
    	}
    	refreshhome();
    	System.out.println(selectedbook);
    	return SUCCESS;
    }
    public String addbook(){
    	String thisid=crud.checkAuthorWithName(author);
    	if(thisid.equals("")){
			setFlag("empty author");
		}else{
    		ArrayList<String> list=new ArrayList<String>();
    		list.add(isbn);
    		list.add(title);
    		list.add(thisid);
    		list.add(publisher);
    		list.add(publishdate);
    		list.add(price);
    		Boolean b=crud.insertBook(list);
    		if(b==false){
    			setFlag("wrong add");
    		}else{
    			setFlag("correct add");
    		}
		}
    		return SUCCESS;
    }
    public String addauthor(){
    		ArrayList<String> list=new ArrayList<String>();
    		list.add(authorname);
    		list.add(authorage);
    		list.add(authorcountry);
    		Boolean b=crud.insertAuthor(list);
    		if(b==false){
    			setFlag("wrong addauthor");
    		}else{
    			setFlag("correct addauthor");
    		}
    		return SUCCESS;
    }
    public String updatebook(){
    	if(submitstate.equals("search")){
    		ArrayList<String> thisbooksinfo=(ArrayList<String>) crud.getALLofBookWithTitle(title);
    		if(thisbooksinfo.size()!=0){
    			setFlag("correct search");
    			String s=thisbooksinfo.get(0);
    			String ss[]=s.split("\\|");
        		String author=crud.getAllofAuthorWithID(Integer.parseInt(ss[2]));
        		String at[]=author.split("\\|");
        		s=ss[0]+"|"+ss[1]+"|"+at[1]+"|"+ss[3]+"|"+ss[4]+"|"+ss[5];
        		setSelectedbook(s);
    		}else{
    			setFlag("wrong search");
    		}
    		System.out.println(selectedbook);
    		
    	}else if(submitstate.equals("submit")){
    		String thisid=crud.checkAuthorWithName(author);
    		if(thisid.equals("")){
    			setFlag("empty author");
    		}else{
        		ArrayList<String> list=new ArrayList<String>();
        		list.add(isbn);
        		list.add(thisid);
        		list.add(publisher);
        		list.add(publishdate);
        		list.add(price);
        		Boolean b=crud.UpdateBook(list);
        		if(b==false){
        			setFlag("wrong update");
        		}else{
        			setFlag("correct update");
        		}
    		}
    	}
       System.out.println(submitstate);
    	return SUCCESS;
    }
	public String execute() throws Exception{
        System.out.println("执行了firstaction");
        return SUCCESS;//struts框架定义的成功视图
    }
}

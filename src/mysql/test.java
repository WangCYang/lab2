package mysql;

import java.util.ArrayList;
import java.util.List;

public class test {
	public static void main(String args[]){
		CRUD  crud=new CRUD("bookdb","root","1234");
        /*List<String> l=crud.getALLofBookWithTitle("自然语言处理");
        for(String s:l){
        	    System.out.println(s);
        }  
        String s=crud.getAllofAuthorWithID(10017);
        System.out.println(s);
        System.out.println(crud.deleteBookWithIBSN("978-7-302-30714-3"));*/
		//String s=crud.checkAuthorWithName("左少杰");
		//if(s==""){
		ArrayList<String> l=new ArrayList<String>();
		l.add("978-7-302-30714-0");
		l.add("绝地求生");
		l.add("10023");
		l.add("6005寝室");
		l.add("2017-10-01");
		l.add("21.00");
		 System.out.println(crud.insertBook(l));
		//}else{
			//System.out.println(s);
		//}
   }
}
//add something here for next commit
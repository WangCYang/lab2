package action;

public class firstaction extends com.opensymphony.xwork2.ActionSupport{
	  //ACTION 就是指这样的继承了ActionSupport类的类，内部定义对应的处理方法
     public String execute() throws Exception{
         System.out.println("执行了firstaction");
         return SUCCESS;//struts框架定义的成功视图
     }
}
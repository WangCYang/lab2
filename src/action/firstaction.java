package action;

public class firstaction extends com.opensymphony.xwork2.ActionSupport{
	  //ACTION ����ָ�����ļ̳���ActionSupport����࣬�ڲ������Ӧ�Ĵ�����
     public String execute() throws Exception{
         System.out.println("ִ����firstaction");
         return SUCCESS;//struts��ܶ���ĳɹ���ͼ
     }
}
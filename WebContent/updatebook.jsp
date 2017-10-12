<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书管理-图书更新</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
  <style>
  .mymargin{
    margin-left:20px;
    margin-right:20px;
    margin-bottom:20px;
  }
  .mymargin1{
    margin-right:20px;
  }
  .mysize{
     color:#ff0000;
  }
  </style>
</head>
<body>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<s:url action="refresh" />"><span>图书</span> 管理</a>
		
			</div>
		</div>
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img
					src="http://image.3761.com/attachments/image/2015-08/20150818160852_82043.jpg"
					class="img-responsive" alt="头像">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">游客</div>
				<div class="profile-usertitle-status">
					<span class="indicator label-success"></span>Online
				</div>
			</div>
			<div class="clear"></div>
			<!-- 独成一行 -->
		</div>
		<div class="divider"></div>
		<ul class="nav menu">
			<li><a href="<s:url action="refresh" />"><em
					class="fa fa-home">&nbsp;</em><font class="myfont1">主
						&nbsp&nbsp页</font></a></li>
			<li><a href="querybook.jsp"><em class="fa fa-calendar">&nbsp;</em>
					<font class="myfont1">图 &nbsp书 &nbsp查 &nbsp询 </font></a></li>
			
			<li class="parent active"><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-navicon">&nbsp;</em> <font class="myfont1">图
						&nbsp书 &nbsp更 &nbsp新</font> <span data-toggle="collapse"
					href="#sub-item-1" class="icon pull-right"><em
						class="fa fa-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1" >
					<li><a class="" href="updatebook.jsp"> <span class="fa fa-arrow-right">&nbsp;</span>
							<font class="myfont1">更&nbsp新</font>
					</a></li>
					<li><a class="" href="addbook.jsp"> <span class="fa fa-arrow-right">&nbsp;</span>
							<font class="myfont1">新&nbsp增</font>
					</a></li>
					
				</ul></li>
			<script language="javascript">
				function useless() {
					alert("当前功能未开放！！");
					return true;
				}
			</script>
			<li><a href="#" onclick="return useless()"><em
					class="fa fa-power-off">&nbsp;</em> 用 &nbsp户 &nbsp登 &nbsp录<font
					class="mycolor1">（尚未开放）</font></a></li>
		</ul>
	</div>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="<s:url action="refresh" />">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">主页</li>
			</ol>
		</div><!--/.row-->
		<div class="alert bg-teal" role="alert"><em class="fa fa-lg fa-warning">&nbsp;</em> 图书更新页面展示了以下功能:（选做1）修改（更新）已有图书的信息，包括价格，出版社，出版时间，作者 （选做2）新添加图书（选做3）新添加作者<a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">图书更新</h1>
			</div>
		  </div>
	<!--/.row-->
		
		
	 	
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body tabs">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">图书更新</a></li>
							<li><a href="#tab2" data-toggle="tab">新增图书</a></li>
							<li><a href="#tab3" data-toggle="tab">新增作者</a></li>
						</ul>
						<div class="tab-content">
						    <s:set var="abook" value="selectedbook" scope="request" />
						    <s:set var="flag" value="flag" scope="request" />
						     
								<%
									String s = (String) request.getAttribute("abook");
								    String flag=(String) request.getAttribute("flag");
								%><!-- 哈尔滨工业大学数学系 -->
						 	    
							<div class="tab-pane fade in active" id="tab1">
								<p>输入图书名字并查询可得到信息，修改并提交即可修改图书信息.<font class="mycolor1">注意:ISBN与图书信息禁止修改</font></p>
								<div class="panel-body">
						     <form class="form-horizontal" action="updatebook" method="post" > <!-- onsubmit="return validcheck(this)" -->
							    <fieldset>
								<!-- ISBN input-->
								  <div class="form-group">
									<label class="col-md-3 control-label myfont1" for="isbn">ISBN</label>
									<div class="col-md-9">
										<input id="ISBN" name="isbn" type="text" 
										placeholder="输入ISBN,形如xxx-x-xxx-xxxxx-x" class="form-control">
									</div>
								 </div>
							
								<!--title input-->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="title">书  名</label>
									<div class="col-md-9">
										<input id="title" name="title" type="text" placeholder="书名" class="form-control">
									</div>
								</div>
								
								<!-- author body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="author">作  者</label>
									<div class="col-md-9">
										<input id="author" name="author" type="text" placeholder="作者名" class="form-control">
									</div>
								</div>
								
								<!-- publisher body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="publisher">出 版 社</label>
									<div class="col-md-9">
										<input id="publisher" name="publisher" type="text" placeholder="出版社名" class="form-control">
									</div>
								</div>
								
								<!-- publish date body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="publishdate">出 版 日 期</label>
									<div class="col-md-9">
										<input id="publishdate" name="publishdate" type="text" placeholder="出版日期，形如2017-10-05" class="form-control">
									</div>
								</div>
								
								<!-- price body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="price">价 格</label>
									<div class="col-md-9">
										<input id="price" name="price" type="text" placeholder="价格，形如20.00，单位 ￥ " class="form-control">
									</div>
								</div>
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right" 
										name="submitstate" value="search">Search</button>
										<button type="submit" class="btn btn-default btn-md pull-right mymargin1" 
										name="submitstate" value="submit">Submit</button>
										<button type="reset" class="btn btn-default btn-md pull-left">Reset</button>
									</div>
									
								</div>
							  </fieldset>
						   </form>
						   <script language="javascript">
						      function validcheck2(myform){
				        		 if(myform.isbn.value.length!=17){
				        			 alert("请输入形如xxx-x-xxx-xxxxx-x的图书编号，至少17位（包括四位连字符）");
				        			 myform.isbn.focus();//即设置焦点在对应的元素
					        		 return false;
				        		 }else if(myform.title.value.length==0){
				        			 alert("请输入书名！！");
				        			 myform.title.focus();//即设置焦点在对应的元素
					        		 return false;
				        		 } else if(myform.author.value.length==0){
				        			 alert("请输入作者名！！");
				        			 myform.author.focus();//即设置焦点在对应的元素
					        		 return false;
				        		 } else if(myform.publisher.value.length==0){
				        			 alert("请输入出版商！！");
				        			 myform.publisher.focus();//即设置焦点在对应的元素
					        		 return false;
				        		 } else if(myform.publishdate.value.length==0){
				        			  alert("请输入出版日期！！");
				        			 myform.publishdate.focus();//即设置焦点在对应的元素
					        		 return false;
				        		 }else if(myform.price.value.length==0){
				        			  alert("请输入价格！！");
					        			 myform.price.focus();//即设置焦点在对应的元素
						        	  return false;
					        	 }else{
					        			return true;
					        	 }
				        	 }
						 	     function setupdateform(){
						 	    	s="<%=s%>";
						 	        ss=s.split("|");/* s.split("\\|") */
						 	       /* ss=new Array("sad","ads","sda","sda","asd","sad"); */
						 	    	ipt_isbn = document.getElementById("ISBN");
						 	    	ipt_isbn.value=ss[0];
						 	    	ipt_title= document.getElementById("title");
						 	    	ipt_title.value=ss[1];
						 	    	ipt_author= document.getElementById("author");
						 	    	ipt_author.value=ss[2];
						 	    	ipt_publisher= document.getElementById("publisher");
						 	    	ipt_publisher.value=ss[3];
						 	    	ipt_publishdate= document.getElementById("publishdate");
						 	    	ipt_publishdate.value=ss[4];
						 	    	ipt_price= document.getElementById("price");
						 	    	ipt_price.value=ss[5];
						 	    }
						 	    function checksearch(){
						 	    	if("<%=flag%>"=="correct search"){
						 	    		setupdateform();
						 	    	}
						 	    	else if("<%=flag%>"=="wrong search"){
						 	    		alert("该书不存在！！");
						 	    	}else if("<%=flag%>"=="empty author"){
						 	    		alert("该作者不存在，请先添加该作者");
						 	    	}else if("<%=flag%>"=="wrong update"){
						 	    		alert("更新书籍失败，请重试");
						 	    	}else if("<%=flag%>"=="correct update"){
						 	    		alert("更新书籍成功！！");
						 	    	}else if("<%=flag%>"=="correct add"){
						 	    		alert("添加书籍成功！！");
						 	    	}else if("<%=flag%>"=="wrong add"){
						 	    	     alert("添加书籍失败！！");
						 	    	}else if("<%=flag%>"=="correct addauthor"){
						 	    		 alert("添加作者成功！！");
						 	    	}else if("<%=flag%>"=="wrong addauthor"){
						 	    		 alert("添加作者失败！！");
						 	    	}
						 	    }
						 	   checksearch();
						 	 </script>
					      </div>
						</div>
							<div class="tab-pane fade" id="tab2">
								<p>请输入下列图书信息并添加图书</p>
								<form class="form-horizontal" action="addbook" method="post" onsubmit="return validcheck2(this)"> <!-- onsubmit="return validcheck(this)" -->
							    <fieldset>
								<!-- ISBN input-->
								  <div class="form-group">
									<label class="col-md-3 control-label myfont1" for="isbn">ISBN</label>
									<div class="col-md-9">
										<input name="isbn" type="text" placeholder="输入ISBN,形如xxx-x-xxx-xxxxx-x" class="form-control">
									</div>
								 </div>
							
								<!--title input-->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="title">书  名</label>
									<div class="col-md-9">
										<input  name="title" type="text" placeholder="书名" class="form-control">
									</div>
								</div>
								
								<!-- author body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="author">作  者</label>
									<div class="col-md-9">
										<input  name="author" type="text" placeholder="作者名" class="form-control">
									</div>
								</div>
								
								<!-- publisher body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="publisher">出 版 社</label>
									<div class="col-md-9">
										<input  name="publisher" type="text" placeholder="出版社名" class="form-control">
									</div>
								</div>
								
								<!-- publish date body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="publishdate">出 版 日 期</label>
									<div class="col-md-9">
										<input  name="publishdate" type="text" placeholder="出版日期，形如2017-10-05" class="form-control">
									</div>
								</div>
								
								<!-- price body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="price">价 格</label>
									<div class="col-md-9">
										<input  name="price" type="text" placeholder="价格，形如20.00，单位 ￥ " class="form-control">
									</div>
								</div>
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right" name="addbutton" value="add">
										Add</button>
										<button type="reset" class="btn btn-default btn-md pull-left">Reset</button>
									</div>
									
								</div>
							  </fieldset>
						   </form>
							</div>
							<div class="tab-pane fade" id="tab3">
								<p>请输入作者信息并添加作者</p>
						  <form class="form-horizontal" action="addauthor" method="post" onsubmit="return validcheck1(this)">
							    <fieldset>
								<!-- Authorname input-->
								  <div class="form-group">
									<label class="col-md-3 control-label myfont1" for="isbn">姓 名</label>
									<div class="col-md-9">
										<input name="authorname" type="text" placeholder="输入作者名字" class="form-control">
									</div>
								 </div>
							
								<!--年龄 input-->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="title">年 龄</label>
									<div class="col-md-9">
										<input  name="authorage" type="text" placeholder="年龄" class="form-control">
									</div>
								</div>
								
								<!-- author body -->
								<div class="form-group">
									<label class="col-md-3 control-label myfont1" for="author">国 籍</label>
									<div class="col-md-9">
										<input  name="authorcountry" type="text" placeholder="国 籍" class="form-control">
									</div>
								</div>
								
								<!-- Form actions -->
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right" name="addbutton" 
										value="add">Add</button>
										<button type="reset" class="btn btn-default btn-md pull-left">Reset</button>
									</div>
									
								</div>
							  </fieldset>
						   </form>
						   <script>
						      function validcheck1(myform){
					        		 if(myform.authorname.value.length==0){
					        			 alert("请输入作者名!");
					        			 myform.authorname.focus();//即设置焦点在对应的元素
						        		 return false;
					        		 }else if(myform.authorage.value.length==0){
					        			 alert("请输入年龄！！");
					        			 myform.authorage.focus();//即设置焦点在对应的元素
						        		 return false;
					        		 } else if(myform.authorcountry.value.length==0){
					        			 alert("请输入国籍！！");
					        			 myform.authorcountry.focus();//即设置焦点在对应的元素
						        		 return false;
						        	 }else{
						        			return true;
						        	 }
					        	 }
						      
						   </script>
							</div>
						</div>
					</div>
				</div><!--/.panel-->
			</div><!--/.col-->
		</div><!-- /.row -->
	
			
			<div class="col-sm-12">
				<p class="back-link">Lab2 by 王春阳</p>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	  

<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	
</body>
</html>

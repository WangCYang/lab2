<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书管理-图书查询</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
  <style>
  .mymargin{
    margin-left:20px;
    margin-right:20px;
    margin-bottom:20px;
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
			<li  class="active"><a href="querybook.jsp"><em class="fa fa-calendar">&nbsp;</em>
					<font class="myfont1">图 &nbsp书 &nbsp查 &nbsp询 </font></a></li>
			
			<li class="parent "><a data-toggle="collapse" href="#sub-item-1">
					<em class="fa fa-navicon">&nbsp;</em> <font class="myfont1">图
						&nbsp书 &nbsp更 &nbsp新</font> <span data-toggle="collapse"
					href="#sub-item-1" class="icon pull-right"><em
						class="fa fa-plus"></em></span>
			</a>
				<ul class="children collapse" id="sub-item-1">
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
		<div class="alert bg-teal" role="alert"><em class="fa fa-lg fa-warning">&nbsp;
		</em> 图书查询页面展示了以下功能:（功能1）输入作者名字查询图书;（选做2）点击图书名字，前往查看图书具体信息，并更新图书 
		<a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">图书查询</h1>
			</div>
		  </div>
	<!--/.row-->
		
      
	   <div class="row">
	       <form action="showselectedauthor" method="post">
               <div class="input-group  mymargin"> 
                 <input name="selectedauthor" type="text" class="form-control input-md" 
                 placeholder="请输入作者的名字查询相关图书信息"  list="authorlist"/>
				   <!-- <datalist id="authorlist" style="color:#ff0000" >
						        <option>cnm</option>
						    </datalist> -->
				  <span class="input-group-btn">
				     <input type="submit" class="btn btn-primary btn-md" value="Search">
				  </span>
				</div>
		  </form>
		</div>
		
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						相关图书
						<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span></div>
					<div class="panel-body articles-container">
					   <s:iterator value="selectedbooks" status="st" var="book">
								<s:set var="abook" value="#book" scope="request" />
								<%
									String s = (String) request.getAttribute("abook");
										String[] ss = s.split("\\|");
									    
								%><!-- 哈尔滨工业大学数学系 -->
						   <div class="article border-bottom">
							  <div class="col-xs-12">
								 <div class="row">
									 <div class="col-xs-2 col-md-2 date">
										<div class="large">￥<%=ss[5]%></div>
										<!-- <div class="text-muted">Jun</div> -->
									</div>
									<div class="col-xs-10 col-md-10">
	<!-- 添加一个跳转到更新的action	 --><h4><a href="<s:url action="updatebook"><s:param name="title"><%=ss[1]%>
	                                       </s:param><s:param name="submitstate">search</s:param></s:url>">
	                                                                                  《<%=ss[1]%>》</a></h4>
										<p>作者：<strong><%=ss[2]%></strong>&nbsp&nbsp 该书由<%=ss[3]%>于<%=ss[4]%>出版</p>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div><!--End .article-->
					</s:iterator>
					</div>
				</div><!--End .articles-->
			<div class="col-sm-12">
				<p class="back-link">Lab2 by 王春阳</a></p>
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

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>图书管理-首页</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<style>
.seccolor{
	color:#ff0080;
}
.secfont{
     line-height:20px;
	font-size:16px;
}
.myimage{
   width: 40px;
   height:40px;
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
			<li class="active"><a href="<s:url action="refresh" />"><em
					class="fa fa-home">&nbsp;</em><font class="myfont1">主
						&nbsp&nbsp页</font></a></li>
			<li><a href="querybook.jsp"><em class="fa fa-calendar">&nbsp;</em>
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
			<script>
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
				<li><a href="<s:url action="refresh" />"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">主页</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
		 <div class="alert bg-teal" role="alert"><em class="fa fa-lg fa-warning">&nbsp;</em> 首页展示了以下功能:提供整个图书系统总体的信息；展示所有图书的基本信息；（功能3）删除（包括批删除）图书；（功能2）点击图书展示图书及作者信息 <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>
			<div class="col-lg-12">
				<h1 class="page-header">
					图书总览
					<form id="refresh" action="refresh" class="myfloat1">
						<input type="submit" class="btn btn-md btn-success"
							value="refresh"></input>
					</form>
				</h1>
			</div>
		</div>
		<!--/.row-->
           
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-search color-red"></em>
							<div class="large">
								<s:property value="totalnum" />
							</div>
							<div class="text-muted">图书总数</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-users color-teal"></em>
							<div class="large">
								<s:property value="authornum" />
							</div>
							<div class="text-muted">作者总数</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-comments color-orange"></em>
							<div class="large">
								<s:property value="publishernum" />
							</div>
							<div class="text-muted">出版社总数</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-red panel-widget ">
						<div class="row no-padding">
							<em class="fa fa-xl fa-shopping-cart color-blue"></em>
							<div class="large">
								<s:property value="pricenum" />
							</div>
							<div class="text-muted">图书总价</div>
						</div>
					</div>
				</div>
			</div>
			<!--/.row-->
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						图书目录
						<span
							class="pull-right clickable panel-toggle panel-button-tab-left"><em
							class="fa fa-toggle-up"></em></span>
					</div>
					<div class="panel-body">
						<ul class="todo-list">
							<s:iterator value="booklist" status="st" var="book">
								<s:set var="mybook" value="#book" scope="request" />
								<%
									String s = (String) request.getAttribute("mybook");
										String[] ss = s.split("\\|");
								%>
								<li class="todo-list-item">
									<div class="checkbox">
										<input type="checkbox" name="checkbox-1" value="<%=ss[0]%>"
											onchange="getselectedbook()" /> 
										<label>ISBN:&nbsp <%=ss[0]%></label>&nbsp &nbsp 
										<label><a class="dropdown-toggle count-info" data-toggle="dropdown"
											href="<s:url action="showdetails"/>">《<%=ss[1]%>》</a>
						 <ul class="dropdown-menu dropdown-messages">
							<li>
								<div class="dropdown-messages-box">
								   
		      <!--  放一张图书的图片--><img alt="image" class="img-circle myimage"
                          src="http://mpic.tiankong.com/4c6/3b6/4c63b6daa54b259e01791ab9a4b2e653/640.jpg@360h">
									
									<div class="message-body"><small class="pull-right">￥<%=ss[5]%></small>
									<div><font class="secfont"><strong>《<%=ss[1]%>》</strong><br/><%=ss[0]%></font></div>
									<small class="text-muted seccolor" ><%=ss[3]%>—<%=ss[4]%></small></div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<img alt="image" class="img-circle myimage" 
						src="https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2484490458,2674950783&fm=27&gp=0.jpg">
									
									<div class="message-body"><small class="pull-right">age:<%=ss[7]%></small>
										<div><font class="secfont"><strong><%=ss[2]%></strong><br/><%=ss[6]%></font></div>
									<small class="text-muted seccolor"><%=ss[8]%></small></div>
								</div>
							</li>
						</ul></label> 
										<label><%=ss[2]%></label> &nbsp &nbsp 
										<label><%=ss[3]%></label>
									</div>
									<div class="pull-right action-buttons">
										<a href="<s:url action="remove">
										   <s:param name="selectedbook"><%=ss[0]%></s:param></s:url>" class="trash"> 
										  <em class="fa fa-trash"></em>
										</a>
									</div>
								</li>
							</s:iterator>
						</ul>
					</div>
					<!-- 带按钮的文本框 -->
					<div class="panel-footer">
					 <form action="remove" method="post">
						<div class="input-group">
							   <input id="btn-input" type="text" class="form-control input-md" name="selectedbook"
								placeholder="请输入要删除的书号(多本书间用|隔开)" /><span class="input-group-btn">
							
								<input type="submit" class="btn btn-primary btn-md" value="Delete"/></a>
						
								<script language="javascript">
									function getselectedbook() {
										checkboxes = document
												.getElementsByName("checkbox-1");
										check_val =new Array();
										 for(i=0;i<checkboxes.length;i++){ 
											 if(checkboxes[i].checked)
											check_val.push(checkboxes[i].value);
										}
										text = document
												.getElementById("btn-input");
										text.value = check_val.join("|");
									}
								</script>
							</span>
						</div>
					</form>
					</div>
				</div>
				
		</div>
		<div class="col-sm-12">
			<p class="back-link">
				lab2 by <!-- <a href="https://www.medialoot.com"> -->王春阳</a>
			</p>
		</div>
	</div>
	<!--/.row-->
	</div>
	<!--/.main-->

	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/custom.js"></script>
	<script>
		window.onload = function() {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive : true,
				scaleLineColor : "rgba(0,0,0,.2)",
				scaleGridLineColor : "rgba(0,0,0,.05)",
				scaleFontColor : "#c5c7cc"
			});
		};
	</script>

</body>
</html>
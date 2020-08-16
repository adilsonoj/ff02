<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 		<meta property="creator.productor" content="http://estruturaorganizacional.dados.gov.br/id/unidade-organizacional/41066"> -->
		<title>FF02</title>
		<c:url value="/resources/css" var="cssPath" />
		<c:url value="/resources/js" var="jsPath" />
		<c:url value="/resources/img" var="imgPath" />
		<c:url value="/resources/plugins" var="pluginsPath" />
	
		<script type="text/javascript" src="${jsPath}/jquery-3.5.1.js"></script>
		
		<link rel="stylesheet" type="text/css" href="${cssPath}/govbr_style.css">
		<link rel="stylesheet" type="text/css" href="${cssPath}/govbr_white_style.css">

		<link rel="stylesheet" type="text/css" href="${pluginsPath}/govbr/govbr_footer.css">
		
		<%-- <script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
		<script type="text/javascript" src="${jsPath}/bootstrap-dropdownhover.js"></script>  --%>
		
		<script type="text/javascript" src="${jsPath}/axios.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/vue.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/vue-the-mask.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/moment.js"></script> 
		
		<link rel="stylesheet" type="text/css" href="${cssPath}/fontawesome/fontawesome-all.css">
	
		<script src="${jsPath}/sweetalert2.js"></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/sweetalert2.css">
		
		
		<script type="text/javascript" charset="utf8" src="${jsPath}/dataTable4/jquery.dataTables.min.js"></script>
		<script type="text/javascript" charset="utf8" src="${jsPath}/dataTable4/dataTables.bootstrap4.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/datatable/dataTables.bootstrap4.min.css">
		
 		
		<%-- <script    src="${jsPath}/dataTables.fixedColumns.min.js" ></script> 
		<link rel="stylesheet" type="text/css" href="${cssPath}/fixedColumns.dataTables.min.css"> --%>
		
	<%-- 	<script type="text/javascript" charset="utf8" src="${jsPath}/dataTables.select.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/select.dataTables.min.css"> --%>

		<link rel="stylesheet" type="text/css" href="${cssPath}/custom.css">
		
		<link rel="stylesheet" type="text/css" href="${cssPath}/datatable/bootstrap.css">
		<script type="text/javascript" src="${jsPath}/bootstrap.bundle.js"></script>
		<script type="text/javascript" src="${jsPath}/jsreport.js"></script>
		<script>jsreport.serverUrl = `http://\${window.location.hostname}:8488`</script> 			   
		
	</head>
	
	<body>
	<header role="header" class="smaller" id="header">
	<div class="blog-masthead">
		<!-- Barra Brasil START -->
		<div id="barra-brasil" style="background:#7F7F7F; height: 20px; padding:0 0 0 10px;display:block;">
			<div class="container">
				<ul id="menu-barra-temp" style="list-style:none;">
					<li style="display:inline; float:left;padding-right:10px; margin-right:10px; border-right:1px solid #EDEDED"><a href="http://brasil.gov.br" style="font-family:sans,sans-serif; text-decoration:none; color:white;">Portal do Governo Brasileiro</a></li>
					<li><a style="font-family:sans,sans-serif; text-decoration:none; color:white;" href="http://epwg.governoeletronico.gov.br/barra/atualize.html">Atualize sua Barra de Governo</a></li>
				</ul>
			</div>
		</div>
		<!-- Barra Brasil END -->
	</div>
	<div class="blog-header">
		<div class="container">
			<!-- START container-br -->
			<div class="container-br">
				<!-- START Header Main -->
				<div class="header-main">
					<div class="row">
						<!-- START Site Info -->
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 info">
							<div class="site-info d-flex"> <a title="Início" href="http://www.amrj.mb/" class="logo navbar-btn pull-left"><img alt="Início" src="${imgPath}/amrj_brasao.gif"></a> <a href="http://www.amrj.mb/" class="mt-1">
								<h1 class="site-name">Arsenal de Marinha do Rio de Janeiro</h1>
								</a> </div>
						</div>
						<!-- END Site Info -->
					</div>
				</div>
				<!-- END Header Main -->
			</div>
			<!-- END container-br -->
		</div>
	</div>
</header>
<jsp:include page="menu.jsp"></jsp:include>

<!-- <div id="main" class="container"> -->

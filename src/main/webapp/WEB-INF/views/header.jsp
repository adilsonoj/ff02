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
	
		<script type="text/javascript" src="${jsPath}/datatable_bootstrap3/jquery-3.3.1.js"></script>
		
		<link rel="stylesheet" type="text/css" href="${cssPath}/govbr_style.css">
		<link rel="stylesheet" type="text/css" href="${cssPath}/govbr_white_style.css">

		<link rel="stylesheet" type="text/css" href="${pluginsPath}/govbr/govbr_footer.css">

		<link rel="stylesheet" type="text/css" href="${cssPath}/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${cssPath}/bootstrap-theme.css">
		
		<script type="text/javascript" src="${jsPath}/bootstrap.js"></script>
		<script type="text/javascript" src="${jsPath}/bootstrap-dropdownhover.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/axios.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/vue.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/vue-the-mask.js"></script> 
		
		<script type="text/javascript" src="${jsPath}/moment.js"></script> 
		
		<link rel="stylesheet" type="text/css" href="${cssPath}/fontawesome-free-5.3.1-web/all.min.css">
	
		<script src="${jsPath}/sweetalert2.js"></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/sweetalert2.css">
		
		
		<script type="text/javascript" charset="utf8" src="${jsPath}/jquery.dataTables.min.js"></script>
		<script type="text/javascript" charset="utf8" src="${jsPath}/dataTables.bootstrap.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/dataTables.bootstrap.min.css">
		
 		
		<script    src="${jsPath}/dataTables.fixedColumns.min.js" ></script> 
		<link rel="stylesheet" type="text/css" href="${cssPath}/fixedColumns.dataTables.min.css">
		
		<script type="text/javascript" charset="utf8" src="${jsPath}/dataTables.select.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${cssPath}/select.dataTables.min.css">


		<script type="text/javascript" src="${jsPath}/jsreport.js"></script>
		<script>jsreport.serverUrl = `http://\${window.location.hostname}:8488`</script> 			   

	</head>
	
	<body>
		

<!-- <div id="main" class="container"> -->

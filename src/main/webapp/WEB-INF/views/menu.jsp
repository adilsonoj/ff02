<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-xl navbar-expand-lg navbar-expand-md navbar-light bg-light">
	<div class="container">
		<div class="col-xl-2 col-lg-2 col-md-3 col-sm-12 col-12"> <a class="navbar-brand" href="#">Menu SisAMRJ</a>
			<button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
		</div>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 col-12">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Atividades </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="../dados_consumo/manterDadosConsumo.html">Dados de Consumo</a>
						</div>
					</li>
					<li class="nav-item dropdown"> <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Relatórios </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a class="dropdown-item" href="#">Relatório #1</a> </div>
					</li>
				</ul>
			</div>
			<div class="col-xl-2 col-lg-2 col-md-3 col-sm-12 col-12">
				<ul class="nav navbar-nav justify-content-end">
					<li class="nav-item dropdown" data-toogle="tooltip" data-placement="top" title="Perfil de Acesso"> <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-id-card"></i></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown"> <a href="#" class="dropdown-item"> <small><i class="fas fa-user"></i> Fulano da Silva<br />
							<i class="fas fa-users"></i> Gerente<br />
							<i class="fas fa-map-marker"></i> AMRJ-0000</small> </a> </div>
					</li>
					<li class="nav-item"> <a role="button" aria-haspopup="true" aria-expanded="false" class="nav-link" href="#" data-toggle="tooltip" data-placement="top" title="Ajuda"><i class="far fa-question-circle"></i></a> </li>
					<li class="nav-item"> <a role="button" aria-haspopup="true" aria-expanded="false" class="nav-link" href="#" data-toggle="tooltip" data-placement="top" title="Sair"><i class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
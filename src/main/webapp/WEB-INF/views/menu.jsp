<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> --%>


<div class="col-md-9" id="menu">					
							<div class="navbar-collapse collapse">
<%-- 							<security:authorize access="!hasRole('SENHA_PADRAO') and isAuthenticated()"> --%>
									
									<ul class="nav navbar-nav">
											<li class="dropdown">
											<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Atividades <span class="caret"></span> </a>
												<ul class="dropdown-menu">
<%-- 												<security:authorize access="hasAnyRole('USU_COMTE', 'USU_COMIMSUP', 'USU_CCSUP')"> --%>
													<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Dashboard</a>
														<ul class="dropdown-menu">
															<li><a href="<c:url value="/dashboard/"/>">Entrar</a></li> 
														</ul>
													</li>
<%-- 													</security:authorize> --%>
													<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Pedido de Serviço</a>
														<ul class="dropdown-menu">
<%-- 														<security:authorize access="isAuthenticated()"> --%>
															<li><a href="<c:url value="/ps/consultarPs"/>">Consultar PS</a></li>
<%-- 														</security:authorize> --%>
														</ul>
													</li>
													<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Discriminação de Serviço</a>
														<ul class="dropdown-menu">
<%-- 														<security:authorize access="isAuthenticated()"> --%>
															<li><a href="<c:url value="/ds/consultarDs"/>">Consultar DS</a></li>
<%-- 														</security:authorize> --%>
														</ul>
													</li>
<%-- 													<security:authorize access="hasAnyRole( 'USU_CHEF_DEPT', 'USU_COMTE', 'USU_CCSUP')"> --%>
													<li class="dropdown"><a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Caderno de Serviço</a></li>
<%-- 													</security:authorize> --%>
													
												</ul>
											</ul>
												<ul class="nav navbar-nav">
													<li class="dropdown">
														<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Relat&oacute;rios <span class="caret"></span> </a>
<%-- 														<security:authorize access="isAuthenticated()"> --%>
															<ul class="dropdown-menu">
																<li class="dropdown">
																	<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown" v-on:click="gerarRelatorioUsuario">Usuários Ativos</a>
																</li>
																
																<li class="dropdown">
																	<a href="<c:url value='/ps/manterRelatPs'/>">PS por Projeto</a>
																</li>
															</ul>
<%-- 														</security:authorize> --%>
													</li>
												</ul>
										
												<ul class="nav navbar-nav">
													<li class="dropdown">
														<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Usu&aacute;rio <span class="caret"></span> </a>
														<ul class="dropdown-menu">
															<li class="dropdown">
																<a href="<c:url value="/usuario/alteraSenha"/>">Alterar Senha</a>
															</li>
<%-- 															<security:authorize access="hasRole('CADASTRAR')"> --%>
																<li class="dropdown"><a href="<c:url value="/usuario/manterUsuario"/>">Cadastro de Usu&aacute;rio</a></li>
<%-- 															</security:authorize> --%>
															<li class="dropdown">
																<a href="#" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false" data-hover="dropdown" data-toggle="dropdown">Manual de Usu&aacute;rio</a>
															</li>
														</ul>
													</li>
												</ul>
<%-- 											</security:authorize>  --%>
												<ul class="nav navbar-nav pull-right">
													<li class="dropdown"> 
														<a role="button" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle" href="<c:url value='/logout' />" >Sair</a>
													</li>
												</ul>
							</div>			
</div>
<!doctype html>
<html lang="en">
<head>
<!-- CSS only -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<script src="../../plugins/w3data.js"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>FF02 - Gestão de Faturamento</title>

<!-- EXCLUIR DA VERSÃO FINAL -->
<!-- Bootstrap Dropdown Hover CSS -->
<!--<link rel="stylesheet" type="text/css" href="plugins/excluir/govbr_bar.css">-->
<link rel="stylesheet" type="text/css" href="../../plugins/excluir/govbr_style.css">
<link rel="stylesheet" type="text/css" href="../../plugins/excluir/govbr_white_style.css">
<!-- EXCLUIR DA VERSÃO FINAL -->

<!-- GOVBR Rodapé -->
<link rel="stylesheet" type="text/css" href="../../plugins/govbr/govbr_footer.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="../../node_modules/bootstrap/dist/css/bootstrap.css">

<!----------------------------------------------------->
<!------- Inserir CSS adicionais a partir daqui ------->
<!----------------------------------------------------->

<link rel="stylesheet" type="text/css" href="../../plugins/custom.css">

<!--  Font-Awesome -->
<link rel="stylesheet" type="text/css" href="../../plugins/fontawesome-free/web-fonts-with-css/css/fontawesome-all.css">

<!--  Sweetalert -->
<link rel="stylesheet" type="text/css" href="../../node_modules/sweetalert2/dist/sweetalert2.css">

<!-- START DataTable -->
<!--<link type="text/css" rel="stylesheet" href="../../node_modules/datatables.net-dt/css/jquery.dataTables.css">-->
<link type="text/css" rel="stylesheet" href="../../node_modules/datatables.net-bs4/css/dataTables.bootstrap4.css">
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
							<div class="site-info d-flex"> <a title="Início" href="http://www.amrj.mb/" class="logo navbar-btn pull-left"><img alt="Início" src="../../plugins/excluir/amrj_brasao.gif"></a> <a href="http://www.amrj.mb/" class="mt-1">
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
<main id="main" role="main">
	<div class="container-fluid">

        <form novalidate role="form">
			<div id="incluir" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="incluirLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
						</div>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">FF02 - Gestão de Faturamento</a></li>
								<li class="breadcrumb-item"><a href="#">Unidades de Consumo</a></li>
								<li class="breadcrumb-item active" aria-current="page">Incluir</li>
							</ol>
						</nav>
						<div class="modal-body">
							<div class="form-row">
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Tipo</label>
                                          </div>
                                          <select class="custom-select" id="inputGroupSelect01">
                                            <option selected>Selecione...</option>
                                            <option value="1">Tipo 1</option>
                                            <option value="2">Tipo 2</option>
                                            <option value="3">Tipo 3</option>
                                          </select>
                                        </div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend"> <span class="input-group-text">Descrição</span> </div>
											<input type="text" class="form-control text-center" />
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Cliente</label>
                                          </div>
                                          <select class="custom-select" id="inputGroupSelect01">
                                            <option selected>Selecione...</option>
                                            <option value="1">Nome 1</option>
                                            <option value="2">Nome 2</option>
                                            <option value="3">Nome 3</option>
                                          </select>
                                        </div>
									</div>
								</div>
                            	<!-- -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-sm btn-secondary" onClick="incluir()">Salvar</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
        <!-- modal editar -->
		<form novalidate role="form">
			<div id="editar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editarLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
						</div>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">FF02 - Gestão de Faturamento</a></li>
								<li class="breadcrumb-item"><a href="#">Unidades de Consumo</a></li>
								<li class="breadcrumb-item active" aria-current="page">Editar</li>
							</ol>
						</nav>
						<div class="modal-body">
							<div class="form-row">
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Tipo</label>
                                          </div>
                                          <select class="custom-select" id="inputGroupSelect01">
                                            <option selected>Selecione...</option>
                                            <option value="1">Tipo 1</option>
                                            <option value="2">Tipo 2</option>
                                            <option value="3">Tipo 3</option>
                                          </select>
                                        </div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend"> <span class="input-group-text">Descrição</span> </div>
											<input type="text" class="form-control text-center" />
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Cliente</label>
                                          </div>
                                          <select class="custom-select" id="inputGroupSelect01">
                                            <option selected>Selecione...</option>
                                            <option value="1">Nome 1</option>
                                            <option value="2">Nome 2</option>
                                            <option value="3">Nome 3</option>
                                          </select>
                                        </div>
									</div>
								</div>
                            	<!-- -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-sm btn-secondary" onClick="editar()">Salvar</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>
        <!-- modal Visualizar -->
		<form novalidate role="form">
			<div id="visualizar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="visualizarLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
						</div>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">FF02 - Gestão de Faturamento</a></li>
								<li class="breadcrumb-item"><a href="#">Unidades de Consumo</a></li>
								<li class="breadcrumb-item active" aria-current="page">Visualizar</li>
							</ol>
						</nav>
						<div class="modal-body">
							<div class="form-row">
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend"> <span class="input-group-text">Tipo</span> </div>
                                          <input type="text" class="form-control" readonly />
                                        </div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend"> <span class="input-group-text">Descrição</span> </div>
											<input type="text" class="form-control text-center" readonly />
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<div class="input-group mb-3">
                                          <div class="input-group-prepend"> <span class="input-group-text">Cliente</span> </div>
                                          <input type="text" class="form-control" readonly />
                                        </div>
									</div>
								</div>
                            	<!-- -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                </div>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</form>

        <div class="row text-center mt-3">
			<div class="col-md-12">
				<h1>FF02 - Gestão de Faturamento</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h2 class="border-bottom pb-2">Unidades de Consumo<span class="float-right float-md-right float-sm-right mt-1" data-toggle="tooltip" data-container="body" data-placement="top" title="Incluir" role="tooltip">
					<button type="button" class="btn btn-primary btn-sm btn-toolbar" data-toggle="modal" data-target="#incluir" aria-expanded="true"> <i class="fas fa-plus"></i> </button>
					</span> </h2>
			</div>
		</div>
        <div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"><br />
            	<button type="button" class="btn btn-secondary btn-sm mb-1" data-toggle="tooltip" data-placement="top" title="Visualizar Inativos">Visualizar Inativos</button>
				<table id="tblUC" class="table table-responsive table-sm table-hover display nowrap">
					<thead>
						<tr>
							<th class="col-md-2 text-center">Tipo</th>
              <th class="col-md-2 text-center">Descrição</th>
							<th class="col-md-4 text-center">Cliente</th>
							<th class="col-md-1 text-center">&nbsp;</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th class="text-center">Tipo</th>
							<th class="text-center">Descrição</th>
							<th class="text-center">Cliente</th>
							<th class="text-center invisible">&nbsp;</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="align-middle">Tipo por extenso</td>
              <td class="align-middle">Descrição por extenso</td>
							<td class="align-middle">Nome Cliente por extenso</td>
							<td class="text-center actions d-flex justify-content-center">
                            	<span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Visualizar"><button type="button" data-href="#" data-toggle="modal" data-target="#visualizar" class="btn btn-success btn-sm btn-toolbar"><i class="fas fa-eye"></i></button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-toggle="modal" data-target="#editar"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
								</span></td>
						</tr>


					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
</main>

<!-- FOOTER COMEÇA AQUI -->
<footer class="footer">
	<div id="footer-brasil"></div>
</footer>
<!-- FOOTER TERMINA AQUI -->

<!----------------------------------------------------->
<!------------- Bootstrap core JavaScript ------------->
<!--------- Placed at the end of the document --------->
<!-------------- so the pages load faster ------------->
<!----------------------------------------------------->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script type="text/javascript" src="../../node_modules/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="../../node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>

<!----------------------------------------------------->
<!----- Inserir SCRIPTS adicionais a partir daqui ----->
<!----------------------------------------------------->

<!-- Boostrap Tooltip -->
<script type="text/javascript">
			$(function () {
				$('body').tooltip({
					selector: '[data-toggle="tooltip"]'
				})
			})
		</script>

<!--  Sweetalert -->
<script src="../../node_modules/sweetalert2/dist/sweetalert2.js"></script>

<!----------------------------------------------------->
<!----- Inserir SCRIPTS adicionais a partir daqui ----->
<!----------------------------------------------------->

<!--  Vue -->
<script type="text/javascript" src="plugins/vue/dist/vue.min.js"></script>

<!--  Bootstrap-Vue -->
<script src="plugins/bootstrap-vue/dist/bootstrap-vue.min.js"></script>

<!--  Vue-The-Mask / V-Money -->
<script src="plugins/vue-the-mask-master/dist/vue-the-mask.js"></script>
<script src="plugins/v-money-master/dist/v-money.js"></script>

<!--  Vuelidate -->
<script src="plugins/vuelidate-master/dist/vuelidate.min.js"></script>
<script>Vue.use(window.vuelidate.default)</script>
<script src="plugins/vuelidate-master/dist/validators.min.js"></script>
<script>
			window.app = new Vue({
				el: '#main',
				data: {
					menus: [
						{
							text: 'Atividades',
							areas: [
								{href: '#', text: 'Opção'}
							]
						},
						{
							text:'Relatórios',
							areas: [
								{href: '#', text: 'Opção'}
							]
						}
					],
					turma: "",
					date: "",
				},
				validations: {
					turma: {
						required: validators.required,
						minLength: validators.minLength(5)
					},
					date: {
						required: validators.required,
						minLength: validators.minLength(9)
					},
				},
				directives: {money: VMoney}
			});
		</script>

<!-- START DataTable -->
<script type="text/javascript" charset="utf8" src="../../node_modules/datatables.net/js/jquery.dataTables.js"></script>
<script type="text/javascript" charset="utf8" src="../../node_modules/datatables.net-bs4/js/dataTables.bootstrap4.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// Setup - add a text input to each footer cell
		$('#tblUC tfoot th').each( function () {
			var title = $(this).text();
			$(this).html( '<input type="text" class="form-control" style="width:100%;" placeholder="Pesquisar '+title+'" />' );
		} );

		// DataTable Manter
		$('#tblUC').DataTable({
			"dom": "flr<'table't<'text-center'i<'pagination justify-content-center'p>>>",
			"bProcessing": false,
			"bServerSide": false,
			"iDisplayLength" : 10,
			"bLengthChange": false,
			"bFilter": false,
			"bSort": true,
			"columnDefs": [
				{"targets": 5, "orderable": false}
			],
			"sPaginationType": "full_numbers",
			"oLanguage": {
				"sLengthMenu": "Mostrar _MENU_ Grupo de Condução por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>«</span>",
					"sLast": "<span aria-hidden='true'>»</span>",
					"sPrevious": "<span aria-hidden='true'>‹</span>",
					"sNext": "<span aria-hidden='true'>›</span>"
				}
			}
		});

		// Apply the search
		table.columns().every( function () {
			var that = this;

			$( 'input', this.footer() ).on( 'keyup change', function () {
				if ( that.search() !== this.value ) {
					that
						.search( this.value )
						.draw();
				}
			} );
		} );

		// DataTable Incluir
		$('#tblUCIncluir').DataTable({
			"dom": "flr<'table't<'text-center'i<'pagination justify-content-center'p>>>",
			"bProcessing": false,
			"bServerSide": false,
			"iDisplayLength" : 10,
			"bLengthChange": false,
			"bFilter": false,
			"bSort": true,
			"columnDefs": [
				{"targets": 5, "orderable": false}
			],
			"sPaginationType": "full_numbers",
			"oLanguage": {
				"sLengthMenu": "Mostrar _MENU_ Grupo de Condução por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>«</span>",
					"sLast": "<span aria-hidden='true'>»</span>",
					"sPrevious": "<span aria-hidden='true'>‹</span>",
					"sNext": "<span aria-hidden='true'>›</span>"
				}
			}
		});

		// DataTable Editar
		$('#tblUCEditar').DataTable({
			"dom": "flr<'table't<'text-center'i<'pagination justify-content-center'p>>>",
			"bProcessing": false,
			"bServerSide": false,
			"iDisplayLength" : 10,
			"bLengthChange": false,
			"bFilter": false,
			"bSort": true,
			"columnDefs": [
				{"targets": 5, "orderable": false}
			],
			"sPaginationType": "full_numbers",
			"oLanguage": {
				"sLengthMenu": "Mostrar _MENU_ Grupo de Condução por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>«</span>",
					"sLast": "<span aria-hidden='true'>»</span>",
					"sPrevious": "<span aria-hidden='true'>‹</span>",
					"sNext": "<span aria-hidden='true'>›</span>"
				}
			}
		});

		// DataTable Visualizar
		$('#tblUCVisual').DataTable({
			"dom": "flr<'table't<'text-center'i<'pagination justify-content-center'p>>>",
			"bProcessing": false,
			"bServerSide": false,
			"iDisplayLength" : 10,
			"bLengthChange": false,
			"bFilter": false,
			"bSort": true,
			"columnDefs": false,
			"sPaginationType": "full_numbers",
			"oLanguage": {
				"sLengthMenu": "Mostrar _MENU_ Grupo de Condução por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>«</span>",
					"sLast": "<span aria-hidden='true'>»</span>",
					"sPrevious": "<span aria-hidden='true'>‹</span>",
					"sNext": "<span aria-hidden='true'>›</span>"
				}
			}
		});

	} );
</script>

<!-- SweetAlert -->
<script type="text/javascript">
			function salvar(){
				swal({
					title: 'Tem certeza?',
					text: 'Confirme os dados antes da inclusão!',
					type: 'warning',
					showCancelButton: true,
					/*confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',*/
					confirmButtonText: 'Sim, inclua!',
					cancelButtonText: 'Não, cancele!',
					confirmButtonClass: 'btn btn-outline-success',
					cancelButtonClass: 'btn btn-outline-danger',
					buttonsStyling: false
				}).then(function () {
					$('#incluir').modal('hide')
					swal(
					'Salvo!',
					'A inclusão foi realizada com sucesso!',
					'success'
					)
				}, function (dismiss) {
					// dismiss can be 'cancel', 'overlay',
					// 'close', and 'timer'
					if (dismiss === 'cancel') {
						swal(
							'Cancelado',
							'Nenhuma inclusão foi realizada.',
							'error'
						)
					}
				})
			};
			function editar(){
				swal({
					title: 'Tem certeza?',
					text: 'Confirme os dados antes da edição!',
					type: 'warning',
					showCancelButton: true,
					/*confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',*/
					confirmButtonText: 'Sim, edite!',
					cancelButtonText: 'Não, cancele!',
					confirmButtonClass: 'btn btn-outline-success',
					cancelButtonClass: 'btn btn-outline-danger',
					buttonsStyling: false
				}).then(function () {
					$('#editar').modal('hide')
					swal(
					'Salvo!',
					'A edição foi realizada com sucesso!',
					'success'
					)
				}, function (dismiss) {
					// dismiss can be 'cancel', 'overlay',
					// 'close', and 'timer'
					if (dismiss === 'cancel') {
						swal(
							'Cancelado',
							'Nenhuma edição foi realizada.',
							'error'
						)
					}
				})
			};
			function excluir(){
				swal({
					title: 'Tem certeza?',
					text: 'Confirme os dados antes da exclusão!',
					type: 'warning',
					showCancelButton: true,
					/*confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',*/
					confirmButtonText: 'Sim, exclua!',
					cancelButtonText: 'Não, cancele!',
					confirmButtonClass: 'btn btn-outline-success',
					cancelButtonClass: 'btn btn-outline-danger',
					buttonsStyling: false
				}).then(function () {
					swal(
					'Salvo!',
					'A exclusão foi realizada com sucesso!',
					'success'
					)
				}, function (dismiss) {
					// dismiss can be 'cancel', 'overlay',
					// 'close', and 'timer'
					if (dismiss === 'cancel') {
						swal(
							'Cancelado',
							'Nenhuma exclusão foi realizada.',
							'error'
						)
					}
				})
			};
		</script>

<!-- Barra do Governo -->
<script type="text/javascript" src="../../plugins/govbr/barra.js"></script>

<!-- EXCLUIR DA VERSÃO FINAL -->
<!-- Include HTML -->
<script>
	w3IncludeHTML();
</script>
<script>
	function voltar() {
		window.history.back();
	}
</script>

<!-- EXCLUIR DA VERSÃO FINAL -->
</body>
</html>

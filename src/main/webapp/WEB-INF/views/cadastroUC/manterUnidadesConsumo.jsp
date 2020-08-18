<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/resources/js" var="jsPath" />
<jsp:include page="../header.jsp"></jsp:include>

<main id="main" role="main">
	<div class="container-fluid">
		
        <div class="row text-center mt-3">
			<div class="col-md-12">
				<h1>FF02 - Gestão de Faturamento</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h2 class="border-bottom pb-2">Unidades de Consumo<span class="float-right float-md-right float-sm-right mt-1" data-toggle="tooltip" data-container="body" data-placement="top" title="Incluir" role="tooltip">
					<button type="button"  class="btn btn-primary btn-sm btn-toolbar" data-toggle="modal" data-target="#incluir" aria-expanded="true"> <i class="fas fa-plus"></i> </button>
					</span> </h2>
			</div>
		</div>
        <div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"><br />
            	<button type="button" class="btn btn-secondary btn-sm mb-1" data-toggle="tooltip" data-placement="top" title="Visualizar Inativos">Visualizar Inativos</button>
				<table id="tblUC" class="table table-responsive table-sm table-hover display nowrap">
					<thead>
						<tr>
							<th class="col-md-2 text-center">Tipo de Unidade de Consumo</th>
                            <th class="col-md-2 text-center">DescriÃ§Ã£o</th>
							<th class="col-md-2 text-center">ID</th>
							<th class="col-md-4 text-center">Cliente</th>
                            <th class="col-md-1 text-center">Status</th>
							<th class="col-md-1 text-center">&nbsp;</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th class="text-center">Tipo de Unidade de Consumo</th>
                            <th class="text-center">DescriÃ§Ã£o</th>
							<th class="text-center">ID</th>
							<th class="text-center">Cliente</th>
                            <th class="text-center">Status</th>
							<th class="text-center invisible">&nbsp;</th>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td class="align-middle">Tipo por extenso</td>
                            <td class="align-middle">DescriÃ§Ã£o por extenso</td>
							<td class="text-center align-middle">00</td>
							<td class="align-middle">Nome Cliente por extenso</td>
                            <td class="align-middle">Status por extenso</td>
							<td class="text-center actions d-flex justify-content-center">
                            	<span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Visualizar"><button type="button" data-href="#" data-toggle="modal" data-target="#visualizar" class="btn btn-success btn-sm btn-toolbar"><i class="fas fa-eye"></i></button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-toggle="modal" data-target="#editar"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
								</span></td>
						</tr>
						
						
					</tbody>
				</table>
			</div>
		</div>
	</div>



<!-- footer -->

<!-- MODAIS -->
<!-- incluir -->
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
                                  <select class="custom-select" v-model="cdTipoUnidCons"  id="inputGroupSelect01">
                                    <option value='' selected>Selecione...</option>
                                    <option v-for="tipo in tipoUc" v-bind:value="tipo.cdTipoUnidCons">{{tipo.deTipoUnidCons}}</option>
                                    
                                  </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6 col-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-prepend"> <span class="input-group-text">Descrição</span> </div>
                                    <input type="text" v-model="deUnidCons" class="form-control text-center" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                  <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01">Cliente</label>
                                  </div>
                                  <select class="custom-select"  v-model="idClieCap" id="inputGroupSelect01">
                                    <option value='' selected>Selecione...</option>
                                    <option v-for="cliente in clientes" v-bind:value="cliente.idClieCap">{{cliente.deClieCap}}</option>
                                  </select>
                                </div>
                            </div>
                        </div>
                        <!-- -->
<!--                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"> -->
<!--                             <table id="tblUCIncluir" class="table table-responsive table-sm table-hover display nowrap"> -->
<!--                                 <thead> -->
<!--                                     <tr> -->
<!--                                         <th class="col-md-2 text-center">MÃªs</th> -->
<!--                                         <th class="col-md-2 text-center">Ano</th> -->
<!--                                         <th class="col-md-2 text-center">Dias Atracado</th> -->
<!--                                         <th class="col-md-2 text-center">Dias Docado</th> -->
<!--                                         <th class="col-md-2 text-center">Dias no MÃªs</th> -->
<!--                                         <th class="col-md-2 text-center">&nbsp;</th> -->
<!--                                     </tr> -->
<!--                                 </thead> -->
<!--                                 <tbody> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">0000</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center align-middle">00</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button> -->
<!--                                             </span></td> -->
<!--                                     </tr> -->
<!--                                     <tr> -->
<!--                                         <td class="text-center align-middle"> -->
<!--                                             <select class="form-control form-control-sm text-center"> -->
<!--                                                 <option value="1">00</option> -->
<!--                                                 <option value="2">11</option> -->
<!--                                             </select> -->
<!--                                         </td> -->
<!--                                         <td class="text-center align-middle"> -->
<!--                                             <select class="form-control form-control-sm text-center"> -->
<!--                                                 <option value="1">0000</option> -->
<!--                                                 <option value="2">1111</option> -->
<!--                                             </select> -->
<!--                                         </td> -->
<!--                                         <td class="text-center align-middle"><input type="text" placeholder="00" class="form-control form-control-sm text-center"></td> -->
<!--                                         <td class="text-center align-middle"><input type="text" placeholder="00" class="form-control form-control-sm text-center"></td> -->
<!--                                         <td class="text-center align-middle">&nbsp;</td> -->
<!--                                         <td class="text-center actions d-flex justify-content-center"> -->
<!--                                             <span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Incluir"><button type="button" data-href="#" onclick="salvar()" class="btn btn-primary btn-sm btn-toolbar"><i class="fas fa-plus"></i></button></span> -->
<!--                                         </td> -->
<!--                                     </tr> -->
<!--                                 </tbody> -->
<!--                             </table> -->
<!--                         </div> -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" @Click="incluir()">Salvar</button>
                </div>
            </div>
            <!-- /.modal-content --> 
        </div>
    </div>
</form>
<!-- editar -->
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
                                    <div class="input-group-prepend"> <span class="input-group-text">ID</span> </div>
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
                            <table id="tblUCEditar" class="table table-responsive table-sm table-hover display nowrap">
                                <thead>
                                    <tr>
                                        <th class="col-md-2 text-center">MÃªs</th>
                                        <th class="col-md-2 text-center">Ano</th>
                                        <th class="col-md-2 text-center">Dias Atracado</th>
                                        <th class="col-md-2 text-center">Dias Docado</th>
                                        <th class="col-md-2 text-center">Dias no MÃªs</th>
                                        <th class="col-md-2 text-center">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="Editar" role="tooltip"><button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar" data-target="#"> <i class="fas fa-pencil-alt"></i> </button></span> &nbsp; <span data-toggle="tooltip" data-container="body" data-placement="top" title="Excluir" role="tooltip"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onClick="excluir()"> <i class="far fa-trash-alt"></i> </button>
                                            </span></td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">
                                            <select class="form-control form-control-sm text-center">
                                                <option value="1">00</option>
                                                <option value="2">11</option>
                                            </select>
                                        </td>
                                        <td class="text-center align-middle">
                                            <select class="form-control form-control-sm text-center">
                                                <option value="1">0000</option>
                                                <option value="2">1111</option>
                                            </select>
                                        </td>
                                        <td class="text-center align-middle"><input type="text" placeholder="00" class="form-control form-control-sm text-center"></td>
                                        <td class="text-center align-middle"><input type="text" placeholder="00" class="form-control form-control-sm text-center"></td>
                                        <td class="text-center align-middle">&nbsp;</td>
                                        <td class="text-center actions d-flex justify-content-center">
                                            <span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Incluir"><button type="button" data-href="#" onclick="salvar()" class="btn btn-primary btn-sm btn-toolbar"><i class="fas fa-plus"></i></button></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" onClick="editar()"  class="btn btn-sm btn-secondary" >Salvar</button>
                </div>
            </div>
            <!-- /.modal-content --> 
        </div>
    </div>
</form>
<!-- Visualizar -->
<form novalidate role="form">
    <div id="visualizar" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="visualizarLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                </div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
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
                                    <div class="input-group-prepend"> <span class="input-group-text">ID</span> </div>
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
                            <table id="tblUCVisual" class="table table-sm table-hover display nowrap">
                                <thead>
                                    <tr>
                                        <th class="col-md-2 text-center">MÃªs</th>
                                        <th class="col-md-2 text-center">Ano</th>
                                        <th class="col-md-2 text-center">Dias Atracado</th>
                                        <th class="col-md-2 text-center">Dias Docado</th>
                                        <th class="col-md-2 text-center">Dias no MÃªs</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">0000</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                        <td class="text-center align-middle">00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content --> 
        </div>
    </div>
</form>

</main>
<script type="text/javascript" src="${jsPath}/custom/manterUC.js"></script>

<!-- datatable -->
<script type="text/javascript">
var table;
	$(document).ready(function() {
		// Setup - add a text input to each footer cell
		$('#tblUC tfoot th').each( function () {
			var title = $(this).text();
			$(this).html( '<input type="text" class="form-control" style="width:100%;" placeholder="Pesquisar '+title+'" />' );
		} );
			 
		// DataTable Manter
		table = $('#tblUC').DataTable({
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
				"sLengthMenu": "Mostrar _MENU_ Grupo de ConduÃ§Ã£o por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>&laquo;</span>",
					"sLast": "<span aria-hidden='true'>&raquo;</span>",
					"sPrevious": "<span aria-hidden='true'>&lsaquo;</span>",
					"sNext": "<span aria-hidden='true'>&rsaquo;</span>"
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
				"sLengthMenu": "Mostrar _MENU_ Grupo de ConduÃ§Ã£o por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>&laquo;</span>",
					"sLast": "<span aria-hidden='true'>&raquo;</span>",
					"sPrevious": "<span aria-hidden='true'>&lsaquo;</span>",
					"sNext": "<span aria-hidden='true'>&rsaquo;</span>"
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
				"sLengthMenu": "Mostrar _MENU_ Grupo de ConduÃ§Ã£o por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>&laquo;</span>",
					"sLast": "<span aria-hidden='true'>&raquo;</span>",
					"sPrevious": "<span aria-hidden='true'>&lsaquo;</span>",
					"sNext": "<span aria-hidden='true'>&rsaquo;</span>"
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
				"sLengthMenu": "Mostrar _MENU_ Grupo de ConduÃ§Ã£o por pagina",
				"sSearch": "Pesquisa (qualquer coluna):",
				"sZeroRecords": " ",
				"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ .",
				"sInfoEmpty": "Mostrando 0 a 0 de 0 DOC",
				"sInfoFiltered": "(filtrado de _MAX_ total.)",
				"oPaginate": {
					"sFirst": "<span aria-hidden='true'>&laquo;</span>",
					"sLast": "<span aria-hidden='true'>&raquo;</span>",
					"sPrevious": "<span aria-hidden='true'>&lsaquo;</span>",
					"sNext": "<span aria-hidden='true'>&rsaquo;</span>"
				}
			}
		});
		
	} );
</script> 

<jsp:include page="../footer.jsp"></jsp:include>
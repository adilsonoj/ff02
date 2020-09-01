<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="app">
<main id="main" role="main">
  <div class="container-fluid">
    
    <div class="row text-center mt-3">
      <div class="col-md-12">
        <h1>FF02 - GestÃ£o de Faturamento</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <h2 class="border-bottom pb-2">Fatura <span class="float-right float-md-right float-sm-right mt-1" data-toggle="tooltip" data-container="body" data-placement="top" title="Incluir" role="tooltip">
          <button type="button" class="btn btn-primary btn-sm btn-toolbar" @click="abreIncluir" aria-expanded="true"> <i class="fas fa-plus"></i> </button>
          </span> </h2>
      </div>
    </div>
    <div class="row">
    	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        	 	<!-- tabela financeira -->
                <table id="tblFatura" class="table table-sm display nowrap">
                  <thead>
                  	<tr>
                      <th class="text-center" colspan="2">&nbsp;</th>
                      <th class="text-center" colspan="2">Energia</th>
                      <th class="text-center" colspan="2">Tarifas</th>
                      <th class="text-center" colspan="6">&nbsp;</th>
                    </tr>
                    <tr>
                      <th class="col-md-1 text-center">MÃªs / Ano</th>
                      <th class="col-md-1 text-center">ParÃ¢metro</th>
                      <th class="col-md-1 text-center">Ponta</th>
                      <th class="col-md-1 text-center">Fora Ponta</th>
                      <th class="col-md-1 text-center">Ponta</th>
                      <th class="col-md-1 text-center">Fora Ponta</th>
                      <th class="col-md-1 text-center">Encargos</th>
                      <th class="col-md-2 text-center">Total</th>
                      <th class="col-md-1 text-center">&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody  v-for="fatura of faturas" :key="fatura.cdFatr">
                    <!--linha 1-->
                    <tr bgcolor="#f8f9fa">
                      <td class="align-middle text-center" rowspan="3"><a href="#" data-toggle="modal" data-target="#mesano">{{fatura.cdFatr}}</a></td>
                    </tr>
                    <tr bgcolor="#f8f9fa">
                      <td class="text-center align-middle"><a href="#" data-toggle="modal" data-target="#consumo">Consumo</a></td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle" rowspan="2"><a href="#" data-toggle="modal" data-target="#encargos">R$ 000.000,00</a></td>
                      <td class="text-right align-middle" rowspan="3">R$ 000.000,00</td>
                      <td class="text-center align-middle d-flex justify-content-center"><span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Excluir"><button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar" onclick="excluir()"> <i class="far fa-trash-alt"></i> </button>
								</span></td>
                    </tr>
                    <tr bgcolor="#f8f9fa">
                      <td class="text-center align-middle"><a href="#" data-toggle="modal" data-target="#demanda">Demanda</a></td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                      <td class="text-right align-middle">R$ 000.000,00</td>
                    </tr>
                  </tbody>
                </table>
			</div>
			<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1 col-1 offset-5">
                <div  class="dataTables_paginate paging_full_numbers">
                    <ul class="pagination">
                        <li class="paginate_button page-item first " :class="paginacao.atual == 1 ? 'disabled' : ''"><a @click="primeira" data-dt-idx="0" tabindex="0" class="page-link"><span aria-hidden="true">&laquo;</span></a></li>
                        <li class="paginate_button page-item previous " :class="paginacao.atual == 1 ? 'disabled' : ''"><a @click="anterior" data-dt-idx="1" tabindex="0" class="page-link"><span aria-hidden="true">&lsaquo;
                        </span></a></li>
                        <li class="paginate_button page-item active" ><a href="#" data-dt-idx="2" tabindex="0" class="page-link">{{paginacao.atual}}</a></li>
                        <li class="paginate_button page-item next " :class="paginacao.atual == paginacao.paginas  ? 'disabled' : ''"><a @click="proximo" data-dt-idx="3" tabindex="0" class="page-link"><span aria-hidden="true">&rsaquo;</span></a></li>
                        <li class="paginate_button page-item last " :class="paginacao.atual == paginacao.paginas ? 'disabled' : ''"><a @click="ultima" data-dt-idx="4" tabindex="0" class="page-link"><span aria-hidden="true"> &raquo;</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- footer -->

<!-- MODAIS -->
<!-- modal INCLUIR -->
    <form  role="form" @submit.prevent="inclui">
        <div id="incluir" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="incluirLabel" aria-hidden="true">
            <div class="modal-dialog"  role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                    </div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
                            <li class="breadcrumb-item"><a href="#">Fatura</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Incluir</li>
                        </ol>
                    </nav>
                    <div class="modal-body">
                    	<ul class="nav nav-tabs">
                          <li class="nav-item">
                            <a class="nav-link active" @click="aba = 'mesanoTab'">MÃªs / Ano</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" v-on:click="aba = 'consumoTab'">Consumo</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" v-on:click="aba = 'demandaTab'">Demanda</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" v-on:click="aba = 'encargosTab'">Encargos</a>
                          </li>
                        </ul>
                        <!-- mes / ano -->
                        <div id="mesanoTab" v-show="aba == 'mesanoTab'">
                            <div class="form-row mt-3">
                                
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">PerÃ­odo</span> </div>
                                            <input type="text" class="form-control text-center" placeholder="00/0000" v-model="dtIni" required/>
                                            <div class="input-group-prepend"> <span class="input-group-text">a</span> </div>
                                            <input type="text" class="form-control text-center" placeholder="00/0000" v-model="dtFim" required/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- consumo -->
                       	<div id="consumoTab" v-show="aba == 'consumoTab'">
                            <div class="form-row mt-1">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <h5 class="page-header"><strong>Valor</strong></h5>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <h5 class="page-header"><strong>Tarifa</strong></h5>
                                </div>
                                <!-- -->
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancConsPont"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancTarifPont"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- -->
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancConsForaPont"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancTarifForaPont"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- demanda -->
                        <div id="demandaTab" v-show="aba == 'demandaTab'">
                            <div class="form-row mt-3">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancDemPont"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancDemForaPont" />
                                        </div>
                                    </div>
                                </div>
                                <!-- -->
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">

                                            <div class="input-group-prepend"> <span class="input-group-text">Contratada</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancDemContr"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend"> <span class="input-group-text">Tarifa</span> </div>
                                            <input type="text" class="form-control text-right" placeholder="000.000,00" v-model="vlLancDemTari"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- encargos -->
                        <div id="encargosTab" v-show="aba == 'encargosTab'">
                            <div class="form-row mt-1">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                  <table id="tblEncargos2" class="table table-sm table-hover">
                                    <thead>
                                      <tr>
                                        <th class="col-xl-6 col-lg-6 col-md-6 col-sm6 col-6 text-center">Encargo</th>
                                        <th class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 text-center">Valor</th>
                                        <th class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2"></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                        	<select class="form-control form-control-sm" v-model="encargo">
	                                            <option disabled value="">Selecione...</option>
	                                            <option v-for="tipo in tipoEncargo" :value="tipo">{{tipo.deTipoLanc}}</option>
                                        	</select>
                                        </td>
                                        <td>
                                        	<input type="text" v-model="vlLanc" class="form-control form-control-sm">
                                        </td>
                                        <td class="d-flex justify-content-center"><span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Adicionar">
                                          <button type="button" @click="adicionaEncargo" class="btn btn-success btn-sm btn-toolbar"><i class="fas fa-plus"></i></button>
                                          </span></td>
                                      </tr>
                                      <tr v-for="encargo in encargos">
                                        <td>{{encargo.deTipoLanc}}</td>
                                        <td class="text-right">R$ {{encargo.vlLanc}}</td>
                                        <td class="d-flex justify-content-center"><span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Editar">
                                          <button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar"><i class="fas fa-pencil-alt"></i></button>
                                          </span> &nbsp;<span data-toggle="tooltip" data-container="body" data-placement="top" title="Remover" role="tooltip">
                                          <button type="button" @click="removeEncargo(encargo.key)" class="btn btn-danger btn-sm btn-toolbar"><i class="fas fa-minus"></i></button>
                                          </span></td>
                                      </tr>
                                      
                                    </tbody>
                                  </table>
                                </div>
                              </div>
                          </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-secondary">Salvar</button>
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
        </div>
    </form>
    <!-- modal MES / ANO-->
    <form novalidate role="form">
        <div id="mesano" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mesanoLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                    </div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
                            <li class="breadcrumb-item"><a href="#">Fatura</a></li>
                            <li class="breadcrumb-item active" aria-current="page">MÃªs / Ano</li>
                        </ol>
                    </nav>
                    <div class="modal-body">
                        <div class="form-row mt-3">
                            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">MÃªs / Ano</span> </div>
                                        <input type="text" class="form-control text-center" placeholder="00/0000"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">PerÃ­odo</span> </div>
                                        <input type="text" class="form-control text-center" placeholder="00/0000"/>
                                        <div class="input-group-prepend"> <span class="input-group-text">a</span> </div>
                                        <input type="text" class="form-control text-center" placeholder="00/0000"/>
                                    </div>
                                </div>
                            </div>
                            <!-- -->
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
    
    <!-- modal CONSUMO -->
    <form novalidate role="form">
        <div id="consumo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="consumoLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                    </div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
                            <li class="breadcrumb-item"><a href="#">Fatura</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Consumo CNIC</li>
                        </ol>
                    </nav>
                    <div class="modal-body">
                        <div class="form-row mt-1">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <h5 class="page-header"><strong>Valor</strong></h5>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <h5 class="page-header"><strong>Tarifa</strong></h5>
                            </div>
                            <!-- -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <!-- -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
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
    <!-- modal DEMANDA -->
    <form novalidate role="form">
        <div id="demanda" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="demandaLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                    </div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
                            <li class="breadcrumb-item"><a href="#">Fatura</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Demanda</li>
                        </ol>
                    </nav>
                    <div class="modal-body">
                        <div class="form-row mt-3">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Fora Ponta</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <!-- -->
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Contratada</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend"> <span class="input-group-text">Tarifa</span> </div>
                                        <input type="text" class="form-control text-right" placeholder="000.000,00"/>
                                    </div>
                                </div>
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
    
    <!-- modal ENCARGOS --> 
    <form novalidate role="form">
      <div id="encargos" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mesanoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
           <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
            </div>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">FF02 - GestÃ£o de Faturamento</a></li>
                    <li class="breadcrumb-item"><a href="#">Fatura</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Encargos</li>
                </ol>
            </nav>
            <div class="modal-body">
              <div class="form-row mt-1">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                  <table id="tblEncargos" class="table table-sm table-hover">
                    <thead>
                      <tr>
                        <th class="col-xl-6 col-lg-6 col-md-6 col-sm6 col-6 text-center">Encargo</th>
                        <th class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 text-center">Valor</th>
                        <th class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Tipo do Encargo</td>
                        <td class="text-right">R$ 000.000,00</td>
                        <td class="d-flex justify-content-center"><span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Editar">
                          <button type="button" data-href="#" class="btn btn-warning btn-sm btn-toolbar"><i class="fas fa-pencil-alt"></i></button>
                          </span> &nbsp;<span data-toggle="tooltip" data-container="body" data-placement="top" title="Remover" role="tooltip">
                          <button type="button" data-href="#" class="btn btn-danger btn-sm btn-toolbar"><i class="fas fa-minus"></i></button>
                          </span></td>
                      </tr>
                      <tr>
                        <td><select class="form-control form-control-sm">
                        	<option value="0" selected>Selecione...</option>
                            <option value="1">Tipo 1</option>
                            <option value="2">Tipo 2</option>
                        </select></td>
                        <td><input type="text" class="form-control form-control-sm"></td>
                        <td class="d-flex justify-content-center"><span data-toggle="tooltip" data-container="body" data-placement="top" title="" role="tooltip" data-original-title="Adicionar">
                          <button type="button" data-href="#" class="btn btn-success btn-sm btn-toolbar"><i class="fas fa-plus"></i></button>
                          </span></td>
                      </tr>
                    </tbody>
                  </table>
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
</div>
    <c:url value="/resources/js" var="jsPath" />
    <script type="text/javascript" src="${jsPath}/custom/manterFatura.js"></script>
   <jsp:include page="../footer.jsp"></jsp:include>
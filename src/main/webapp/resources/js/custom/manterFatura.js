const app = new Vue({
	el:"#app",
	data: {
		cdFatr:'',
		faturas: [],
		aba: 'mesanoTab',
		dtInic:'',
		dtFim:'',
		tipoEncargo: [],
		vlLanc: '',
		vlLancConsPont: '',
		vlLancConsForaPont: '',
		vlLancTarifPont: '',
		vlLancTarifForaPont: '',
		vlLancDemPont:'',
		vlLancDemForaPont:'',
		vlLancDemContr:'',
		vlLancDemTari:'',
		paginacao:{
			paginas:'',
			atual: 1,
			total: '',
			inicio: 0,
			qtd: 3,
		},
		encargos:[],
		encargo:[],
		key:0,
	},
	mounted(){
		this.getFaturas();
		this.getTipoEncargos();
		
	
		
	},
	methods:{
		getFaturas(){
			const conf = {
				method: 'POST',
				headers: {
				      'Accept': 'application/json',
				      'Content-Type': 'application/json'
			    },
				body: JSON.stringify(this.paginacao)
			}
			fetch('listar', conf)
			.then(resp => {
				if(resp.ok) return resp.json()
			})
			.then(data => {
				this.faturas = data.faturas;
				this.paginacao.total = data.total;
				this.paginacao.paginas = Math.ceil(this.paginacao.total / this.paginacao.qtd);
			})
		},
		
		
		inclui(){
			
			const lancamentos = [];
			
			lancamentos.push(
				{
					cdTipoLanc: 1,
					vlLanc: this.vlLancConsPont.replace('.','').replace(',','.'), 
				},
				{
					cdTipoLanc: 2,
					vlLanc: this.vlLancConsForaPont.replace('.','').replace(',','.'), 
				},
				{
					cdTipoLanc: 3,
					vlLanc: this.vlLancTarifPont.replace('.','').replace(',','.'), 
				},
				{
					cdTipoLanc: 4,
					vlLanc: this.vlLancTarifForaPont.replace('.','').replace(',','.'), 
				},
				{
					cdTipoLanc: 5,
					vlLanc: this.vlLancDemPont.replace('.','').replace(',','.'), 
				},
				{
					cdTipoLanc: 6,
					vlLanc: this.vlLancDemForaPont.replace('.','').replace(',','.'),
				},
				{
					cdTipoLanc: 7,
					vlLanc: this.vlLancDemContr.replace('.','').replace(',','.'),
				},
				{
					cdTipoLanc: 8,
					vlLanc: this.vlLancDemTari.replace('.','').replace(',','.'), 
				},
				
			)
			lancamentos.push(...this.encargos);
			
			const dados = {
					dtInic: this.dtInic, 
					dtFim: this.dtFim,
					lancamentos: lancamentos,
			}
			const conf = {
					method: 'POST',
					headers: {
					      'Accept': 'application/json',
					      'Content-Type': 'application/json'
				    },
					body: JSON.stringify(dados)
				}
			fetch('inclui', conf)
					.then(resp => {
						
						console.log("salvar");
						
							return resp.json();
							
					})
					.then(data => {
						
						console.log(data)
						
						if(data.error){
								swal("Atenção",'A operação não foi realizada!', "warning")
								
						}else{
							
							this.getFaturas();
							
							$('#incluir').modal('hide')
							
							
							swal("Sucesso",'Operação realizada com sucesso!', "success")
						}
								
						
					})
					.catch(err => console.error("Aconteceu um erro:",err))
					
					
		},
		
		excluirFatura(cdFatr){
			swal({
        		title: 'Tem certeza?',
                text: "Não será possível desfazer a ação!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sim, exclua!',
                cancelButtonText: 'Não, cancele!',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
			    }).then(resp => {
			    	$.post("excluirFatura", {
						"fatura.cdFatr":cdFatr
					}).done(response=>{
						console.log(response)
						if(response.error){
							swal('Erro!','Este grupo não pode ser excluído pois está associada ao cadastro de DCI de Requisição.','error')    
							return
						}else{
							this.carregarCadastros();
							swal('Excluido!','A exclusão foi realizada com sucesso!','success')
						}
						
					})
					
		    })
		},
		
		getTipoEncargos(){
			fetch('listarEncargos')
			.then(resp => {
				if(resp.ok) return resp.json()
			})
			.then(data => this.tipoEncargo = data)
		},
		
		

		proximo(){//3 traga 3    
			this.paginacao.atual +=  1;
			this.paginacao.inicio += this.paginacao.qtd;
			this.getFaturas();
		},
		anterior(){
			this.paginacao.atual = this.paginacao.atual - 1;
			this.paginacao.inicio -= this.paginacao.qtd;
			this.getFaturas();
		},
		primeira(){
			this.paginacao.atual = 1;
			this.paginacao.inicio = 0;
			this.getFaturas();
		},
		ultima(){
			this.paginacao.atual = this.paginacao.paginas;
			const resto = this.paginacao.total % this.paginacao.qtd;
			this.paginacao.inicio = this.paginacao.total - ( resto === 0 ? this.paginacao.qtd : resto);
			this.getFaturas();
		},
		adicionaEncargo(){
			this.key += 1;
			
			this.encargos.push(
				{
					key: this.key,
					deTipoLanc: this.encargo.deTipoLanc,
					cdTipoLanc: this.encargo.cdTipoLanc,
					vlLanc: this.vlLanc.replace('.','').replace(',','.'),
				}
			)
		},
		removeEncargo(key){
			this.encargos = this.encargos.filter(encargo => {
				return encargo.key != key
					
			});
		},
		abreIncluir(){
			this.clear();
			$('#incluir').modal('show')
		},
		
		clear(){
			this.aba= 'mesanoTab';
			this.dtInic='';
			this.dtFim='';
			this.vlLanc= '';
			this.vlLancConsPont= '';
			this.vlLancConsForaPont= '';
			this.vlLancTarifPont= '';
			this.vlLancTarifForaPont= '';
			this.vlLancDemPont='';
			this.vlLancDemForaPont='';
			this.vlLancDemContr='';
			this.vlLancDemTari='';
			this.encargos=[];
			this.encargo=[];
			this.key=0;
		},
		
		somaEncargos(fatura){
			return fatura.lancamentos.reduce((acc, value)=>{
				  if(value.tipoLancamento.lgEncg == 'S'){
					  return acc + parseFloat(value.vlLanc)
				  }
				},0)
		},
		
		
		modalEditarData(dtInic, dtFim){
			
			this.dtInic = dtInic
			this.dtFim = dtFim
			
			$('#mesano').modal('show');
			
			
		},
		editarData(){
			console.log("editarData")
			
			
			swal({
			  	title: 'Tem certeza?',
				text: 'Confirme os dados antes de editar!',
				type: 'warning',
				showCancelButton: true,
				confirmButtonText: 'Sim, Editar!',
				cancelButtonText: 'Não, Cancelar!',
				confirmButtonClass: 'btn btn-outline-success',
				cancelButtonClass: 'btn btn-outline-danger',
				buttonsStyling: false
		}).then((result) => {
			
				 let editarData = new FormData()
			     editarData =  ('dtInic', this.dtIni)
				 editarData = ('dtFim', this.dtFim)
				 editarData = ('aba', this.aba)
		
			axios.post('editarData', editarData).then(resp =>{
				
				if(resp.data) {
					 	swal('Salvo!','A edição foi realizada com sucesso!','success')
						this.getFaturas();
						$('#editarData').modal('hide')
				}else{
					
						 swal('Cancelado','Nenhuma edição foi realizada.','error')
						 $('#editarData').modal('hide')
					}
				})
			})
				
			
		},
		
	 
		
	}
})
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
		encargo:'',
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
					.then(resp => resp.json() )
					.then(data => {
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
			
			if(this.encargo == '' || this.vlLanc == '')
				return
				
			this.key += 1;
			
			this.encargos.push(
				{
					key: this.key,
					deTipoLanc: this.encargo.deTipoLanc,
					cdTipoLanc: this.encargo.cdTipoLanc,
					vlLanc: this.vlLanc.replace('.','').replace(',','.'),
				}
			)
			this.encargo = '';
			this.vlLanc = '';
			
		},
		removeEncargo(key){
			this.encargos = this.encargos.filter(encargo => {
				return encargo.key != key
					
			});
		},
		abreIncluir(){
			this.limpar();
			$('#incluir').modal('show')
		},
		
		limpar(){
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
			this.encargo='';
			this.key=0;
		},
		
		somaEncargos(fatura){
			return fatura.lancamentos.reduce((acc, item)=>{
				   return item.tipoLancamento.lgEncg === 'S' ? acc += item.vlLanc : acc += 0;
                },0)
		},
		total(fatura){
			return fatura.lancamentos.reduce((acc, item)=>{
				   return acc += item.vlLanc;
                },0)
		},
		
		modalEditarData(dtInic, dtFim, cdFatr){
			this.limpar();
			this.dtInic = this.dataParaString(dtInic);
			this.dtFim = this.dataParaString(dtFim);
			this.cdFatr = cdFatr;
			
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
			
			 let editarData = {
				cdFatr: this.cdFatr,
				dtInic: this.dtInic,
				dtFim: this.dtFim
			}
				
			
			const conf = {
					method: 'POST',
					headers: {
					      'Accept': 'application/json',
					      'Content-Type': 'application/json'
				    },
					body: JSON.stringify(editarData)
				}
		
			fetch('editarData', conf)
			.then(resp => resp.json())
			.then(data=>{
				console.log(data.error)
				if(data.error) {
				 	swal('Cancelado','Nenhuma edição foi realizada.','error')
					$('#mesano').modal('hide')
				}else{
					swal('Salvo!','A edição foi realizada com sucesso!','success')
					this.getFaturas();
					$('#mesano').modal('hide')
				}
			})
		})
				
			
		},
		modalEditaEncargos(cdFatr){
			this.limpar();
			this.cdFatr = cdFatr;
			const encargos = this.faturas.filter(item=>item.cdFatr == cdFatr)[0].lancamentos.filter(item=>item.tipoLancamento.lgEncg === 'S');
			
			encargos.forEach(item => {
				this.key += 1;
				this.encargos.push(
					{
						key: this.key,
						cdLanc: item.cdLanc,
						deTipoLanc: item.tipoLancamento.deTipoLanc,
						cdTipoLanc: item.tipoLancamento.cdTipoLanc,
						vlLanc: item.vlLanc.toString().replace('.',','),
					}
				)
			})
			
			$('#encargos').modal('show')
		},
		editaEncargos(){
			const dados = {
				cdFatr: this.cdFatr,
				lancamentos: this.encargos
			}
			const conf = {
					method: 'POST',
					headers: {
					      'Accept': 'application/json',
					      'Content-Type': 'application/json'
				    },
					body: JSON.stringify(dados)
				}
		
			fetch('editaEncargos', conf)
			.then(resp => resp.json())
			.then(data=>{
				console.log(data.error)
				if(data.error) {
				 	swal('Erro','Nenhuma edição foi realizada. Erro Interno','error')
					$('#encargos').modal('hide')
				}else{
					swal('Salvo!','A edição foi realizada com sucesso!','success')
					this.getFaturas();
					$('#encargos').modal('hide')
				}
			})
		},
		deleteEncargo(encargo){
			const { cdLanc, key } = encargo 
			
			if(!cdLanc){
				this.removeEncargo(encargo.key);
				return
			}
			
			fetch(`deleteEncargo?cdLanc=${cdLanc}`)
			.then(resp => {
				if(resp.status === 200){
					this.removeEncargo(encargo.key);
					this.getFaturas();
				}else{
					swal('Erro','Error Interno','error');
					$('#encargos').modal('hide');
				}
			})
			
		},
		dataParaString(data){
			return moment(`${data.dayOfMonth}/${data.monthValue}/${data.year}`, 'DD/MM/YYYY').format('DD/MM/YYYY')
		}
		
	 	
	},
	computed:{
		
	}
		
	
	
	
})
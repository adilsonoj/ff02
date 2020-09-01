const app = new Vue({
	el:"#app",
	data: {
		faturas: [],
		aba: 'mesanoTab',
		dtIni:'',
		dtFim:'',
		tipoEncargo: [],
		cdTipoLanc:'',
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
					cdTipoLanc: this.cdTipoLanc,
					vlLanc: this.vlLanc.replace('.','').replace(',','.'),
				},
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
			
			const dados = {
					dtIni: this.dtIni, 
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
			fetch('inclui',conf)
					.then(resp => {
						//if(resp.ok) 
							return resp.json();
					})
					.then(data => {
						if(data.error){
							throw new Error(data.msg)
						}
						console.log(data)
					})
					.catch(err => console.error("Aconteceu um erro:",err))
		},
		getTipoEncargos(){
			fetch('listarEncargos')
			.then(resp => {
				if(resp.ok) return resp.json()
			})
			.then(data => this.tipoEncargo = data)
		},
		proximo(){
			this.paginacao.atual = this.paginacao.atual + 1;
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
		}
		
	}
})
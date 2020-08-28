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
	},
	created(){
		this.getFaturas();
		this.getTipoEncargos();
	},
	methods:{
		getFaturas(){
			fetch('listar')
			.then(resp => {
				if(resp.ok) return resp.json()
			})
			.then(data => this.faturas = data)
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
					vlLanc: this.vlLancConsPont.replace('.','').replace(',','.'), //1000.50   1000.50
				},
				{
					cdTipoLanc: 2,
					vlLanc: this.vlLancConsForaPont.replace('.','').replace(',','.'), //1.000,50   1000.50
				},
				{
					cdTipoLanc: 3,
					vlLanc: this.vlLancTarifPont.replace('.','').replace(',','.'), //1.000,50   1000.50
				},
				{
					cdTipoLanc: 4,
					vlLanc: this.vlLancTarifForaPont.replace('.','').replace(',','.'), //1.000,50   1000.50
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
		}
	}
})
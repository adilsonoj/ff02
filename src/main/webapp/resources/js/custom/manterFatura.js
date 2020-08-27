const app = new Vue({
	el:"#app",
	data: {
		faturas: [],
		aba: 'mesanoTab',
		dtIni:'',
		dtFim:'',
		tipoEncargo: [],
		cdTipoLanc:'',
		vlLanc: ''
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
			const dados = {
					dtIni: this.dtIni, 
					dtFim: this.dtFim,
					cdTipoLanc: this.cdTipoLanc,
					vlLanc: this.vlLanc.replace('.','').replace(',','.')
			}
			const conf = {
					method: 'POST',
					headers: {
					      'Accept': 'application/json',
					      'Content-Type': 'application/json'
				    },
					body: JSON.stringify(dados)
				}
			console.log(dados)
			fetch('inclui',conf)
					.catch(erro => console.error(erro))
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
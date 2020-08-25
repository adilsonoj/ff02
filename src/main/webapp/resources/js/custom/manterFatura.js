const app = new Vue({
	el:"#app",
	data: {
		faturas: [],
		aba: 'mesanoTab',
		dtIni:'',
		dtFim:'',
	},
	created(){
		this.getFaturas();
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
					dtFim: this.dtFim
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
					.catch(erro => console.error(erro))
		}
	}
})
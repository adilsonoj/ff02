var app = new Vue({
  el: '#main',
  data: {
	  host: window.location,
	  tipoUc:'',
	  clientes:['AMRJ','CMS', 'DIM' ],
	  deUnidCons:'',
	  idClieCap:'',
	  cdTipoUnidCons:''
	  

  },
  mounted: function(){
	  this.listargetIncluir();
  },
  
  methods: {
	  listargetIncluir(){
		  axios.get("listar").then(resp => {
			  this.tipoUc = resp.data.tipoUC
			  console.log(this.tipoUc)
		  })
			 
	  },
	
	  incluir(){
//		   $.post("salvar", { 
//			   deUnidCons:this.deUnidCons,
//			   idClieCap:this.idClieCap,
//			   cdTipoUnidCons:this.cdTipoUnidCons
//		   },
//			  (data, success) =>{ }).then( data => {})
			  
			  swal({
					title: 'Tem certeza?',
					text: 'Confirme os dados antes da inclusão!',
					type: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
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
					if (dismiss === 'Não, cancele!') {
						swal(
							'Cancelado',
							'Nenhuma inclusão foi realizada.',
							'error'
						)
					}
				})
			//};
	  }
  }
})
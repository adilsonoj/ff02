var app = new Vue({
  el: '#main',
  data: {
	  host: window.location,
	  tipoUc:'',
	  clientes:'',
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
			  this.clientes =  resp.data.cliente
		  })
			 
	  },
	
	  incluir(){
//		   $.post("salvar", { 
//			   deUnidCons:this.deUnidCons,
//			   idClieCap:this.idClieCap,
//			   cdTipoUnidCons:this.cdTipoUnidCons
//		   }, (data, success) =>{ 
//				  console.log(data)
//			  })
////	 
//		
		  
		 
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
			}).then((result) => {
				 $.post("salvar", { 
					   deUnidCons:this.deUnidCons,
					   idClieCap:this.idClieCap,
					   cdTipoUnidCons:this.cdTipoUnidCons
				   }, (data, success) =>{ 
						  console.log(data)
				 if (data) {
				 swal('Salvo!','A inclusão foi realizada com sucesso!','success')
					 $('#incluir').modal('hide')
			 	}else{
			 		swal('Cancelado','Nenhuma inclusão foi realizada.','error')
			 		 $('#incluir').modal('hide')
			 	}
		  })
			  
	})
		
	  
	  
	  
	  }	//fim do incluir	
  }
})
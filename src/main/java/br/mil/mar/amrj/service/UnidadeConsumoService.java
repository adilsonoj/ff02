package br.mil.mar.amrj.service;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.dao.UnidadeConsumoDao;
import br.mil.mar.amrj.model.Cliente;
import br.mil.mar.amrj.model.TipoUnidadeConsumo;
import br.mil.mar.amrj.model.UnidadeConsumo;

@Service
public class UnidadeConsumoService {
	
	@Autowired
	UnidadeConsumoDao ucDao;
	
	@Transactional
	public void salvar(String deUnidCons, String idClieCap, Integer cdTipoUnidCons) {
		Cliente cliente = new Cliente();
		cliente.setIdClieCap(idClieCap);
		
		TipoUnidadeConsumo tipoUnidConsumo = new TipoUnidadeConsumo();
		tipoUnidConsumo.setCdTipoUnidCons(cdTipoUnidCons);
		
		UnidadeConsumo uc = new UnidadeConsumo();
			uc.setCliente(cliente);
			uc.setTipoUnidConsumo(tipoUnidConsumo);
			uc.setDeUnidCons(deUnidCons);
		uc.setCdUnidCons(2);
		ucDao.salvar(uc);
	}
}

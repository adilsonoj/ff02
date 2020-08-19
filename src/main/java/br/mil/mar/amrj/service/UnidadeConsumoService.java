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
	public boolean  salvar(UnidadeConsumo uc) {
		boolean salvo = false;
		try {
			//ucDao.salvar(uc);
			salvo = true;
		}catch (Exception e) {
			salvo = false;
		}
		return salvo;
	}	
}

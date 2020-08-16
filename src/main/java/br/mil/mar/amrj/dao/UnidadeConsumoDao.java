package br.mil.mar.amrj.dao;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.UnidadeConsumo;

@Repository
public class UnidadeConsumoDao {

	@PersistenceContext
	EntityManager manager;
	
	public void salvar(UnidadeConsumo uc) {
		manager.merge(uc);
	}
}

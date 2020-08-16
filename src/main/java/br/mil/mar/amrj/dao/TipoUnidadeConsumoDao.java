package br.mil.mar.amrj.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.TipoUnidadeConsumo;

@Repository
public class TipoUnidadeConsumoDao {
	
	@PersistenceContext
	EntityManager manager;
	

	public List<TipoUnidadeConsumo> buscar() {
		return manager.createQuery(" from TipoUnidadeConsumo t ", TipoUnidadeConsumo.class).getResultList();
		
	}
}

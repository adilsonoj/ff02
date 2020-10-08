package br.mil.mar.amrj.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.Lancamento;
import br.mil.mar.amrj.model.TipoLancamento;

@Repository
public class LancamentoDAO {
	
	@PersistenceContext
	EntityManager em;
	
	public List<TipoLancamento> listarEncargos() {	
		List<TipoLancamento> lista = em.createQuery("from TipoLancamento t "
				+ "where t.lgEncg =:lgEncg", TipoLancamento.class)
				.setParameter("lgEncg", 'S')
				.getResultList();		
		return lista;
	}

	public void persist(Lancamento lancamento) {
		em.persist(lancamento);		
	}
	
	public void delete(Lancamento lancamento) {
		((LancamentoDAO) em).delete(lancamento);		
	}

}

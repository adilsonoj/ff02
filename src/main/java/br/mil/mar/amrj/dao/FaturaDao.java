package br.mil.mar.amrj.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.FaturaServico;
import br.mil.mar.amrj.model.Paginacao;

@Repository
public class FaturaDao {

	@PersistenceContext
	EntityManager manager;
	
	public List<FaturaServico> listar(Paginacao paginacao){
		String hql = "from FaturaServico c "
				+ "join fetch c.lancamentos "
				+ "join fetch c.modalidadeFatura m "
				+ "join fetch m.tipoServico s "
				
				+ "where "
				+ "m.cdModlFatr =:codigoFatr and "
				+ "s.cdTipoServ =:codigoServ";
		
		List<FaturaServico> lista = manager.createQuery(hql, FaturaServico.class)
				.setParameter("codigoFatr", 1)
				.setParameter("codigoServ", 1)
				.setFirstResult(paginacao.getInicio())
				.setMaxResults(paginacao.getQtd())
				.getResultList();
		 
		return lista;
	}
	
	public Integer total(){
		String hql = "from FaturaServico c "
				+ " join fetch c.modalidadeFatura m "
				+ " join fetch m.tipoServico s "
				+ "where "
				+ "m.cdModlFatr =:codigoFatr and "
				+ "s.cdTipoServ =:codigoServ";
		
		return manager.createQuery(hql, FaturaServico.class)
				.setParameter("codigoFatr", 1)
				.setParameter("codigoServ", 1)
				.getResultList().size();
		 
	}
	
	public List<FaturaServico> getAll(){
		String hql = "from FaturaServico c ";
		List<FaturaServico> lista = manager.createQuery(hql, FaturaServico.class)
				.getResultList();
		 
		return lista;
	}
	
	public FaturaServico getFatura(Integer cdFatr) {
		String hql = "from FaturaServico c where c.cdFatr =:cdFatr";
		
		return manager.createQuery(hql, FaturaServico.class).setParameter("cdFatr", cdFatr).getSingleResult();
	}

	public void persist(FaturaServico fatura) {
		manager.persist(fatura);
	}
	
	public void delete(FaturaServico fatura) {
		((FaturaDao) manager).delete(fatura);
	}
	
	
	public FaturaServico editarData(FaturaServico fatura) {
	
		return manager.merge(fatura);
	}
	/*
	 * SELECT f.* FROM FFVU_FATR f 
	 * INNER JOIN FFVU_MODL_FATR m ON m.CD_MODL_FATR = f.CD_MODL_FATR 
	 * INNER JOIN FFVU_TIPO_SERV s ON s.CD_TIPO_SERV = m.CD_TIPO_SERV
	 * WHERE s.DE_CLAS_FATR = 'ENERGIA' AND m.DE_TIPO_FATR = 'BASICA'
	 */
}

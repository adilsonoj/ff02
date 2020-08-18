package br.mil.mar.amrj.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.Cliente;

@Repository
public class ClienteDao {
	
	@PersistenceContext
	EntityManager manager;
	
	public List<Cliente> buscar(){
		return manager.createQuery(" from Cliente c ", Cliente.class).getResultList();
	}
}

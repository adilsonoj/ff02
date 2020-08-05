package br.mil.mar.amrj.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.mil.mar.amrj.model.Customer;

@Repository
public class CustomerDao {

	@PersistenceContext
	EntityManager manager;
	
	public Customer getCustomer() {
		return manager.createQuery("from Customer", Customer.class).getSingleResult();
	}
}

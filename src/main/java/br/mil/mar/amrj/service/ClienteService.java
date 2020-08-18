package br.mil.mar.amrj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.dao.ClienteDao;
import br.mil.mar.amrj.model.Cliente;

@Service
public class ClienteService {
	
	@Autowired
	ClienteDao clienteDao;
	
	public List<Cliente> buscar(){
		return clienteDao.buscar();
	}
}

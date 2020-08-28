package br.mil.mar.amrj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.dao.LancamentoDAO;
import br.mil.mar.amrj.model.TipoLancamento;

@Service
public class LancamentoService {
	
	@Autowired
	LancamentoDAO lancamentoDAO;
	
	public List<TipoLancamento> listarEncargos() {
		return lancamentoDAO.listarEncargos();
	}

}

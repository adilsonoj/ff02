package br.mil.mar.amrj.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.dao.TipoUnidadeConsumoDao;
import br.mil.mar.amrj.model.TipoUnidadeConsumo;


@Service
public class TipoUnidadeConsumoService {
	
	
	@Autowired
	TipoUnidadeConsumoDao tipoUCDao;
	
	public List<TipoUnidadeConsumo>  buscar() {
		List<TipoUnidadeConsumo> lista = (List<TipoUnidadeConsumo>) tipoUCDao.buscar();
		return lista;
	}

}

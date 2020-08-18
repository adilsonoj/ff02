package br.mil.mar.amrj.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.mil.mar.amrj.service.ClienteService;
import br.mil.mar.amrj.service.TipoUnidadeConsumoService;
import br.mil.mar.amrj.service.UnidadeConsumoService;

@Controller
@RequestMapping(value = "uc")
public class UnidadesConsumoController {
	
	@Autowired
	TipoUnidadeConsumoService tipoUcService;
	
	@Autowired
	ClienteService clienteService;
	
	@Autowired
	UnidadeConsumoService ucService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String manterUc() {
//		model.addAllAttributes(tipoUcService.buscar());
		return "cadastroUC/manterUnidadesConsumo";
	}
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> listaParamentros() {
		Map<String, Object> map = new HashMap<>();
		map.put("tipoUC",tipoUcService.buscar());
		map.put("cliente", clienteService.buscar());
	return map;
	}
	
	@RequestMapping(value = "/salvar", method = RequestMethod.POST)
	@ResponseBody
	public boolean salvar(String deUnidCons, String idClieCap, Integer cdTipoUnidCons) {
		System.out.println("salvando");
		Boolean salvo = false;
		if(deUnidCons != null || idClieCap != null || cdTipoUnidCons != null){
			//ucService.salvar(deUnidCons, idClieCap, cdTipoUnidCons );
			salvo = true;
			return salvo;
		}
		
		return  salvo;
		
		
	}

}

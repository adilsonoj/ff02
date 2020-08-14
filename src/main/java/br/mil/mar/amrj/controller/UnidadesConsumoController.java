package br.mil.mar.amrj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "uc")
public class UnidadesConsumoController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String manterUc() {
		
		return "cadastroUC/manterUnidadesConsumo";
	}

}

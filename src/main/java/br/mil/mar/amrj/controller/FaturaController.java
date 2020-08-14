package br.mil.mar.amrj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "fatura")
public class FaturaController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String manterFatura() {
		
		return "fatura/manterFatura";
	}
}

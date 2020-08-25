package br.mil.mar.amrj.controller;

import java.util.List;

import org.hibernate.annotations.Parameter;
import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.mil.mar.amrj.DTO.FaturaDto;
import br.mil.mar.amrj.model.FaturaServico;
import br.mil.mar.amrj.service.FaturaService;

@Controller
@RequestMapping(value = "fatura")
public class FaturaController {
	
	@Autowired
	FaturaService faturaService;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String manterFatura() {
		return "fatura/manterFatura";
	}
	
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<FaturaServico>> listar(){
		return ResponseEntity.ok(faturaService.listar());
	}
	
	@RequestMapping(value = "/inclui", method = RequestMethod.POST)
	public HttpStatus inclui(@RequestBody FaturaDto dto){
		faturaService.persist(dto);
		return HttpStatus.OK;
		
	}
}

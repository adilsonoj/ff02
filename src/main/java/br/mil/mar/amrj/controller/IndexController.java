package br.mil.mar.amrj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.mil.mar.amrj.DAO.CustomerDao;
import br.mil.mar.amrj.model.Customer;

@Controller
@RequestMapping(value="/index")
public class IndexController {
	
	@Autowired
	CustomerDao dao;

	@RequestMapping("/")
	@ResponseBody
	public ResponseEntity<Customer> index(){
		
		return ResponseEntity.ok(dao.getCustomer());
	}
}

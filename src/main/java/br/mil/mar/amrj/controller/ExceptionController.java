package br.mil.mar.amrj.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ExceptionController extends ResponseEntityExceptionHandler{
	Map<String, String> mapError = new HashMap<>();

	@ExceptionHandler(org.springframework.dao.DataIntegrityViolationException.class)
	@ResponseBody
    public ResponseEntity<Map<String, String>> ConstraintViolation(Exception ex, WebRequest request){
		
		mapError.put("error", "violacao_integridade");
		mapError.put("cod", HttpStatus.BAD_REQUEST.toString());
		mapError.put("msg", ex.getMessage());
		
        return new ResponseEntity<>(mapError, HttpStatus.BAD_REQUEST);
    }
	
	@ExceptionHandler(Exception.class)
	@ResponseBody
    public ResponseEntity<Map<String, String>> genericException(Exception ex, WebRequest request){
		
		mapError.put("error", "exception");
		mapError.put("cod", HttpStatus.BAD_REQUEST.toString());
		mapError.put("msg", ex.getMessage());
		
        return new ResponseEntity<>(mapError, HttpStatus.BAD_REQUEST);
    }
	
	@ExceptionHandler(javax.persistence.NonUniqueResultException.class)
	@ResponseBody
    public ResponseEntity<Map<String, String>> nonUniqueResultException(Exception ex, WebRequest request){
		
		mapError.put("error", "exception");
		mapError.put("cod", HttpStatus.BAD_REQUEST.toString());
		mapError.put("msg", ex.getMessage());
		
        return new ResponseEntity<>(mapError, HttpStatus.BAD_REQUEST);
    }
	
	@ExceptionHandler(javax.persistence.EntityNotFoundException.class)
	@ResponseBody
    public ResponseEntity<Map<String, String>> entityNotFoundException(Exception ex, WebRequest request){
		
		mapError.put("error", "exception");
		mapError.put("cod", HttpStatus.BAD_REQUEST.toString());
		mapError.put("msg", ex.getMessage());
		
        return new ResponseEntity<>(mapError, HttpStatus.BAD_REQUEST);
    }
	
}

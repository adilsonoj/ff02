package br.mil.mar.amrj.service;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.DTO.FaturaDto;
import br.mil.mar.amrj.dao.FaturaDao;
import br.mil.mar.amrj.model.FaturaServico;
import br.mil.mar.amrj.model.ModalidadeFatura;

@Service
public class FaturaService {
	
	@Autowired
	FaturaDao faturaDao;
	
	public List<FaturaServico> listar(){
		return faturaDao.listar();
	}

	@Transactional
	public void persist(FaturaDto dto) {
		FaturaServico fatura = new FaturaServico();
		
		fatura.setDtInic(parseLocalDate(dto.getDtIni()));
		fatura.setDtFim(parseLocalDate(dto.getDtFim()));
		
		ModalidadeFatura  modalidade = new ModalidadeFatura();
		modalidade.setCdModlFatr(1);
		
		fatura.setModalidadeFatura(modalidade);
		faturaDao.persist(fatura);
	}
	
	public LocalDate parseLocalDate(String data) {
		String[] split = data.split("/");
		LocalDate of = LocalDate.of(Integer.parseInt(split[2]), Integer.parseInt(split[1]), Integer.parseInt(split[0]));
		
		return of;
	}
	
	

}

package br.mil.mar.amrj.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.DTO.FaturaDto;
import br.mil.mar.amrj.DTO.LancamentoDto;
import br.mil.mar.amrj.dao.FaturaDao;
import br.mil.mar.amrj.dao.LancamentoDAO;
import br.mil.mar.amrj.model.FaturaServico;
import br.mil.mar.amrj.model.Lancamento;
import br.mil.mar.amrj.model.ModalidadeFatura;
import br.mil.mar.amrj.model.Paginacao;
import br.mil.mar.amrj.model.TipoLancamento;

@Service
public class FaturaService {
	
	@Autowired
	FaturaDao faturaDao;
	
	@Autowired
	LancamentoDAO lancamentoDAO;
	
	public List<FaturaServico> listar(Paginacao paginacao){
		return faturaDao.listar(paginacao);
	}
	
	public Integer total(){
		return faturaDao.total();
	}

	@Transactional
	public void persist(FaturaDto dto) {
		FaturaServico fatura = new FaturaServico();
		fatura.setLgAtiv('S');
		
		//FATURA
		fatura.setDtInic(parseLocalDate(dto.getDtInic()));
		fatura.setDtFim(parseLocalDate(dto.getDtFim()));
		
		
		ModalidadeFatura  modalidade = new ModalidadeFatura();
		modalidade.setCdModlFatr(1);
		
		fatura.setModalidadeFatura(modalidade);
		faturaDao.persist(fatura);
		
		//LANCAMENTOS
		List<LancamentoDto> lancamentos = dto.getLancamentos();
		
		for (LancamentoDto lancamentoDto : lancamentos) {
			
			if(lancamentoDto.getCdTipoLanc() == null) 
				continue;
			
				
			TipoLancamento tipoLancamento = new TipoLancamento();
			tipoLancamento.setCdTipoLanc(lancamentoDto.getCdTipoLanc());
			
			Lancamento lancamento = new Lancamento();		
			
			lancamento.setVlLanc(lancamentoDto.getVlLanc());
			lancamento.setTipoLancamento(tipoLancamento);
			lancamento.setFaturaServico(fatura);
			lancamentoDAO.persist(lancamento);
		}
		
	}
	
	@Transactional
	public void editarData(FaturaDto dto) {
		FaturaServico fatura = faturaDao.getFatura(dto.getCdFatr());
		fatura.setDtInic(parseLocalDate(dto.getDtInic()));
		fatura.setDtFim(parseLocalDate(dto.getDtFim()));
	}
	

	public LocalDate parseLocalDate(String data) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate localDate = LocalDate.parse(data, formatter);
		
		return localDate;
	}
	
	
	
	

}

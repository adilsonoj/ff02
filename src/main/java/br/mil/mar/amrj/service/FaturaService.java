package br.mil.mar.amrj.service;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.mil.mar.amrj.DTO.FaturaDto;
import br.mil.mar.amrj.dao.FaturaDao;
import br.mil.mar.amrj.dao.LancamentoDAO;
import br.mil.mar.amrj.model.FaturaServico;
import br.mil.mar.amrj.model.Lancamento;
import br.mil.mar.amrj.model.ModalidadeFatura;
import br.mil.mar.amrj.model.TipoLancamento;

@Service
public class FaturaService {
	
	@Autowired
	FaturaDao faturaDao;
	
	@Autowired
	LancamentoDAO lancamentoDAO;
	
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
					
		TipoLancamento tipoLancamento = new TipoLancamento();
		tipoLancamento.setCdTipoLanc(dto.getCdTipoLanc());
		
		Lancamento lancamento = new Lancamento();		
		lancamento.setVlLancdeTipoLanc(dto.getVlLanc());
		lancamento.setTipoLancamento(tipoLancamento);
		lancamento.setFaturaServico(fatura);
		lancamentoDAO.persist(lancamento);
		
	}
	
	public LocalDate parseLocalDate(String data) {
		String[] split = data.split("/");
		LocalDate of = LocalDate.of(Integer.parseInt(split[2]), Integer.parseInt(split[1]), Integer.parseInt(split[0]));
		
		return of;
	}
	
	

}

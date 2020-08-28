package br.mil.mar.amrj.DTO;

import java.util.List;

public class FaturaDto {
	
	private String dtIni;
	private String dtFim;
	
	private List<LancamentoDto> lancamentoDto;
	
	public String getDtIni() {
		return dtIni;
	}
	public void setDtIni(String dtIni) {
		this.dtIni = dtIni;
	}
	public String getDtFim() {
		return dtFim;
	}
	public void setDtFim(String dtFim) {
		this.dtFim = dtFim;
	}
	public List<LancamentoDto> getLancamentoDto() {
		return lancamentoDto;
	}
	public void setLancamentoDto(List<LancamentoDto> lancamentoDto) {
		this.lancamentoDto = lancamentoDto;
	}

}

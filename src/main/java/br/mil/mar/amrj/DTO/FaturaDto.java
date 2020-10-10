package br.mil.mar.amrj.DTO;

import java.util.List;

public class FaturaDto {
	
	private Integer cdFatr;
	private String dtInic;
	private String dtFim;
	
	private List<LancamentoDto> lancamentos;
	
	public String getDtInic() {
		return dtInic;
	}
	public void setDtInic(String dtInic) {
		this.dtInic = dtInic;
	}
	public String getDtFim() {
		return dtFim;
	}
	public void setDtFim(String dtFim) {
		this.dtFim = dtFim;
	}
	public List<LancamentoDto> getLancamentos() {
		return lancamentos;
	}
	public void setLancamentos(List<LancamentoDto> lancamentos) {
		this.lancamentos = lancamentos;
	}
	public Integer getCdFatr() {
		return cdFatr;
	}
	public void setCdFatr(Integer cdFatr) {
		this.cdFatr = cdFatr;
	}

}

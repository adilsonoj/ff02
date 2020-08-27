package br.mil.mar.amrj.DTO;

import java.math.BigDecimal;

public class FaturaDto {
	
	private String dtIni;
	private String dtFim;
	private Integer cdTipoLanc;
	private BigDecimal vlLanc;
	
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
	public Integer getCdTipoLanc() {
		return cdTipoLanc;
	}
	public void setCdTipoLanc(Integer cdTipoLanc) {
		this.cdTipoLanc = cdTipoLanc;
	}
	public BigDecimal getVlLanc() {
		return vlLanc;
	}
	public void setVlLanc(BigDecimal vlLanc) {
		this.vlLanc = vlLanc;
	}	

}

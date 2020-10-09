package br.mil.mar.amrj.DTO;

import java.math.BigDecimal;

public class LancamentoDto {

	private BigDecimal vlLanc;
	private Integer cdTipoLanc;
	private char lgEncg;
	
	
	public BigDecimal getVlLanc() {
		return vlLanc;
	}
	public void setVlLanc(BigDecimal vlLanc) {
		this.vlLanc = vlLanc;
	}
	public Integer getCdTipoLanc() {
		return cdTipoLanc;
	}
	public void setCdTipoLanc(Integer cdTipoLanc) {
		this.cdTipoLanc = cdTipoLanc;
	}
	public char getLgEncg() {
		return lgEncg;
	}
	public void setLgEncg(char lgEncg) {
		this.lgEncg = lgEncg;
	}
	
	
	
}

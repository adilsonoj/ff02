package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_TIPO_LANC")
public class TipoLancamento {
	
	@Id
	@Column(name="CD_TIPO_LANC")
	private Integer cdTipoLanc;
	
	@Column(name="DE_TIPO_LANC")
	private String deTipoLanc;

	public Integer getCdTipoLanc() {
		return cdTipoLanc;
	}

	public void setCdTipoLanc(Integer cdTipoLanc) {
		this.cdTipoLanc = cdTipoLanc;
	}

	public String getDeTipoLanc() {
		return deTipoLanc;
	}

	public void setDeTipoLanc(String deTipoLanc) {
		this.deTipoLanc = deTipoLanc;
	}
	
	

}

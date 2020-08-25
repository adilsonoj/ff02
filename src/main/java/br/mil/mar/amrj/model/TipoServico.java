package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_TIPO_SERV")
public class TipoServico {

	@Id
	@Column(name="CD_TIPO_SERV")
	private Integer cdTipoServ;
	
	@Column(name="DE_CLAS_FATR")
	private String deTipoServ;

	public Integer getCdTipoServ() {
		return cdTipoServ;
	}

	public void setCdTipoServ(Integer cdTipoServ) {
		this.cdTipoServ = cdTipoServ;
	}

	public String getDeTipoServ() {
		return deTipoServ;
	}

	public void setDeTipoServ(String deTipoServ) {
		this.deTipoServ = deTipoServ;
	}
	
	
}

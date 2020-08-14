package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_TIPO_CONS")
public class TipoConsumo {
	
	@Id
	@Column(name="CD_TIPO_CONS")
	private Integer cdTipoCons;
	
	@Column(name="DE_TIPO_CONS")
	private String deTipoCons;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_SERV", referencedColumnName="CD_TIPO_SERV")
	private TipoServico tipoServico;

	public Integer getCdTipoCons() {
		return cdTipoCons;
	}

	public void setCdTipoCons(Integer cdTipoCons) {
		this.cdTipoCons = cdTipoCons;
	}

	public String getDeTipoCons() {
		return deTipoCons;
	}

	public void setDeTipoCons(String deTipoCons) {
		this.deTipoCons = deTipoCons;
	}

	public TipoServico getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(TipoServico tipoServico) {
		this.tipoServico = tipoServico;
	}
	
	

}

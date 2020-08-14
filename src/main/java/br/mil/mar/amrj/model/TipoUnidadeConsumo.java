package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_TIPO_UNID_CONS")
public class TipoUnidadeConsumo {

	@Id
	@Column(name="CD_TIPO_UNID_CONS")
	private Integer cdTipoUnidCons;
	
	@Column(name="DE_TIPO_UNID_CONS")
	private String deTipoUnidCons;

	public Integer getCdTipoUnidCons() {
		return cdTipoUnidCons;
	}

	public void setCdTipoUnidCons(Integer cdTipoUnidCons) {
		this.cdTipoUnidCons = cdTipoUnidCons;
	}

	public String getDeTipoUnidCons() {
		return deTipoUnidCons;
	}

	public void setDeTipoUnidCons(String deTipoUnidCons) {
		this.deTipoUnidCons = deTipoUnidCons;
	}

	@Override
	public String toString() {
		return "TipoUnidConsumo [cdTipoUnidCons=" + cdTipoUnidCons + ", deTipoUnidCons=" + deTipoUnidCons + "]";
	}
	
	
}

package br.mil.mar.amrj.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@GenericGenerator(name = "FFSQ203", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ203") })
@Table(name="FFVU_MODL_FATR")
public class ModalidadeFatura implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ203")
	@Column(name="CD_MODL_FATR")
	private Integer cdModlFatr;
	
	@Column(name="DE_TIPO_FATR")
	private String deTipoFatr;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_SERV", referencedColumnName="CD_TIPO_SERV")
	private TipoServico tipoServico;
	
	

	public Integer getCdModlFatr() {
		return cdModlFatr;
	}

	public void setCdModlFatr(Integer cdModlFatr) {
		this.cdModlFatr = cdModlFatr;
	}

	public String getDeTipoFatr() {
		return deTipoFatr;
	}

	public void setDeTipoFatr(String deTipoFatr) {
		this.deTipoFatr = deTipoFatr;
	}

	public TipoServico getTipoServico() {
		return tipoServico;
	}

	public void setTipoServico(TipoServico tipoServico) {
		this.tipoServico = tipoServico;
	}

	
	
	
}

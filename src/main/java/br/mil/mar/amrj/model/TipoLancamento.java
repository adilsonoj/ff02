package br.mil.mar.amrj.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity

@Table(name="FFVU_TIPO_LANC")
public class TipoLancamento implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="CD_TIPO_LANC")
	private Integer cdTipoLanc;
	
	@Column(name="DE_TIPO_LANC")
	private String deTipoLanc;
	
	@Column(name="LG_ENCG")
	private char lgEncg;
	

	@ManyToOne
	@JoinColumn(name="CD_MODL_FATR", referencedColumnName="CD_MODL_FATR")
	private ModalidadeFatura modalidadeFatura;


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

	public char getLgEncg() {
		return lgEncg;
	}

	public void setLgEncg(char lgEncg) {
		this.lgEncg = lgEncg;
	}

	public ModalidadeFatura getModalidadeFatura() {
		return modalidadeFatura;
	}

	public void setModalidadeFatura(ModalidadeFatura modalidadeFatura) {
		this.modalidadeFatura = modalidadeFatura;
	}



	
	
	
	

}

package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_MODL_FATR")
public class ModalidadeFatura {

	@Id
	@Column(name="CD_MODL_FATR")
	private Integer cdModlFatr;
	@Column(name="DE_TIPO_FATR")
	private String deTipoFatr;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_SERV", referencedColumnName="CD_TIPO_SERV")
	private TipoServico tipoServico;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_LANC", referencedColumnName="CD_TIPO_LANC")
	private TipoLancamento tipoLancamento;

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

	public TipoLancamento getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(TipoLancamento tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}
	
	
}

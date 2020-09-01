package br.mil.mar.amrj.model;

import java.io.Serializable;
import java.math.BigDecimal;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@GenericGenerator(name = "FFSQ201", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ201") })
@Table(name="FFVU_LANC")
public class Lancamento implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ201")
	@Column(name="CD_LANC")
	private Integer cdLanc;
	
	@Column(name="VL_LANC")
	private BigDecimal vlLanc;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_LANC", referencedColumnName="CD_TIPO_LANC")
	private TipoLancamento tipoLancamento;
	
	@ManyToOne
	@JoinColumn(name="CD_FATR", referencedColumnName="CD_FATR")
	@JsonIgnore
	private FaturaServico faturaServico;

	
	public BigDecimal getVlLanc() {
		return vlLanc;
	}

	public void setVlLanc(BigDecimal vlLanc) {
		this.vlLanc = vlLanc;
	}

	public Integer getCdLanc() {
		return cdLanc;
	}

	public void setCdLanc(Integer cdLanc) {
		this.cdLanc = cdLanc;
	}

	public TipoLancamento getTipoLancamento() {
		return tipoLancamento;
	}

	public void setTipoLancamento(TipoLancamento tipoLancamento) {
		this.tipoLancamento = tipoLancamento;
	}

	public FaturaServico getFaturaServico() {
		return faturaServico;
	}

	public void setFaturaServico(FaturaServico faturaServico) {
		this.faturaServico = faturaServico;
	}
	
}

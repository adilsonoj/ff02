package br.mil.mar.amrj.model;

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

@Entity
@Table(name = "FFVU_LANC")
@GenericGenerator(name = "FFSQ201", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ201") })
public class Lancamento {
	
	@Id
	@Column(name = "CD_LANC")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ201")
	private Integer cdLanc;
	
	@Column(name = "VL_LANC")
	private BigDecimal vlLancdeTipoLanc;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_LANC", referencedColumnName="CD_TIPO_LANC")
	private TipoLancamento tipoLancamento;
	
	@ManyToOne
	@JoinColumn(name="CD_FATR", referencedColumnName="CD_FATR")
	private FaturaServico faturaServico;

	public Integer getCdLanc() {
		return cdLanc;
	}

	public void setCdLanc(Integer cdLanc) {
		this.cdLanc = cdLanc;
	}

	public BigDecimal getVlLancdeTipoLanc() {
		return vlLancdeTipoLanc;
	}

	public void setVlLancdeTipoLanc(BigDecimal vlLancdeTipoLanc) {
		this.vlLancdeTipoLanc = vlLancdeTipoLanc;
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

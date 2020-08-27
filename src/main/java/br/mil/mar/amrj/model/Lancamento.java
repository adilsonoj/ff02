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
@GenericGenerator(name = "FFSQ201", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ201") })
@Table(name="FFVU_LANC")
public class Lancamento {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ201")
	@Column(name="CD_LANC")
	private Integer cdLanc;
	
	@Column(name="VL_LANC")
	private BigDecimal vlMddaCons;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_LANC", referencedColumnName="CD_TIPO_LANC")
	private TipoLancamento tipoLancamento;
	
	@ManyToOne
	@JoinColumn(name="CD_FATR", referencedColumnName="CD_FATR")
	private FaturaServico faturaServico;

	public BigDecimal getVlMddaCons() {
		return vlMddaCons;
	}

	public void setVlMddaCons(BigDecimal vlMddaCons) {
		this.vlMddaCons = vlMddaCons;
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

package br.mil.mar.amrj.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_MDDA_CONS")
public class MedicaoConsumo {

	@Id
	@Column(name="CD_MDDA_CONS")
	private Integer cdMddaCons;
	
	@Column(name="VL_MDDA_CONS")
	private BigDecimal vlMddaCons;
	
	@Column(name="DT_MDDA_CONS")
	private LocalDate dtMddaCons;
	
	@ManyToOne
	@JoinColumn(name="CD_UNID_CONS", referencedColumnName="CD_UNID_CONS")
	private UnidadeConsumo unidadeConsumo;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_CONS", referencedColumnName="CD_TIPO_CONS")
	private TipoConsumo tipoConsumo;

	public Integer getCdMddaCons() {
		return cdMddaCons;
	}

	public void setCdMddaCons(Integer cdMddaCons) {
		this.cdMddaCons = cdMddaCons;
	}

	public BigDecimal getVlMddaCons() {
		return vlMddaCons;
	}

	public void setVlMddaCons(BigDecimal vlMddaCons) {
		this.vlMddaCons = vlMddaCons;
	}

	public LocalDate getDtMddaCons() {
		return dtMddaCons;
	}

	public void setDtMddaCons(LocalDate dtMddaCons) {
		this.dtMddaCons = dtMddaCons;
	}

	public UnidadeConsumo getUnidadeConsumo() {
		return unidadeConsumo;
	}

	public void setUnidadeConsumo(UnidadeConsumo unidadeConsumo) {
		this.unidadeConsumo = unidadeConsumo;
	}

	public TipoConsumo getTipoConsumo() {
		return tipoConsumo;
	}

	public void setTipoConsumo(TipoConsumo tipoConsumo) {
		this.tipoConsumo = tipoConsumo;
	}
	
	
}

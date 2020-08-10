package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_UNID_CONS")
public class UnidadeConsumo {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="CD_UNID_CONS")
	private Integer cdUnidCons;
	
	@Column(name="DE_UNID_CONS", unique=true, nullable=false)
	private String deUnidCons;
	
	@ManyToOne
	@JoinColumn(name="CD_TIPO_UNID_CONS", referencedColumnName="CD_TIPO_UNID_CONS")
	private TipoUnidConsumo tipoUnidConsumo;
	
	@ManyToOne
	@JoinColumn(name="ID_CLIE_CAP", referencedColumnName="ID_CLIE_CAP")
	private Cliente cliente;

	public Integer getCdUnidCons() {
		return cdUnidCons;
	}

	public void setCdUnidCons(Integer cdUnidCons) {
		this.cdUnidCons = cdUnidCons;
	}

	public String getDeUnidCons() {
		return deUnidCons;
	}

	public void setDeUnidCons(String deUnidCons) {
		this.deUnidCons = deUnidCons;
	}

	public TipoUnidConsumo getTipoUnidConsumo() {
		return tipoUnidConsumo;
	}

	public void setTipoUnidConsumo(TipoUnidConsumo tipoUnidConsumo) {
		this.tipoUnidConsumo = tipoUnidConsumo;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	@Override
	public String toString() {
		return "UnidadeConsumo [cdUnidCons=" + cdUnidCons + ", deUnidCons=" + deUnidCons + ", tipoUnidConsumo="
				+ tipoUnidConsumo + ", cliente=" + cliente + "]";
	}
	
	
}

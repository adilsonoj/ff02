package br.mil.mar.amrj.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@GenericGenerator(name = "FFSQ200", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ200") })
@Table(name="FFVU_FATR_SERV")
public class FaturaServico implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ200")
	@Column(name="CD_FATR_SERV")
	private Integer cdFatr;
	@Column(name="DT_INIC")
	private LocalDate dtInic;
	@Column(name="DT_FIM")
	private LocalDate dtFim;
	@Column(name="LG_ATIV")
	private char lgAtiv;
	
	
	@ManyToOne
	@JoinColumn(name="CD_MODL_FATR", referencedColumnName="CD_MODL_FATR")
	private ModalidadeFatura modalidadeFatura;
	
	@OneToMany(mappedBy = "faturaServico")
	
	private List<Lancamento> lancamentos;


	public FaturaServico(Integer cdFatr, LocalDate dtInic, LocalDate dtFim, ModalidadeFatura modalidadeFatura,
			List<Lancamento> lancamentos) {
		super();
		this.cdFatr = cdFatr;
		this.dtInic = dtInic;
		this.dtFim = dtFim;
		this.modalidadeFatura = modalidadeFatura;
		this.lancamentos = lancamentos;
	}



	public FaturaServico() {
		super();
	}



	public Integer getCdFatr() {
		return cdFatr;
	}

	public void setCdFatr(Integer cdFatr) {
		this.cdFatr = cdFatr;
	}

	public LocalDate getDtInic() {
		return dtInic;
	}

	public void setDtInic(LocalDate dtInic) {
		this.dtInic = dtInic;
	}

	public LocalDate getDtFim() {
		return dtFim;
	}

	public void setDtFim(LocalDate dtFim) {
		this.dtFim = dtFim;
	}

	public ModalidadeFatura getModalidadeFatura() {
		return modalidadeFatura;
	}

	public void setModalidadeFatura(ModalidadeFatura modalidadeFatura) {
		this.modalidadeFatura = modalidadeFatura;
	}

	public List<Lancamento> getLancamentos() {
		return lancamentos;
	}

	public void setLancamentos(List<Lancamento> lancamentos) {
		this.lancamentos = lancamentos;
	}

	public char getLgAtiv() {
		return lgAtiv;
	}

	public void setLgAtiv(char lgAtiv) {
		this.lgAtiv = lgAtiv;
	}


	
}

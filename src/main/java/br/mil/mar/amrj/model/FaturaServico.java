package br.mil.mar.amrj.model;

import java.time.LocalDate;

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
@GenericGenerator(name = "FFSQ200", strategy = "sequence", parameters = {
		@Parameter(name = "sequence", value = "FFSQ200") })
@Table(name="FFVU_FATR_SERV")
public class FaturaServico {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="FFSQ200")
	@Column(name="CD_FATR")
	private Integer cdFatr;
	@Column(name="DT_INIC")
	private LocalDate dtInic;
	@Column(name="DT_FIM")
	private LocalDate dtFim;
	
	@ManyToOne
	@JoinColumn(name="CD_MODL_FATR", referencedColumnName="CD_MODL_FATR")
	private ModalidadeFatura modalidadeFatura;

	
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

	
	
	

}

package br.mil.mar.amrj.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="FFVU_CLIE")
public class Cliente {
	
	@Id
	@Column(name="ID_CLIE_CAP")
	private String idClieCap;
	
	@Column(name="DE_CLIE_CAP")
	private String deClieCap;

	public String getIdClieCap() {
		return idClieCap;
	}

	public void setIdClieCap(String idClieCap) {
		this.idClieCap = idClieCap;
	}

	public String getDeClieCap() {
		return deClieCap;
	}

	public void setDeClieCap(String deClieCap) {
		this.deClieCap = deClieCap;
	}

	@Override
	public String toString() {
		return "Cliente [idClieCap=" + idClieCap + ", deClieCap=" + deClieCap + "]";
	}
	
	
}

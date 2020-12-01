package com.mentor.action;

import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;

import com.mentor.impl.ExportOrderIssueReportImpl;
import com.mentor.impl.StockRegisterImpl;

public class ExportOrderIssueReportAction {

	



	ExportOrderIssueReportImpl impl = new ExportOrderIssueReportImpl();
	
	private Date fromDate;
	private Date toDate;
	private boolean printFlag;
	private String pdfName;
	private String hidden;
	private String radio;
	private String exlname;
	private String name;
	private int disId;
	public int getDisId() {
		return disId;
	}

	public void setDisId(int disId) {
		this.disId = disId;
	}

	public String getHidden() {
		try{
			//new ExportOrderIssueReportImpl().getDetails(this);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}

	public void setHidden(String hidden) {
		this.hidden = hidden;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public boolean isPrintFlag() {
		return printFlag;
	}

	public void setPrintFlag(boolean printFlag) {
		this.printFlag = printFlag;
	}

	public String getPdfName() {
		return pdfName;
	}

	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
	}


	public String getRadio() {
		return radio;
	}

	public void setRadio(String radio) {
		this.radio = radio;
	}

	public String getExlname() {
		return exlname;
	}

	public void setExlname(String exlname) {
		this.exlname = exlname;
	}

	public void radioListener(ValueChangeEvent e) {

		this.printFlag = false;
	}

	public void print() {
		if(this.fromDate!=null && this.toDate!=null){
		impl.printReport(this);
		}else{
			FacesContext.getCurrentInstance().addMessage(null,new FacesMessage(FacesMessage.SEVERITY_ERROR,
					"Please Select Date !!", "Please Select Date !!"));
		}
	
	}

	public void reset() {
		this.printFlag = false;
		this.pdfName = null;
		this.fromDate = null;
		this.toDate = null;
		

	}

}

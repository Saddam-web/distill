package com.mentor.action;

import java.util.Date;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import com.mentor.impl.SaleAND_DutyFromWholesaleImpl;

public class SaleAND_DutyFromWholesaleAction {
	SaleAND_DutyFromWholesaleImpl impl = new SaleAND_DutyFromWholesaleImpl();
	private String radioType;
	private Date production_dt;

	public String getRadioType() {
		return radioType;
	}

	public void setRadioType(String radioType) {
		this.radioType = radioType;
	}

	public Date getProduction_dt() {
		return production_dt;
	}

	public void setProduction_dt(Date production_dt) {
		this.production_dt = production_dt;
	}

	private boolean printFlag;
	private String pdfName;
	private Date formdate;
	private Date todate;

	public Date getTodate() {
		return todate;
	}

	public void setTodate(Date todate) {
		this.todate = todate;
	}

	public Date getFormdate() {
		return formdate;
	}

	public void setFormdate(Date formdate) {
		this.formdate = formdate;
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

	public void print() {

		try {
			if (this.todate != null && this.formdate != null) {
				impl.printReport(this);
			} else {

				FacesContext.getCurrentInstance().addMessage(
						null,
						new FacesMessage(FacesMessage.SEVERITY_ERROR,
								" Please Select Dates !!",
								" Please Select Dates !!"));
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	private boolean excelFlag = false;
	private String exlname;

	public boolean isExcelFlag() {
		return excelFlag;
	}

	public void setExcelFlag(boolean excelFlag) {
		this.excelFlag = excelFlag;
	}

	public String getExlname() {
		return exlname;
	}

	public void setExlname(String exlname) {
		this.exlname = exlname;
	}

	public void reset() {

		this.formdate = null;
		this.todate = null;
		this.radioType = null;
		this.excelFlag = false;
		this.printFlag = false;
	}

	public void excel() {

		try {
			System.out.println("===========excsagcvhacbv");
			if (this.formdate != null && this.todate != null) {
                 if(this.radioType != null){
				if (this.radioType.equalsIgnoreCase("D")) {
					impl.printExcel_Detailed(this);
				} else {
					impl.printExcel_Consolidated(this);
				}
                 }
                 else {

     				FacesContext.getCurrentInstance().addMessage(
     						null,
     						new FacesMessage(FacesMessage.SEVERITY_ERROR,
     								" Please Select Radio Value !!",
     								" Please Select Radio Value !!"));
     			}
				System.out.println("====excel");
				// impl.printExcel(this);
			} else {

				FacesContext.getCurrentInstance().addMessage(
						null,
						new FacesMessage(FacesMessage.SEVERITY_ERROR,
								" Please Select Dates !!",
								" Please Select Dates !!"));
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	/*
	 * public void excel() throws ParseException {
	 * 
	 * 
	 * 
	 * 
	 * if(this.production_dt != null) {
	 * 
	 * if(this.radioType.equalsIgnoreCase("DR")) { impl.printExcel(this); } else
	 * { //impl.excelDitrictWise(this); }
	 * 
	 * 
	 * }else { FacesContext.getCurrentInstance().addMessage( null, new
	 * FacesMessage(FacesMessage.SEVERITY_ERROR, "Kindly Select Month!!",
	 * "Kindly Select Month!!")); }
	 * 
	 * }
	 */

}

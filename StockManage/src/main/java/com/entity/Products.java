package com.entity;

import java.sql.Time;
import java.util.Date;
import java.util.TimeZone;
public class Products {
	private int id;
	private String materialName;
	private int hsn;
	private double rate;
	private int qty;
	private double gst;
	private double total;
	private Date date;
	private double cgst;
	private double weight;
	private String ledgerName;
	private String contactNo;
	private String email;
	private int ledgerId;
	private double igst;
	private Time time;
	private String unit;
	public Products(int id, String materialName, int hsn, double rate, int qty, double gst, double total,Date date ,
			double cgst,double weight,String ledgerName,String contactNo,String email,int ledgerId, double igst, Time time,
			String unit) {
		super();
		this.id = id;
		this.materialName = materialName;
		this.hsn = hsn;
		this.rate = rate;
		this.qty = qty;
		this.gst = gst;
		this.total = total;
		this.date=date;
		this.cgst=cgst;
		this.weight=weight;
		this.ledgerName=ledgerName;
		this.contactNo=contactNo;
		this.email=email;
		this.ledgerId=ledgerId;
		this.igst = igst;
		this.time = time;
		this.unit = unit;
	}
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public int getHsn() {
		return hsn;
	}
	public void setHsn(int hsn) {
		this.hsn = hsn;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public double getGst() {
		return gst;
	}
	public void setGst(double gst) {
		this.gst = gst;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getCgst() {
		return cgst;
	}
	public void setCgst(double cgst) {
		this.cgst = cgst;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	
	public String getLedgerName() {
		return ledgerName;
	}
	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getLedgerId() {
		return ledgerId;
	}
	public void setLedgerId(int ledgerId) {
		this.ledgerId = ledgerId;
	}
	
	
	public double getIgst() {
		return igst;
	}
	public void setIgst(double igst) {
		this.igst = igst;
	}
	
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@Override
	public String toString() {
		return "Products [id=" + id + ", materialName=" + materialName + ", hsn=" + hsn + ", rate=" + rate + ", qty="
				+ qty + ", gst=" + gst + ", total=" + total + ", date=" + date + ", cgst=" + cgst + ", weight=" + weight
				+ ", ledgerName=" + ledgerName + ", contactNo=" + contactNo + ", email=" + email + ", ledgerId="
				+ ledgerId + ", igst=" + igst + ", time=" + time + ", unit=" + unit + "]";
	}
}

package com.entity;

import java.sql.Time;
import java.util.Date;

public class SaleProduct {
	private int id;
	private String customerName;
	private String cutContact;
	private String cutEmial;
	private String cutAddress;
	private String payMode;
	
	private String materialName;
	private int hsn;
	private double weight;
	private int qty;
	private double gst;
	private double total;
	private Date date;
	private Time time;
	private String unit;
	public SaleProduct(int id, String customerName, String cutContact, String cutEmial, String cutAddress,
			String payMode, String materialName, int hsn, double weight, 
			int qty, double gst, double total, Date date, Time time, String unit) {
		super();
		this.id = id;
		this.customerName = customerName;
		this.cutContact = cutContact;
		this.cutEmial = cutEmial;
		this.cutAddress = cutAddress;
		this.payMode = payMode;
		this.materialName = materialName;
		this.hsn = hsn;
		this.weight = weight;
		this.qty = qty;
		this.gst = gst;
		this.total = total;
		this.date = date;
		this.time = time;
		this.unit = unit;
	}
	public SaleProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCutContact() {
		return cutContact;
	}
	public void setCutContact(String cutContact) {
		this.cutContact = cutContact;
	}
	public String getCutEmial() {
		return cutEmial;
	}
	public void setCutEmial(String cutEmial) {
		this.cutEmial = cutEmial;
	}
	public String getCutAddress() {
		return cutAddress;
	}
	public void setCutAddress(String cutAddress) {
		this.cutAddress = cutAddress;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
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
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
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
		return "SaleProduct [id=" + id + ", customerName=" + customerName + ", cutContact=" + cutContact + ", cutEmial="
				+ cutEmial + ", cutAddress=" + cutAddress + ", payMode=" + payMode + ", materialName=" + materialName
				+ ", hsn=" + hsn + ", weight=" + weight + ", qty=" + qty + ", gst=" + gst + ", total=" + total
				+ ", date=" + date + ", time=" + time + ", unit=" + unit + "]";
	}
	


	
	
	
}

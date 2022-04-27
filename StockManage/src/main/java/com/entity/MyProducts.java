package com.entity;

public class MyProducts {
	private int id;
	private String materialName;
	private int hsn;
	private double weight;
	private int quantity;
	private double rate;
	private String unit;
	public MyProducts(int id, String materialName, int hsn, double weight, 
			int quantity, double rate, String unit) {
		super();
		this.id = id;
		this.materialName = materialName;
		this.hsn = hsn;
		this.weight = weight;
		this.quantity = quantity;
		this.rate = rate;
		this.unit = unit;
	}
	public MyProducts() {
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
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	@Override
	public String toString() {
		return "MyProducts [id=" + id + ", materialName=" + materialName + ", hsn=" + hsn + ", weight=" + weight
				+ ", quantity=" + quantity + ", rate=" + rate + ", unit=" + unit + "]";
	}

	
	
}

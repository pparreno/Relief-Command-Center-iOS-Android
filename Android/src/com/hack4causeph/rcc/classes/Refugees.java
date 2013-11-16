package com.hack4causeph.rcc.classes;

public class Refugees {

	String mStatus, mSex, mStreetName, mNeighborhood, mCity, mProvince, mDescription, mSourceName, mSourceContactNo, mLastKnownLoc, mGivenName, mFamilyName, mContactRef;
	int mAge;
	
	public void setGivenName(String GiveName){
		this.mGivenName = GiveName;
	}
	
	public void setFamilyName(String familyName){
		this.mFamilyName = familyName;
	}
	
	public void setSex(String sex){
		this.mSex = sex;
	}
	
	public void setStatus(String status){
		this.mStatus = status;
	}
	
	public void setStreetName(String streetname){
		this.mStreetName = streetname;
	}
	
	public void  setNeighborhood(String neighborhood) {
		this.mNeighborhood =neighborhood;
	}
	
	public void setCity(String city){
		this.mCity = city;
	}
	
	public void setProvince(String province){
		this.mProvince = province;
	}
	
	public void setDescription(String description){
		this.mDescription = description;
	}
	
	public void setSourceName(String sourcename) {
		this.mSourceName = sourcename;
	}
	
	public void setSourceContact(String sourceContact){
		this.mSourceContactNo = sourceContact;
	}
	
	public void setLastKnowLocation(String lastknownlocation){
		this.mLastKnownLoc = lastknownlocation;
	}
	
	public void setAge(int age){
		this.mAge = age;
	}
	
	//getters
	
	public String getGivenName(){
		return this.mGivenName;
	}
	
	public String getFamilyName(){
		return this.mFamilyName;
	}
	
	public String getSex(){
		return this.mSex;
	}
	
	public String getStatus(){
		return this.mStatus;
	}
	
	public String getStreetName(){
		return this.mStreetName;
	}
	
	public String  getNeighborhood() {
		return this.mNeighborhood;
	}
	
	public String getCity(){
		return this.mCity;
	}
	
	public String getProvince(){
		return this.mProvince;
	}
	
	public String getDescription(){
		return this.mDescription;
	}
	
	public String getSourceName() {
		return this.mSourceName;
	}
	
	public String getSourceContact(){
		return this.mSourceContactNo;
	}
	
	public String getLastKnowLocation(){
		return this.mLastKnownLoc;
	}
	
	public int getAge(){
		return this.mAge;
	}
}

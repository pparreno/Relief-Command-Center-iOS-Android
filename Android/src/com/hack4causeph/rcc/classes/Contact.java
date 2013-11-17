package com.hack4causeph.rcc.classes;

public class Contact {
	
	String mGivenName,mFamilyName,mMobileNo1,mMobileNo2,mTellNo2,mTellNo1,mAddress1,mAddress2,mEmail,mProff,mPurpose;
	String mCreatedAt, mUpdatedAt;
	boolean is_volunteer;
	//setters
	
	public void setGivenName(String GiveName){
		this.mGivenName = GiveName;
	}
	
	public void setFamilyName(String FamilyName){
		this.mFamilyName = FamilyName;
	}
	
	public void setTellNo1(String tellNo1){
		this.mTellNo1 = tellNo1;
	}
	
	public void setTellNo2(String tellNo2){
		this.mTellNo2 = tellNo2;
	}
	
	public void setMobile1(String mobile1){
		this.mMobileNo1 = mobile1;
	}
	
	public void setMobile2(String mobile2){
		this.mMobileNo2 = mobile2;
	}
	
	public void setAddress1(String address1){
		this.mAddress1 = address1;
	}
	
	public void setAddress2(String address2){
		this.mAddress2 = address2;
	}
	
	public void setEmail(String email){
		this.mEmail = email;
	}
	
	public void setProff(String profession){
		this.mProff = profession;
	}
	
	public void setPurpose(String purpose){
		this.mPurpose = purpose;
	}
	
	public void setIsVolunteer(boolean isVolunteer){
		this.is_volunteer = isVolunteer;
	}
	
	public void setCreatedAt(String createdAt){
		this.mCreatedAt = createdAt;
	}
	
	public void setUpdatedAt(String updatedAt) {
		this.mUpdatedAt = updatedAt;
	}
	//getters
	
	public String getGivenName(){
		return this.mGivenName;
	}
	
	public String getFamilyName(){
		return this.mFamilyName;
	}
	
	public String getAddress1(){
		return this.mAddress1;
	}
	
	public String getAddress2(){
		return this.mAddress2;
	}
	
	public String getMobile1(){
		return this.mMobileNo1;
	}
	
	public String getMobile2(){
		return this.mMobileNo2;
	}
	
	public String getEmail(){
		return this.mEmail;
	}
	
	public String getPurpose(){
		return this.mPurpose;
	}
	
	public String getProfession(){
		return this.mProff;
	}
	
	public boolean getIsVolunteer() {
		return this.is_volunteer;
	}
	
	public String getCreatedAt() {
		return this.mCreatedAt;
	}
	
	public String getUpdatedAt() {
		return this.mUpdatedAt;
	}
}

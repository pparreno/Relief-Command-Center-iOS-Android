package com.hack4causeph.rcc.helper;

import java.util.ArrayList;
import com.hack4causeph.rcc.classes.Refugees;

public class DataHelperClass {

	private static DataHelperClass datahelper = null;
	
	
	private ArrayList<Refugees> mListRefugees;
	
	protected DataHelperClass() {
	   // Exists only to defeat instantiation.
		 initialzeAllVariale();
	}
	public static DataHelperClass getInstance() {
	   if(datahelper == null) {
		   datahelper = new DataHelperClass();
	   }
	   return datahelper;
	}
	
	private void initialzeAllVariale(){
		mListRefugees = new ArrayList<Refugees>();
	}
	
	//setters
	public void setListOfRefugees(Refugees listRef){
		this.mListRefugees.add(listRef);
	}
	
	//getters
	public ArrayList<Refugees> getListRefugees(){
		return this.mListRefugees;
	}
	
}

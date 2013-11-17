package com.hack4causeph.rcc;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

public class RefugeeeInfo extends Activity {

	private TextView fname,lname,sex,status,age,street_address,city,province,last_known_location;
	private TextView headerTitle;
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);
	    requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, 
                                WindowManager.LayoutParams.FLAG_FULLSCREEN);
	    setContentView(R.layout.refugee_info);
	
	    setAllTextViews();
	    
	}

	 public void setAllTextViews(){	
		 
	    	Bundle extras = getIntent().getExtras();
	    	
	    	headerTitle = (TextView)findViewById(R.id.headerTitle);
	    	headerTitle.setText("Refugee Information");
	    	
	    	fname=(TextView)findViewById(R.id.fname);
	    	fname.setText(extras.getString("given_name"));
	    	
	    	lname=(TextView)findViewById(R.id.lname);
	    	lname.setText(extras.getString("family_name"));
	    	
	    	sex=(TextView)findViewById(R.id.sex);
	    	sex.setText(extras.getString("sex"));
	    	
	    	status=(TextView)findViewById(R.id.status);
	    	status.setText(extras.getString("status"));
	    	
	    	age=(TextView)findViewById(R.id.age);
	    	age.setText(extras.getString("age"));
	    	
	    	street_address=(TextView)findViewById(R.id.street_address);
	    	street_address.setText(extras.getString("street_address"));
	    	
	    	city=(TextView)findViewById(R.id.city);
	    	city.setText(extras.getString("city"));
	    	
	    	province=(TextView)findViewById(R.id.province);
	    	province.setText(extras.getString("province"));
	    	
	    	last_known_location=(TextView)findViewById(R.id.last_known_location);
	    	last_known_location.setText(extras.getString("last_known_location"));
	    	
	    	
	    }
}

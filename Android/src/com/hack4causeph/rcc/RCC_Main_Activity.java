package com.hack4causeph.rcc;

import java.util.ArrayList;

import com.hack4causeph.rcc.adapters.CustomListAdapter;
import com.hack4causeph.rcc.classes.Refugees;
import com.hack4causeph.rcc.helper.DataHelperClass;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

public class RCC_Main_Activity extends Activity {

	
	private ListView mListView;
	private CustomListAdapter mAdapter;
	private ArrayList<Refugees> mListRefugees;
	private TextView headerTitle;
	private DataHelperClass datahelper;
	
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, 
                                WindowManager.LayoutParams.FLAG_FULLSCREEN);
	    setContentView(R.layout.activity_rcc__main_);
	   
	    initialize();
	    listViewListeners();
        
    }

    private void initialize(){
		
		headerTitle = (TextView)findViewById(R.id.headerTitle);
    	headerTitle.setText("List Of Refugees");
		mListRefugees = new ArrayList<Refugees>();
		mListView = (ListView)findViewById(R.id.listView);
		gatheringData();
		
		mAdapter = new CustomListAdapter(getApplicationContext(),R.layout.item_row,mListRefugees);
		mListView.setAdapter(mAdapter);
	
	
	}
	
	private void gatheringData(){
		
		Refugees itemSample = new Refugees();
		itemSample.setGivenName("PNoy");
		itemSample.setFamilyName("Aquino");
		itemSample.setAge(45);
		itemSample.setCity("Cebu City");
		itemSample.setNeighborhood("Mariam");
		itemSample.setDescription("Is Okay and Alive");
		itemSample.setProvince("Cebu");
		itemSample.setSex("Male");
		itemSample.setSourceContact("12343556");
		itemSample.setSourceName("Military");
		itemSample.setStatus("Found");
		itemSample.setStreetName("Maligaya Street");
		
		DataHelperClass.getInstance().setListOfRefugees(itemSample);
		
		mListRefugees = DataHelperClass.getInstance().getListRefugees();
	}
	
	private void listViewListeners(){
		
		mListView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position,
					long id) {
				// TODO Auto-generated method stub
				goDetails(mListRefugees.get(position));
			}
		});
		
	}
   
   public void goAddRefugess(View view){
	   Intent addR = new Intent(this, AddRefugees.class);
	   startActivity(addR);
   }
    
   private void goDetails(Refugees refugee){
	   Intent details = new Intent(this, RefugeeeInfo.class);
   }
}

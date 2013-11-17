package com.hack4causeph.rcc.adapters;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.ClipData.Item;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.hack4causeph.rcc.R;
import com.hack4causeph.rcc.classes.Contact;
import com.hack4causeph.rcc.classes.Refugees;

public class CustomListAdapter extends ArrayAdapter<Refugees> {

	   private ArrayList<Refugees> entries;
	   private Context activity;
	   private int layoutResource;
	 
	    public CustomListAdapter(Context context, int textViewResourceId, ArrayList<Refugees> entries) {
	        super(context, textViewResourceId, entries);
	        this.entries = entries;
	        this.activity = context;
	        this.layoutResource = textViewResourceId;
	    }
	 
	    public static class ViewHolder{
	        public TextView sureName,givenName,status;
	    }
	 
	    @Override
	    public View getView(int position, View convertView, ViewGroup parent) {
	       
	    	View v = convertView;
	        ViewHolder holder;
	        
	        if (v == null) {
	            LayoutInflater vi =
	                (LayoutInflater)activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	            v = vi.inflate(layoutResource, null);
	            holder = new ViewHolder();
	            holder.sureName = (TextView) v.findViewById(R.id.familyName);
	            holder.givenName = (TextView) v.findViewById(R.id.firstName);
	            holder.status = (TextView)v.findViewById(R.id.stats);
	            v.setTag(holder);
	        }
	        else{
	            holder=(ViewHolder)v.getTag();
	        }
	        
	        Refugees custom = entries.get(position);
	        
	        if (custom != null) {
	            holder.sureName.setText(""+custom.getFamilyName());
	            holder.givenName.setText(""+custom.getGivenName());
	            holder.status.setText(""+custom.getStatus());
	        }
	        return v;
	    }
	
}

package com.hack4causeph.rcc;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class RCC_Main_Activity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rcc__main_);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.rcc__main_, menu);
        return true;
    }
    
}

package com.hack4causeph.rcc;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;


public class AddRefugees extends Activity {

	private Button mTakePhoto, mGetFromGallery, mSubmit;
	private final int TAKE_PHOTO_RESULT = 2;
	private static final int SELECT_PICTURE = 1;
	private String selectedImagePath;
	private TextView headerTitle;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, 
                                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.addrefugees);
        
        initialize();
       
    }

  
    private void initialize(){
    	
    	this.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
    	
    	headerTitle = (TextView)findViewById(R.id.headerTitle);
    	headerTitle.setText("Add Refugees");
    	mTakePhoto = (Button)findViewById(R.id.takePhoto);
    	mGetFromGallery = (Button)findViewById(R.id.getFromGal);
    	mSubmit = (Button)findViewById(R.id.submit);
    }
    
    public void goTakePhoto(View view){
    	doTakePhotoAction();
    }
    
    public void goSubmit(View view){
    	
    }
    
    
  //add from gallery starts here
    public void goGetFromGallery(View view){
    	Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(intent,
        "Select Picture"), SELECT_PICTURE);
    }
    
    //returns image path and displays it in current layout
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (resultCode == RESULT_OK) {
            if (requestCode == SELECT_PICTURE) {
                Uri selectedImageUri = data.getData();
                selectedImagePath = getPath(selectedImageUri);
                ImageView v=(ImageView)findViewById(R.id.imageView1);
                v.setImageBitmap(getbitpam(selectedImagePath));
            }
            else if(requestCode == TAKE_PHOTO_RESULT){
            	ImageView v=(ImageView)findViewById(R.id.imageView1);
                v.setImageBitmap(getbitpam(selectedImagePath));
            }
        }
    }
    
    
    public Bitmap getbitpam(String path){
        Bitmap imgthumBitmap=null;
         try    
         {

             final int THUMBNAIL_SIZE = 128;

             FileInputStream fis = new FileInputStream(path);
              imgthumBitmap = BitmapFactory.decodeStream(fis);

             imgthumBitmap = Bitmap.createScaledBitmap(imgthumBitmap,
                    THUMBNAIL_SIZE, THUMBNAIL_SIZE, false);

            ByteArrayOutputStream bytearroutstream = new ByteArrayOutputStream(); 
            imgthumBitmap.compress(Bitmap.CompressFormat.JPEG, 100,bytearroutstream);


         }
         catch(Exception ex) {

         }
         return imgthumBitmap;
    }

    public String getPath(Uri uri) {
    	
        String[] projection = { MediaStore.Images.Media.DATA };
        Cursor cursor = managedQuery(uri, projection, null, null, null);
        int column_index = cursor
                .getColumnIndexOrThrow(MediaStore.Images.Media.DATA);
        cursor.moveToFirst();
        return cursor.getString(column_index);
    }

    
    //take photo
    
    private void doTakePhotoAction() {

        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        File fileDir = new File(Environment.getExternalStorageDirectory()
                + "/rccapp");
        if (!fileDir.exists()) {
            fileDir.mkdirs();
        }
        String imagePath = Environment.getExternalStorageDirectory() + "/rccapp/"
                + System.currentTimeMillis() + ".jpg";
        File carmeraFile = new File(imagePath);
        Uri imageCarmeraUri = Uri.fromFile(carmeraFile);

        intent.putExtra(android.provider.MediaStore.EXTRA_OUTPUT,
                imageCarmeraUri);
       
        
        try {
        	selectedImagePath = imagePath;
            intent.putExtra("return-data", true);
            startActivityForResult(intent, TAKE_PHOTO_RESULT);
           
            
        } catch (ActivityNotFoundException e) {
            // Do nothing for now
        }
    }
 }

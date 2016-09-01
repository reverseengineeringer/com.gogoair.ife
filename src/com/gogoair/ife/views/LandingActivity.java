package com.gogoair.ife.views;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.Typeface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.NavUtils;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.TextView;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;

public class LandingActivity
  extends AppCompatActivity
{
  public static final String LANDING_ADOBE_CODE_INTENT_EXTRA = "LANDING_ADOBE_CODE_INTENT_EXTRA";
  public static final String LANDING_STATE_INTENT_EXTRA = "LANDING_STATE_INTENT_EXTRA";
  private int adobeErrorCode;
  private Context context;
  private Constants.GVErrorCode currentErrorCode;
  private final BroadcastReceiver gvNetworkBroadcastReceiver = new LandingActivity.1(this);
  private Activity landingActivity;
  private GVLibraryEntry movie;
  
  private void setMessage(Constants.GVErrorCode paramGVErrorCode)
  {
    TextView localTextView1 = (TextView)findViewById(2131427410);
    TextView localTextView2 = (TextView)findViewById(2131427411);
    TextView localTextView3 = (TextView)findViewById(2131427412);
    TextView localTextView4 = (TextView)findViewById(2131427409);
    Button localButton1 = (Button)findViewById(2131427413);
    Button localButton2 = (Button)findViewById(2131427414);
    localButton1.setTypeface(Typeface.createFromAsset(getAssets(), "DINOffcPro-Bold.otf"));
    localButton1.setOnClickListener(new LandingActivity.3(this));
    localButton1.setVisibility(8);
    localButton2.setVisibility(8);
    switch (LandingActivity.4.$SwitchMap$com$gogoair$ife$utils$Constants$GVErrorCode[paramGVErrorCode.ordinal()])
    {
    default: 
      localButton2.setVisibility(0);
      if (PreferenceManager.getDefaultSharedPreferences(this).getBoolean("com.gogoair.ife.playedContent", false))
      {
        localTextView1.setText(2131034157);
        localTextView2.setText(2131034145);
        return;
      }
      break;
    case 1: 
      localTextView1.setText(2131034161);
      localTextView2.setText(2131034149);
      localTextView4.setText(2131034151);
      return;
    case 2: 
    case 3: 
      localButton1.setVisibility(0);
      localTextView1.setText(2131034158);
      localTextView2.setText(2131034146);
      localTextView3.setText(String.format("41%02d%04d", new Object[] { Integer.valueOf(paramGVErrorCode.getValue()), Integer.valueOf(adobeErrorCode) }));
      localTextView4.setText(2131034152);
      return;
    case 4: 
      localButton1.setVisibility(0);
      localTextView1.setText(2131034160);
      localTextView2.setText(2131034148);
      localTextView4.setText(2131034152);
      localTextView3.setText(String.format("41%02d%04d", new Object[] { Integer.valueOf(paramGVErrorCode.getValue()), Integer.valueOf(adobeErrorCode) }));
      return;
    case 5: 
      localTextView1.setText(2131034153);
      localTextView2.setText(2131034141);
      localTextView4.setText(2131034152);
      return;
    case 6: 
      localTextView1.setText(2131034159);
      localTextView2.setText(2131034147);
      localTextView4.setText(2131034152);
      return;
    }
    localTextView1.setText(2131034156);
    localTextView2.setText(2131034144);
  }
  
  public void onBackPressed()
  {
    NavUtils.navigateUpFromSameTask(this);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903065);
    setSupportActionBar((Toolbar)findViewById(2131427427));
    if (getSupportActionBar() != null)
    {
      getSupportActionBar().setDisplayShowTitleEnabled(false);
      getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }
    landingActivity = this;
    context = getApplicationContext();
    currentErrorCode = ((Constants.GVErrorCode)getIntent().getExtras().getSerializable("LANDING_STATE_INTENT_EXTRA"));
    movie = ((GVLibraryEntry)getIntent().getExtras().getParcelable("INTENT_EXTRA_GV_LIBRARY_ENTRY"));
    if (getIntent().getExtras().containsKey("LANDING_ADOBE_CODE_INTENT_EXTRA")) {
      adobeErrorCode = getIntent().getExtras().getInt("LANDING_ADOBE_CODE_INTENT_EXTRA");
    }
    ((Button)findViewById(2131427414)).setOnClickListener(new LandingActivity.2(this));
    setMessage(currentErrorCode);
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131492864, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return super.onOptionsItemSelected(paramMenuItem);
    }
    try
    {
      new AlertDialog.Builder(this).setTitle(getString(2131034140)).setMessage(getPackageManagergetPackageInfogetPackageName0versionName).show();
      return true;
    }
    catch (PackageManager.NameNotFoundException paramMenuItem)
    {
      for (;;)
      {
        paramMenuItem.printStackTrace();
      }
    }
  }
  
  protected void onPause()
  {
    super.onPause();
    LocalBroadcastManager.getInstance(this).unregisterReceiver(gvNetworkBroadcastReceiver);
  }
  
  protected void onResume()
  {
    super.onResume();
    LocalBroadcastManager.getInstance(this).registerReceiver(gvNetworkBroadcastReceiver, new IntentFilter("GVNETWORK_ON_NETWORK_CHANGED"));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LandingActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
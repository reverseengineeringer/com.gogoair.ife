package com.adobe.mobile;

import android.app.Activity;
import android.os.Bundle;

public abstract class AdobeMarketingActivity
  extends Activity
{
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    Config.setContext(getApplicationContext());
  }
  
  public void onPause()
  {
    super.onPause();
    Config.pauseCollectingLifecycleData();
  }
  
  public void onResume()
  {
    super.onResume();
    Config.collectLifecycleData(this);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AdobeMarketingActivity
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
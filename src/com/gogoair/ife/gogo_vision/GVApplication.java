package com.gogoair.ife.gogo_vision;

import android.app.Application;
import android.content.IntentFilter;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import com.crittercism.app.Crittercism;
import com.gogoair.ife.utils.GVLogger;
import com.gogoair.ife.utils.GVNetworkManager;

public class GVApplication
  extends Application
{
  private static final String TAG = "GVApplication";
  private static String macAddress;
  
  public static String getMacAddress()
  {
    return macAddress;
  }
  
  public void onCreate()
  {
    super.onCreate();
    Crittercism.initialize(getApplicationContext(), "55ad359363235a0f00ad8f72");
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
    localIntentFilter.addAction("android.net.wifi.STATE_CHANGE");
    registerReceiver(new GVNetworkManager(), localIntentFilter);
    macAddress = ((WifiManager)getSystemService("wifi")).getConnectionInfo().getMacAddress();
    Crittercism.setUsername(macAddress);
  }
  
  public void onLowMemory()
  {
    super.onLowMemory();
    GVLogger.getDefaultLogger().d("GVApplication", "GVAPP got a low memory warning");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.gogo_vision.GVApplication
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
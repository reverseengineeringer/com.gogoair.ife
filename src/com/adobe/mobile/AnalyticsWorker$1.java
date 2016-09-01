package com.adobe.mobile;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class AnalyticsWorker$1
  extends BroadcastReceiver
{
  AnalyticsWorker$1(AnalyticsWorker paramAnalyticsWorker) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    AnalyticsWorker.access$002(AnalyticsWorker.networkConnectivity(paramContext));
    if (AnalyticsWorker.access$000())
    {
      StaticMethods.logDebugFormat("Analytics - Network status changed (reachable)", new Object[0]);
      AnalyticsWorker.sharedInstance().kick(false);
      return;
    }
    StaticMethods.logDebugFormat("Analytics - Network status changed (unreachable)", new Object[0]);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mobile.AnalyticsWorker.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
package com.gogoair.ife.views;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class LauncherActivity$1
  extends BroadcastReceiver
{
  LauncherActivity$1(LauncherActivity paramLauncherActivity) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    this$0.runOnUiThread(new LauncherActivity.1.1(this, paramIntent, paramContext));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LauncherActivity.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
package com.gogoair.ife.views;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

class MainActivity$1
  extends BroadcastReceiver
{
  MainActivity$1(MainActivity paramMainActivity) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (MainActivity.access$000(this$0) != MainActivity.ViewState.GROUND)
    {
      Log.d("MainActivity", "We are in the air. Check network status only on user interaction.");
      return;
    }
    this$0.runOnUiThread(new MainActivity.1.1(this, paramIntent, paramContext));
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.MainActivity.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
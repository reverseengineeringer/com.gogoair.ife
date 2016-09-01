package com.gogoair.ife.views;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.gogoair.ife.utils.GVNetworkManager.GVNetworkType;

class LauncherActivity$1$1
  implements Runnable
{
  LauncherActivity$1$1(LauncherActivity.1 param1, Intent paramIntent, Context paramContext) {}
  
  public void run()
  {
    if (val$intent.getAction().equals("GVNETWORK_ON_NETWORK_CHANGED"))
    {
      GVNetworkManager.GVNetworkType localGVNetworkType = (GVNetworkManager.GVNetworkType)val$intent.getExtras().getSerializable("GVNETWORK_TYPE_INTENT_EXTRA");
      LauncherActivity.access$000(this$1.this$0, localGVNetworkType, val$context);
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LauncherActivity.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
package com.gogoair.ife.views;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVNetworkManager.GVNetworkType;

class LandingActivity$1$1
  implements Runnable
{
  LandingActivity$1$1(LandingActivity.1 param1, Intent paramIntent, Context paramContext) {}
  
  public void run()
  {
    if ((GVNetworkManager.GVNetworkType)val$intent.getExtras().getSerializable("GVNETWORK_TYPE_INTENT_EXTRA") == GVNetworkManager.GVNetworkType.off)
    {
      LandingActivity.access$002(this$1.this$0, Constants.GVErrorCode.NOWIFI);
      LandingActivity.access$100(this$1.this$0, LandingActivity.access$000(this$1.this$0));
    }
    while (LandingActivity.access$000(this$1.this$0) != Constants.GVErrorCode.NOWIFI) {
      return;
    }
    Intent localIntent = new Intent(val$context, MainActivity.class);
    this$1.this$0.startActivity(localIntent);
    this$1.this$0.finish();
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.LandingActivity.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
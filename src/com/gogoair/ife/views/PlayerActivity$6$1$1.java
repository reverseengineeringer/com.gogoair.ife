package com.gogoair.ife.views;

import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$6$1$1
  implements Runnable
{
  PlayerActivity$6$1$1(PlayerActivity.6.1 param1, long paramLong, Exception paramException) {}
  
  public void run()
  {
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.DRM_AUTH_FAIL.getValue(), (int)val$majorCode, PlayerActivity.access$300(this$2.this$1.this$0).getAppData(), val$e.getLocalizedMessage());
    PlayerActivity.access$2200(this$2.this$1.this$0, Constants.GVErrorCode.DRM_AUTH_FAIL, (int)val$majorCode);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.6.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
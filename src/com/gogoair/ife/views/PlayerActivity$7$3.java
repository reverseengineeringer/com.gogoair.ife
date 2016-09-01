package com.gogoair.ife.views;

import com.adobe.ave.drm.DRMMetadata;
import com.gogoair.ife.drm.DRMHelper;
import com.gogoair.ife.drm.DRMHelper.DRMAuthenticationListener;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$7$3
  implements DRMHelper.DRMAuthenticationListener
{
  PlayerActivity$7$3(PlayerActivity.7 param7, DRMMetadata paramDRMMetadata) {}
  
  public void onAuthenticationComplete(byte[] paramArrayOfByte)
  {
    GVLogger.getDefaultLogger().i("Player", "#onAuthenticationComplete:Auth successful. Launching content.");
    DRMHelper.acquireLicense(PlayerActivity.access$2900(this$1.this$0), val$drmMetadata, PlayerActivity.access$2600(this$1.this$0));
  }
  
  public void onAuthenticationError(long paramLong1, long paramLong2, Exception paramException)
  {
    GVLogger.getDefaultLogger().e("Player", "#onAuthenticationError:DRM authentication failed. " + paramLong1 + " 0x" + Long.toHexString(paramLong2));
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.INDIV_AUTH_FAIL.getValue(), (int)paramLong1, PlayerActivity.access$300(this$1.this$0).getAppData(), "Indiv auth failed.");
    this$1.setupPlayer();
  }
  
  public void onAuthenticationStart()
  {
    GVLogger.getDefaultLogger().i("Player", "#onAuthenticationStart:DRM authentication started.");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.7.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
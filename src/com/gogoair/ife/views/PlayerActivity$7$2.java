package com.gogoair.ife.views;

import com.adobe.ave.drm.DRMLicense;
import com.gogoair.ife.drm.DRMHelper.DRMLicenseAcquisitionListener;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$7$2
  implements DRMHelper.DRMLicenseAcquisitionListener
{
  PlayerActivity$7$2(PlayerActivity.7 param7) {}
  
  public void onAcquired(DRMLicense paramDRMLicense)
  {
    GVLogger.getDefaultLogger().i("Player", "Indiv license acquired: " + paramDRMLicense);
    this$1.setupPlayer();
  }
  
  public void onError(String paramString, long paramLong)
  {
    GVLogger.getDefaultLogger().e("Player", "Indiv acquisition error: " + paramString);
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.INDIV_LIC_FAIL.getValue(), (int)paramLong, PlayerActivity.access$300(this$1.this$0).getAppData(), paramString);
    this$1.setupPlayer();
  }
  
  public void onStart()
  {
    GVLogger.getDefaultLogger().d("Player", "Started indiv acquisition");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.7.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
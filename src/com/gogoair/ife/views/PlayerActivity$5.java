package com.gogoair.ife.views;

import com.adobe.ave.drm.DRMLicense;
import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayerItem;
import com.gogoair.ife.drm.DRMHelper.DRMLicenseAcquisitionListener;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.Constants.GVInfoCode;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$5
  implements DRMHelper.DRMLicenseAcquisitionListener
{
  PlayerActivity$5(PlayerActivity paramPlayerActivity) {}
  
  public void onAcquired(DRMLicense paramDRMLicense)
  {
    GVLogger.getDefaultLogger().i("Player", "License acquired: " + paramDRMLicense);
    GVLogger.getDefaultLogger().logASP("INFO", Constants.GVInfoCode.DRM_LICENSE_SUCCESS.getValue(), 0, PlayerActivity.access$300(this$0).getAppData(), "DRM License Response Succeeded");
    if ((PlayerActivity.access$1400(this$0) == null) || (PlayerActivity.access$1400(this$0).getCurrentItem() == null)) {
      GVLogger.getDefaultLogger().e("Player", "MediaPlayer is null!");
    }
    while (!PlayerActivity.access$1400(this$0).getCurrentItem().isProtected()) {
      return;
    }
    GVLogger.getDefaultLogger().i("Player", "Begin playback: " + paramDRMLicense);
    this$0.start();
  }
  
  public void onError(String paramString, long paramLong)
  {
    GVLogger.getDefaultLogger().e("Player", "License acquisition error: " + paramString);
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.DRM_LICENSE_FAIL.getValue(), (int)paramLong, PlayerActivity.access$300(this$0).getAppData(), paramString);
    PlayerActivity.access$2200(this$0, Constants.GVErrorCode.DRM_LICENSE_FAIL, (int)paramLong);
  }
  
  public void onStart()
  {
    GVLogger.getDefaultLogger().d("Player", "Started license acquisition");
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
package com.gogoair.ife.views;

import android.os.Handler;
import com.adobe.mediacore.MediaPlayer.QOSEventListener;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import com.adobe.mediacore.qos.LoadInfo;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;

class PlayerActivity$2
  implements MediaPlayer.QOSEventListener
{
  PlayerActivity$2(PlayerActivity paramPlayerActivity) {}
  
  public void onBufferComplete() {}
  
  public void onBufferStart()
  {
    if (PlayerActivity.access$100(this$0) == 0L) {
      PlayerActivity.access$102(this$0, System.currentTimeMillis() - PlayerActivity.access$200(this$0));
    }
  }
  
  public void onLoadInfo(LoadInfo paramLoadInfo) {}
  
  public void onOperationFailed(MediaPlayerNotification.Warning paramWarning)
  {
    GVLogger.getDefaultLogger().w("Player", "Operation failed with warning " + paramWarning);
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.PLAYER_ERROR.getValue(), 0, PlayerActivity.access$300(this$0).getAppData(), paramWarning.toString());
  }
  
  public void onSeekComplete(long paramLong)
  {
    GVLogger.getDefaultLogger().d("Player", "onSeekComplete");
    PlayerActivity.access$500(this$0).removeCallbacks(PlayerActivity.access$400(this$0));
    PlayerActivity.access$600(this$0);
  }
  
  public void onSeekStart()
  {
    GVLogger.getDefaultLogger().d("Player", "onSeekStart");
    PlayerActivity.access$500(this$0).postDelayed(PlayerActivity.access$400(this$0), 3000L);
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
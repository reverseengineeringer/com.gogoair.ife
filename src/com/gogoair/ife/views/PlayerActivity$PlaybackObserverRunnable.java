package com.gogoair.ife.views;

import com.adobe.mediacore.MediaPlayer;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.storage.MediaDb;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.GVLogger;
import java.util.Date;
import org.json.JSONException;
import org.json.JSONObject;

class PlayerActivity$PlaybackObserverRunnable
  implements Runnable
{
  private static final int SAVE_INTERVAL = 10000;
  private long previousSaveTime = 0L;
  
  public PlayerActivity$PlaybackObserverRunnable(PlayerActivity paramPlayerActivity) {}
  
  private void processAccountingGradeLoggingIfNeeded()
  {
    if ((PlayerActivity.access$1000(this$0) <= 0L) || (PlayerActivity.access$300(this$0).getDurationUrl() == null) || (PlayerActivity.access$300(this$0).isPlaybackLogged()) || (PlayerActivity.access$1400(this$0).getCurrentTime() > PlayerActivity.access$1000(this$0))) {
      try
      {
        GVLogger.getDefaultLogger().d("Player", "Accounting grade triggering...");
        PlayerActivity.access$1002(this$0, 0L);
        JSONObject localJSONObject = new JSONObject(PlayerActivity.access$300(this$0).getAppData());
        localJSONObject.put("eventType", "3");
        GVLogger.getDefaultLogger().logAccountingGrade(this$0, localJSONObject.toString(), PlayerActivity.access$300(this$0).getDurationUrl(), PlayerActivity.access$300(this$0));
        return;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
        return;
      }
    }
    GVLogger.getDefaultLogger().d("Player", "Accounting grade logging will trigger after in " + (PlayerActivity.access$1000(this$0) - PlayerActivity.access$1400(this$0).getCurrentTime()) / 1000L + " seconds");
  }
  
  private boolean processContentExpiry()
  {
    if (PlayerActivity.access$300(this$0).timeToExpiryInMillis() > 0L)
    {
      GVLogger.getDefaultLogger().d("Player", "Movie will expire in " + PlayerActivity.access$300(this$0).timeToExpiryInMillis() / 1000L + " seconds.");
      return true;
    }
    PlayerActivity.access$2200(this$0, Constants.GVErrorCode.EXPIRED, 0L);
    return false;
  }
  
  private void savePlaybackPositionIfNeeded()
  {
    long l = new Date().getTime();
    if (l - previousSaveTime > 10000L)
    {
      GVLogger.getDefaultLogger().d("Player", "Saved playback position " + PlayerActivity.access$1400(this$0).getCurrentTime());
      PlayerActivity.access$300(this$0).setPlaybackElapsed((int)PlayerActivity.access$1400(this$0).getCurrentTime());
      PlayerActivity.access$3200(this$0).updateLibraryEntry(PlayerActivity.access$300(this$0));
      previousSaveTime = l;
    }
  }
  
  public void run()
  {
    if ((PlayerActivity.access$300(this$0) != null) && (PlayerActivity.access$1400(this$0) != null))
    {
      processAccountingGradeLoggingIfNeeded();
      savePlaybackPositionIfNeeded();
      if (processContentExpiry()) {
        PlayerActivity.access$1900(this$0);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.PlaybackObserverRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
package com.gogoair.ife.views;

import com.adobe.mediacore.MediaPlayer;
import com.adobe.mediacore.MediaPlayer.PlaybackEventListener;
import com.adobe.mediacore.MediaPlayer.PlayerState;
import com.adobe.mediacore.MediaPlayer.Visibility;
import com.adobe.mediacore.MediaPlayerItem;
import com.adobe.mediacore.MediaPlayerNotification;
import com.adobe.mediacore.info.ClosedCaptionsTrack;
import com.adobe.mediacore.metadata.TimedMetadata;
import com.gogoair.ife.gogo_vision.model.GVLibraryEntry;
import com.gogoair.ife.utils.Constants.GVErrorCode;
import com.gogoair.ife.utils.Constants.GVInfoCode;
import com.gogoair.ife.utils.GVLogger;
import java.util.List;

class PlayerActivity$3
  implements MediaPlayer.PlaybackEventListener
{
  PlayerActivity$3(PlayerActivity paramPlayerActivity) {}
  
  public void onPlayComplete()
  {
    this$0.onBackPressed();
  }
  
  public void onPlayStart()
  {
    if (PlayerActivity.access$2000(this$0) != 0L) {}
    do
    {
      do
      {
        return;
        PlayerActivity.access$2002(this$0, System.currentTimeMillis() - PlayerActivity.access$200(this$0));
      } while (PlayerActivity.access$300(this$0).getLogicalMediaId() == null);
      GVLogger.getDefaultLogger().d("Player", "Seeking to start position " + PlayerActivity.access$1800(this$0));
    } while (PlayerActivity.access$1800(this$0) <= 0);
    this$0.seekTo(PlayerActivity.access$1800(this$0));
  }
  
  public void onPrepared()
  {
    PlayerActivity.access$1002(this$0, PlayerActivity.access$1100(this$0));
    PlayerActivity.access$1202(this$0, true);
    PlayerActivity.access$1302(this$0, PlayerActivity.access$1500(this$0, PlayerActivity.access$1400(this$0).getCurrentItem()));
    if (PlayerActivity.access$1300(this$0).size() > 0)
    {
      GVLogger.getDefaultLogger().d("Player", "Subtitles available, checking user's preferences");
      PlayerActivity.access$1602(this$0, PlayerActivity.access$300(this$0).getSelectedSubtitleIndex());
      if (PlayerActivity.access$1600(this$0) != 0) {
        break label199;
      }
      GVLogger.getDefaultLogger().d("Player", "Subtitles off");
      PlayerActivity.access$1400(this$0).setCCVisibility(MediaPlayer.Visibility.INVISIBLE);
    }
    for (;;)
    {
      PlayerActivity.access$1700(this$0);
      GVLogger.getDefaultLogger().i("Player", "Media prepared. Ready to play it.");
      if (!PlayerActivity.access$1400(this$0).getCurrentItem().isProtected()) {
        this$0.start();
      }
      PlayerActivity.access$1802(this$0, PlayerActivity.access$300(this$0).getPlaybackElapsed());
      PlayerActivity.access$1900(this$0);
      return;
      label199:
      GVLogger.getDefaultLogger().d("Player", "Setting subtitle index to " + PlayerActivity.access$1600(this$0));
      PlayerActivity.access$1400(this$0).setCCVisibility(MediaPlayer.Visibility.VISIBLE);
      ClosedCaptionsTrack localClosedCaptionsTrack = (ClosedCaptionsTrack)PlayerActivity.access$1300(this$0).get(PlayerActivity.access$1600(this$0) - 1);
      if (!PlayerActivity.access$1400(this$0).getCurrentItem().selectClosedCaptionsTrack(localClosedCaptionsTrack)) {
        PlayerActivity.access$1602(this$0, 0);
      }
    }
  }
  
  public void onProfileChanged(long paramLong1, long paramLong2) {}
  
  public void onRatePlaying(float paramFloat)
  {
    GVLogger.getDefaultLogger().i("Player", "New playback rate is playing: ." + Float.toString(paramFloat));
  }
  
  public void onRateSelected(float paramFloat)
  {
    GVLogger.getDefaultLogger().i("Player", "New playback rate has been selected: ." + Float.toString(paramFloat));
  }
  
  public void onReplaceMediaPlayerItem()
  {
    GVLogger.getDefaultLogger().i("Player", "Media player item has been replaced.");
  }
  
  public void onSizeAvailable(long paramLong1, long paramLong2)
  {
    PlayerActivity.access$702(this$0, paramLong2);
    PlayerActivity.access$802(this$0, paramLong1);
    PlayerActivity.access$900(this$0, PlayerActivity.access$700(this$0), PlayerActivity.access$800(this$0));
  }
  
  public void onStateChanged(MediaPlayer.PlayerState paramPlayerState, MediaPlayerNotification paramMediaPlayerNotification)
  {
    GVLogger.getDefaultLogger().logASP("INFO", Constants.GVInfoCode.PLAYER_STATE_CHANGE.getValue(), 0, PlayerActivity.access$300(this$0).getAppData(), paramPlayerState.toString());
    GVLogger.getDefaultLogger().d("Player", "PlayerState: " + paramPlayerState.toString());
    switch (PlayerActivity.11.$SwitchMap$com$adobe$mediacore$MediaPlayer$PlayerState[paramPlayerState.ordinal()])
    {
    default: 
      return;
    case 1: 
      PlayerActivity.access$000(this$0, this$0.getString(2131034140), this$0.getString(2131034139));
      return;
    case 2: 
      PlayerActivity.access$1400(this$0).prepareToPlay();
      return;
    case 3: 
      PlayerActivity.access$600(this$0);
      return;
    case 4: 
    case 5: 
      PlayerActivity.access$2100(this$0);
      return;
    }
    PlayerActivity.access$600(this$0);
    PlayerActivity.access$2100(this$0);
    GVLogger.getDefaultLogger().logASP("ERROR", Constants.GVErrorCode.NOVIDEO.getValue(), 0, PlayerActivity.access$300(this$0).getAppData(), paramMediaPlayerNotification.getDescription());
    PlayerActivity.access$2200(this$0, Constants.GVErrorCode.NOVIDEO, 0L);
    this$0.finish();
  }
  
  public void onTimedMetadata(TimedMetadata paramTimedMetadata) {}
  
  public void onTimelineUpdated() {}
  
  public void onUpdated() {}
}

/* Location:
 * Qualified Name:     com.gogoair.ife.views.PlayerActivity.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
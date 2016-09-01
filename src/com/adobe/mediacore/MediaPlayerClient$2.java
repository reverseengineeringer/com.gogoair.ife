package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdClick;

class MediaPlayerClient$2
  implements MediaPlayer.AdPlaybackEventListener
{
  MediaPlayerClient$2(MediaPlayerClient paramMediaPlayerClient) {}
  
  public void onAdBreakComplete(AdBreak paramAdBreak) {}
  
  public void onAdBreakSkipped(AdBreak paramAdBreak) {}
  
  public void onAdBreakStart(AdBreak paramAdBreak) {}
  
  public void onAdClick(AdBreak paramAdBreak, Ad paramAd, AdClick paramAdClick) {}
  
  public void onAdComplete(AdBreak paramAdBreak, Ad paramAd) {}
  
  public void onAdProgress(AdBreak paramAdBreak, Ad paramAd, int paramInt) {}
  
  public void onAdStart(AdBreak paramAdBreak, Ad paramAd) {}
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerClient.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
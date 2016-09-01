package com.adobe.mediacore;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.adobe.mediacore.logging.Logger;

class MediaPlayerView$ScreenReceiver
  extends BroadcastReceiver
{
  MediaPlayerView$ScreenReceiver(MediaPlayerView paramMediaPlayerView) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent.getAction().equals("android.intent.action.SCREEN_OFF"))
    {
      MediaPlayerView.access$200().i(MediaPlayerView.access$100() + "::ScreenReceiver#onReceive", "Device screen was turned off.");
      MediaPlayerView.access$500(this$0);
    }
    while (!paramIntent.getAction().equals("android.intent.action.SCREEN_ON")) {
      return;
    }
    MediaPlayerView.access$200().i(MediaPlayerView.access$100() + "::ScreenReceiver#onReceive", "Device screen was turned on.");
    MediaPlayerView.access$400(this$0);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerView.ScreenReceiver
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
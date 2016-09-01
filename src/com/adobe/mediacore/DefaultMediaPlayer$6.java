package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class DefaultMediaPlayer$6
  implements ItemUpdatedListener
{
  DefaultMediaPlayer$6(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onUpdated()
  {
    if (DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.ERROR)
    {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onPlayerItemRefreshed", "Ignore event as media player is in ERROR state.");
      return;
    }
    if ((DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.INITIALIZED) || (DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.INITIALIZING) || ((DefaultMediaPlayer.access$1800(this$0) == MediaPlayer.PlayerState.PREPARING) && (!DefaultMediaPlayer.access$2100(this$0))))
    {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onPlayerItemRefreshed", "Ignore event as media player is in PREPARING state.");
      return;
    }
    DefaultMediaPlayer.access$1700(this$0).i(DefaultMediaPlayer.access$1500() + "#onPlayerItemRefreshed", "Media player item refreshed.");
    DefaultMediaPlayer.access$2200(this$0);
    DefaultMediaPlayer.access$100(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.UPDATED));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
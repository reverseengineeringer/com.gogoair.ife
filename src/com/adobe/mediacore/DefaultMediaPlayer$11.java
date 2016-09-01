package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class DefaultMediaPlayer$11
  implements VideoErrorListener
{
  DefaultMediaPlayer$11(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onError(MediaPlayerNotification.Error paramError)
  {
    if (DefaultMediaPlayer.access$2300(this$0, paramError))
    {
      DefaultMediaPlayer.access$1700(this$0).w(DefaultMediaPlayer.access$1500() + "#onPlayerError", "A recoverable error occurred.[" + paramError.getDescription() + "]");
      MediaPlayerNotification.Warning localWarning = MediaPlayerNotification.createWarningNotification(MediaPlayerNotification.WarningCode.PLAYBACK_OPERATION_FAIL, "A recoverable error has occured.");
      localWarning.setInnerNotification(paramError);
      DefaultMediaPlayer.access$100(this$0).dispatch(OperationFailedEvent.createEvent(localWarning));
      return;
    }
    DefaultMediaPlayer.access$1700(this$0).e(DefaultMediaPlayer.access$1500() + "#onPlayerError", "An error occurred. [" + paramError + "]");
    this$0.setStatus(MediaPlayer.PlayerState.ERROR, paramError);
    this$0.stopInternalTimer();
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
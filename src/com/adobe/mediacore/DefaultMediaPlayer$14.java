package com.adobe.mediacore;

class DefaultMediaPlayer$14
  implements PostRollEndListener
{
  DefaultMediaPlayer$14(DefaultMediaPlayer paramDefaultMediaPlayer) {}
  
  public void onComplete()
  {
    this$0.setStatus(MediaPlayer.PlayerState.COMPLETE, null);
    DefaultMediaPlayer.access$100(this$0).dispatch(new MediaPlayerEvent(MediaPlayerEvent.Type.PLAY_COMPLETE));
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.DefaultMediaPlayer.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
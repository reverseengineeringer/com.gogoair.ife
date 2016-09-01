package com.adobe.mediacore;

class TrickPlayManager$1
  implements SeekCompletedListener
{
  TrickPlayManager$1(TrickPlayManager paramTrickPlayManager) {}
  
  public void onCompleted(long paramLong)
  {
    if (TrickPlayManager.access$000(this$0))
    {
      TrickPlayManager.access$002(this$0, false);
      TrickPlayManager.access$100(this$0).dispatch(PlaybackRateEvent.createRatePlayingEvent(1.0F));
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TrickPlayManager.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
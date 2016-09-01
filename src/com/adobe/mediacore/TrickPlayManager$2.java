package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class TrickPlayManager$2
  implements SeekAdjustCompletedListener
{
  TrickPlayManager$2(TrickPlayManager paramTrickPlayManager) {}
  
  public void onAdjustCompleted(long paramLong)
  {
    if (TrickPlayManager.access$200(this$0) != null) {
      TrickPlayManager.access$100(this$0).removeEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, TrickPlayManager.access$200(this$0));
    }
    TrickPlayManager.access$300(this$0).seek(VideoEngineTimeline.TimeMapping.create(-1, paramLong));
    if (TrickPlayManager.access$400(this$0) == 0.0F)
    {
      TrickPlayManager.access$600().i(TrickPlayManager.access$500() + "#changePlaybackRate", "returning to pause mode, position: " + paramLong);
      TrickPlayManager.access$700(this$0).pause();
    }
    for (;;)
    {
      TrickPlayManager.access$002(this$0, false);
      TrickPlayManager.access$902(this$0, -1L);
      return;
      if (TrickPlayManager.access$400(this$0) == 1.0F)
      {
        TrickPlayManager.access$600().i(TrickPlayManager.access$500() + "#changePlaybackRate", "returning to play mode, position: " + paramLong);
        TrickPlayManager.access$700(this$0).play();
      }
      else
      {
        TrickPlayManager.access$600().i(TrickPlayManager.access$500() + "#changePlaybackRate", "returning to slow motion mode, position: " + paramLong);
        TrickPlayManager.access$800(this$0, TrickPlayManager.access$400(this$0));
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.TrickPlayManager.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
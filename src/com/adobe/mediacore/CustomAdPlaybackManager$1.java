package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import java.util.Iterator;

class CustomAdPlaybackManager$1
  implements SeekAdjustCompletedListener
{
  CustomAdPlaybackManager$1(CustomAdPlaybackManager paramCustomAdPlaybackManager) {}
  
  public void onAdjustCompleted(long paramLong)
  {
    if (CustomAdPlaybackManager.access$000(this$0) != null) {
      CustomAdPlaybackManager.access$100(this$0).removeEventListener(MediaPlayerEvent.Type.SEEK_ADJUST_COMPLETED, CustomAdPlaybackManager.access$000(this$0));
    }
    if (CustomAdPlaybackManager.access$200(this$0) == 0L) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
        } while (paramLong < CustomAdPlaybackManager.access$200(this$0));
        CustomAdPlaybackManager.access$302(this$0, null);
        CustomAdPlaybackManager.access$402(this$0, 0);
        localObject = CustomAdPlaybackManager.access$500(this$0).getTimeline().getLastSkippedVPAIDAdBreak(CustomAdPlaybackManager.access$600(this$0), paramLong);
      } while (localObject == null);
      CustomAdPlaybackManager.access$700(this$0, (AdBreak)localObject);
      localObject = ((AdBreak)localObject).adsIterator();
      CustomAdPlaybackManager.access$402(this$0, 0);
    } while (!((Iterator)localObject).hasNext());
    CustomAdPlaybackManager.access$800(this$0, (Ad)((Iterator)localObject).next(), false);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.CustomAdPlaybackManager.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
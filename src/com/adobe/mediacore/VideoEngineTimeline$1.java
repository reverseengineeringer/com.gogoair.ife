package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;

class VideoEngineTimeline$1
  implements Runnable
{
  VideoEngineTimeline$1(VideoEngineTimeline paramVideoEngineTimeline) {}
  
  public void run()
  {
    if ((VideoEngineTimeline.access$000(this$0) != null) && (VideoEngineTimeline.access$000(this$0).getAdBreak() != null))
    {
      VideoEngineTimeline.access$100(this$0).loadContent(VideoEngineTimeline.access$000(this$0).getAdBreak());
      return;
    }
    VideoEngineTimeline.access$300().w(VideoEngineTimeline.access$200() + "#initialise::run", "Loading manifests for ads cannot proceed");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
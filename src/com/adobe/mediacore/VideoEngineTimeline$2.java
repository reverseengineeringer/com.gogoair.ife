package com.adobe.mediacore;

import com.adobe.mediacore.timeline.advertising.Ad;
import com.adobe.mediacore.timeline.advertising.AdAsset;
import com.adobe.mediacore.timeline.advertising.AdBreak;
import com.adobe.mediacore.timeline.advertising.AdBreakPlacement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

class VideoEngineTimeline$2
  implements AdBreakManifestLoadCompleteListener
{
  VideoEngineTimeline$2(VideoEngineTimeline paramVideoEngineTimeline) {}
  
  public void onComplete()
  {
    ArrayList localArrayList1 = new ArrayList();
    ArrayList localArrayList2 = new ArrayList();
    Iterator localIterator = VideoEngineTimeline.access$000(this$0).getAdBreak().adsIterator();
    while (localIterator.hasNext())
    {
      Ad localAd = (Ad)localIterator.next();
      AdHandle localAdHandle = VideoEngineTimeline.access$500(this$0).getHandle(localAd.getPrimaryAsset().getMediaResource().getUrl());
      if (localAdHandle != null)
      {
        localArrayList1.add(localAd);
        localArrayList2.add(localAdHandle);
      }
      else if (localAd.isCustomAdMarker())
      {
        localArrayList1.add(localAd);
      }
    }
    if (localArrayList1.isEmpty())
    {
      VideoEngineTimeline.access$600(this$0);
      return;
    }
    VideoEngineTimeline.access$700(this$0, localArrayList1, localArrayList2);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.VideoEngineTimeline.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
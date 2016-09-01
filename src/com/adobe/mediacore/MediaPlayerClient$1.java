package com.adobe.mediacore;

import com.adobe.mediacore.logging.Logger;

class MediaPlayerClient$1
  implements OpportunityHandledListener
{
  MediaPlayerClient$1(MediaPlayerClient paramMediaPlayerClient) {}
  
  public void onOpportunityHandled(long paramLong)
  {
    MediaPlayerClient.access$200(this$0).i(MediaPlayerClient.access$100() + "#OpportunityHandledListener::onOpportunityHandled", "Release reference for placement complete for HOLD at " + paramLong);
    MediaPlayerClient.access$300(this$0).releaseHoldReference(paramLong);
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.MediaPlayerClient.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
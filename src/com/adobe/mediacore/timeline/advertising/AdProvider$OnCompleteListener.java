package com.adobe.mediacore.timeline.advertising;

import com.adobe.mediacore.MediaPlayerNotification.Error;
import com.adobe.mediacore.MediaPlayerNotification.Warning;
import java.util.List;

public abstract interface AdProvider$OnCompleteListener
{
  public abstract void onComplete(AdProvider paramAdProvider, List paramList);
  
  public abstract void onError(AdProvider paramAdProvider, MediaPlayerNotification.Error paramError);
  
  public abstract void onWarning(AdProvider paramAdProvider, MediaPlayerNotification.Warning paramWarning);
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.timeline.advertising.AdProvider.OnCompleteListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */
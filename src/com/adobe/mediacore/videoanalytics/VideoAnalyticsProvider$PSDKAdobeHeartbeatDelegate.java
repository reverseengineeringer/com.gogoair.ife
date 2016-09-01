package com.adobe.mediacore.videoanalytics;

import com.adobe.mediacore.logging.Log;
import com.adobe.mediacore.logging.Logger;
import com.adobe.primetime.va.ErrorInfo;
import com.adobe.primetime.va.HeartbeatDelegate;

class VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate
  extends HeartbeatDelegate
{
  private final String LOG_TAG = "[PSDK-VA]::" + PSDKAdobeHeartbeatDelegate.class.getSimpleName();
  private final Logger _logger = Log.getLogger(LOG_TAG);
  
  VideoAnalyticsProvider$PSDKAdobeHeartbeatDelegate(VideoAnalyticsProvider paramVideoAnalyticsProvider) {}
  
  public void onError(ErrorInfo paramErrorInfo)
  {
    _logger.e(LOG_TAG + "#onError", "VideoHeartbeat error: " + paramErrorInfo.getMessage() + " (" + paramErrorInfo.getDetails() + ")");
  }
}

/* Location:
 * Qualified Name:     com.adobe.mediacore.videoanalytics.VideoAnalyticsProvider.PSDKAdobeHeartbeatDelegate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */